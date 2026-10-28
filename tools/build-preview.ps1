# Prepares a copy of site/ for publishing as a claude.ai preview artifact.
# The artifact host wraps its main page in its own <html>/<head>/<body>, so the home page's outer tags
# are removed here; every other page and asset is copied unchanged.
# Usage (from the project root): powershell -ExecutionPolicy Bypass -File tools\build-preview.ps1
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
& (Join-Path $PSScriptRoot 'build.ps1') | Out-Null
$site = Join-Path $root 'site'
$out = Join-Path $root '.preview'
if (Test-Path $out) { Remove-Item $out -Recurse -Force }
Copy-Item $site $out -Recurse

$f = Join-Path $out 'index.html'
$html = [IO.File]::ReadAllText($f, [Text.Encoding]::UTF8)
$html = [regex]::Replace($html, '<!doctype html>\s*', '', 'IgnoreCase')
$html = [regex]::Replace($html, '</?(html|head|body)\b[^>]*>\s*', '', 'IgnoreCase')
$html = [regex]::Replace($html, '<meta charset="utf-8">\s*', '')
$html = [regex]::Replace($html, '<meta name="viewport"[^>]*>\s*', '')
$html = [regex]::Replace($html, '<title>.*?</title>', '<title>Brothers Consulting Website</title>')
[IO.File]::WriteAllText($f, $html, (New-Object Text.UTF8Encoding $false))

Get-ChildItem $out -Recurse -File | Where-Object { $_.FullName -ne $f } |
  ForEach-Object { $_.FullName.Substring($out.Length + 1).Replace('\', '/') }
