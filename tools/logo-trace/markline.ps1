# Builds src/icons/markline.svg: an extra-smooth outline of the logo mark for the animated hero line.
# Smoother than the logo files (decorative use only). Usage: powershell -File tools\logo-trace\markline.ps1
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
Add-Type -AssemblyName System.Drawing
if (-not ('Tracer' -as [type])) { Add-Type -Path (Join-Path $PSScriptRoot 'Tracer.cs') -ReferencedAssemblies System.Drawing }
$w = 0; $h = 0
$cov = [Tracer]::Coverage((Join-Path $root 'docs\assets\logo-supplied.png'), [ref]$w, [ref]$h)
$raw = [Tracer]::Contours($cov, $w, $h, 8, 3, 0.5)
$loops = New-Object 'System.Collections.Generic.List[Loop]'
foreach ($r in $raw) {
  $minX = ($r | Measure-Object X -Minimum).Minimum; $minY = ($r | Measure-Object Y -Minimum).Minimum
  if (-not ($minX -lt 50 -and $minY -lt 30)) { continue }            # the mark only
  $sm = [Tracer]::SmoothClosed($r, 2.6, 80, 3.0)                      # heavy smoothing, keep real corners
  $simp = [Tracer]::SimplifyClosed($sm, 0.16)
  $loops.Add([Tracer]::Fit($simp, 85))
}
$loops = @($loops | Sort-Object MinX)
$minX = ($loops | Measure-Object MinX -Minimum).Minimum; $minY = ($loops | Measure-Object MinY -Minimum).Minimum
$maxX = ($loops | Measure-Object MaxX -Maximum).Maximum; $maxY = ($loops | Measure-Object MaxY -Maximum).Maximum
$pad = 0.6
$ox = $minX - $pad; $oy = $minY - $pad
$inv = [Globalization.CultureInfo]::InvariantCulture
$vb = '0 0 {0} {1}' -f ([math]::Round($maxX - $minX + 2 * $pad, 2)).ToString($inv), ([math]::Round($maxY - $minY + 2 * $pad, 2)).ToString($inv)
$d = @($loops | ForEach-Object { $one = New-Object 'System.Collections.Generic.List[Loop]'; $one.Add($_); [Tracer]::PathData($one, $ox, $oy) })
$layers = ''
for ($s = 0; $s -lt 2; $s++) { for ($l = 1; $l -le 6; $l++) { $layers += "<path class=`"t s$($s+1) l$l`" d=`"$($d[$s])`" pathLength=`"1000`"/>" } }
$svg = @"
<svg class="markline" viewBox="$vb" aria-hidden="true" focusable="false">
  <g class="markline__base"><path d="$($d[0])" pathLength="1000"/><path d="$($d[1])" pathLength="1000"/></g>
  <g class="markline__trail">$layers</g>
</svg>
"@
[IO.File]::WriteAllText((Join-Path $root 'src\icons\markline.svg'), $svg, (New-Object Text.UTF8Encoding $false))
"markline: viewBox $vb, segments " + (($loops | ForEach-Object { $_.Segs.Count }) -join '+')
$all = New-Object 'System.Collections.Generic.List[Loop]'; $loops | ForEach-Object { $all.Add($_) }
[Tracer]::Render($all, $w, $h, 12, [Drawing.Color]::FromArgb(0x49,0x35,0x4B), [Drawing.Color]::White, (Join-Path $PSScriptRoot 'out\markline-preview.png'))
