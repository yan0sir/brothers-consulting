# Traces the raster logo into smooth vector outlines.
# Usage: .\trace.ps1 -Png <logo.png> -OutDir <folder>
param([string]$Png, [string]$OutDir, [int]$S = 8)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
if (-not ('Tracer' -as [type])) { Add-Type -Path (Join-Path $PSScriptRoot 'Tracer.cs') -ReferencedAssemblies System.Drawing }

# Per-region settings: the mark is large and simple, the tagline is tiny.
#            sigma  cornerDeg  cornerScale  eps
$cfg = @{
  mark     = @(0.9, 40, 1.5, 0.05)
  wordmark = @(0.55, 50, 0.9, 0.04)
  tagline  = @(0.3, 55, 0.5, 0.035)
}
function Region($r) {
  $minX = ($r | Measure-Object X -Minimum).Minimum; $minY = ($r | Measure-Object Y -Minimum).Minimum
  if ($minX -lt 50 -and $minY -lt 30) { 'mark' } elseif ($minY -gt 55) { 'tagline' } else { 'wordmark' }
}

$w = 0; $h = 0
$cov = [Tracer]::Coverage($Png, [ref]$w, [ref]$h)
$raw = [Tracer]::Contours($cov, $w, $h, $S, 3, 0.5)
$all = New-Object 'System.Collections.Generic.List[Loop]'
$groups = @{ mark = New-Object 'System.Collections.Generic.List[Loop]'; wordmark = New-Object 'System.Collections.Generic.List[Loop]'; tagline = New-Object 'System.Collections.Generic.List[Loop]' }
foreach ($r in $raw) {
  $g = Region $r; $c = $cfg[$g]
  $sm = [Tracer]::SmoothClosed($r, $c[0], $c[1], $c[2])
  $simp = [Tracer]::SimplifyClosed($sm, $c[3])
  if ($simp.Count -lt 3) { continue }
  $l = [Tracer]::Fit($simp, 50)
  if ($l.Area -lt 0.4) { continue }
  $all.Add($l); $groups[$g].Add($l)
}
$maxd = 0.0; $iou = 0.0
$mad = [Tracer]::Compare($all, $cov, $w, $h, [ref]$maxd, [ref]$iou)
foreach ($k in 'mark','wordmark','tagline') { "$k loops=$($groups[$k].Count) segs=$(($groups[$k] | % { $_.Segs.Count } | Measure-Object -Sum).Sum)" }
"meanAbsDiff=$([math]::Round($mad,4)) maxDiff=$([math]::Round($maxd,3)) IoU=$([math]::Round($iou,4))"
New-Item -ItemType Directory -Force $OutDir | Out-Null
[Tracer]::Render($all, $w, $h, 8, [System.Drawing.Color]::FromArgb(0x49,0x35,0x4B), [System.Drawing.Color]::White, (Join-Path $OutDir 'preview-8x.png'))
$global:TraceGroups = $groups; $global:TraceW = $w; $global:TraceH = $h
