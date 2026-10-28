# Traces the logo and writes the SVG set to brand/logo/.
# Usage (from the project root): .\tools\logo-trace\export.ps1
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$out = Join-Path $root 'brand\logo'
& (Join-Path $PSScriptRoot 'trace.ps1') -Png (Join-Path $root 'docs\assets\logo-supplied.png') -OutDir (Join-Path $PSScriptRoot 'out')
New-Item -ItemType Directory -Force $out | Out-Null

$plum = '#49354B'; $ivory = '#F7F4EF'
$g = $global:TraceGroups
function BBox($loops) {
  [pscustomobject]@{
    MinX = ($loops | Measure-Object MinX -Minimum).Minimum; MinY = ($loops | Measure-Object MinY -Minimum).Minimum
    MaxX = ($loops | Measure-Object MaxX -Maximum).Maximum; MaxY = ($loops | Measure-Object MaxY -Maximum).Maximum
  }
}
function N($v) { [math]::Round($v, 2).ToString([Globalization.CultureInfo]::InvariantCulture) }

function Write-Svg($file, $parts, $fill, $title, [double]$padPct = 0, [switch]$Square) {
  $loops = @(); foreach ($p in $parts) { $loops += $g[$p] }
  $b = BBox $loops
  $w = $b.MaxX - $b.MinX; $h = $b.MaxY - $b.MinY
  $pad = [math]::Max($w, $h) * $padPct
  $ox = $b.MinX - $pad; $oy = $b.MinY - $pad; $vw = $w + 2 * $pad; $vh = $h + 2 * $pad
  if ($Square) { $side = [math]::Max($vw, $vh); $ox -= ($side - $vw) / 2; $oy -= ($side - $vh) / 2; $vw = $side; $vh = $side }
  $body = foreach ($p in $parts) {
    "  <path id=`"$p`" fill-rule=`"evenodd`" d=`"$([Tracer]::PathData($g[$p], $ox, $oy))`"/>"
  }
  $svg = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 $(N $vw) $(N $vh)" role="img" aria-labelledby="t">
  <title id="t">$title</title>
  <g fill="$fill">
$($body -join "`n")
  </g>
</svg>
"@
  [IO.File]::WriteAllText((Join-Path $out $file), $svg, (New-Object Text.UTF8Encoding $false))
  "{0,-48} {1,6:N0} bytes  viewBox {2} x {3}" -f $file, (Get-Item (Join-Path $out $file)).Length, (N $vw), (N $vh)
}

$name = 'Brothers Consulting Company W.L.L'
Write-Svg 'brothers-consulting-logo.svg'                  @('mark','wordmark','tagline') $plum  $name
Write-Svg 'brothers-consulting-logo-reversed.svg'         @('mark','wordmark','tagline') $ivory $name
Write-Svg 'brothers-consulting-logo-no-tagline.svg'          @('mark','wordmark') $plum  'Brothers Consulting'
Write-Svg 'brothers-consulting-logo-no-tagline-reversed.svg' @('mark','wordmark') $ivory 'Brothers Consulting'
Write-Svg 'brothers-consulting-symbol.svg'                @('mark') $plum  'Brothers Consulting' 0.08 -Square
Write-Svg 'brothers-consulting-symbol-reversed.svg'       @('mark') $ivory 'Brothers Consulting' 0.08 -Square

# Previews: realistic header size (2x original) and a large size.
$all = New-Object 'System.Collections.Generic.List[Loop]'; foreach ($k in 'mark','wordmark','tagline') { $all.AddRange($g[$k]) }
[Tracer]::Render($all, $global:TraceW, $global:TraceH, 2, [Drawing.Color]::FromArgb(0x49,0x35,0x4B), [Drawing.Color]::FromArgb(0xF7,0xF4,0xEF), (Join-Path $PSScriptRoot 'out\preview-2x.png'))
