# Minimal static file server for local preview (no installs needed).
# Usage: powershell -ExecutionPolicy Bypass -File tools\serve.ps1 [-Port 4321] [-Root site]
param([int]$Port = 4321, [string]$Root = (Join-Path $PSScriptRoot '..\site'))
$Root = (Resolve-Path $Root).Path
$types = @{
  '.html'='text/html; charset=utf-8'; '.css'='text/css; charset=utf-8'; '.js'='text/javascript; charset=utf-8'
  '.svg'='image/svg+xml'; '.png'='image/png'; '.jpg'='image/jpeg'; '.webp'='image/webp'; '.avif'='image/avif'
  '.ico'='image/x-icon'; '.json'='application/json'; '.woff2'='font/woff2'; '.txt'='text/plain; charset=utf-8'; '.xml'='application/xml'
}
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$Port/")
$listener.Start()
Write-Host "Serving $Root at http://localhost:$Port/"
try {
  while ($listener.IsListening) {
    $ctx = $listener.GetContext()
    try {
    $path = [Uri]::UnescapeDataString($ctx.Request.Url.AbsolutePath).TrimStart('/')
    if ($path -eq '' -or $path.EndsWith('/')) { $path += 'index.html' }
    $file = [IO.Path]::GetFullPath((Join-Path $Root $path))
    if (-not $file.StartsWith($Root)) { $file = $null }
    if ($file -and -not [IO.Path]::HasExtension($file) -and (Test-Path "$file.html")) { $file = "$file.html" }
    $status = 200
    if (-not $file -or -not (Test-Path $file -PathType Leaf)) { $status = 404; $file = Join-Path $Root '404.html' }
    $res = $ctx.Response
    $res.StatusCode = $status
    $res.Headers['Cache-Control'] = 'no-store'
    if (Test-Path $file -PathType Leaf) {
      $ext = [IO.Path]::GetExtension($file).ToLower()
      $res.ContentType = $(if ($types[$ext]) { $types[$ext] } else { 'application/octet-stream' })
      $bytes = [IO.File]::ReadAllBytes($file)
      if ($ctx.Request.HttpMethod -ne 'HEAD') { $res.OutputStream.Write($bytes, 0, $bytes.Length) }
    }
    $res.Close()
    Write-Host "$status $($ctx.Request.Url.AbsolutePath)"
    } catch {
      Write-Host "error $($ctx.Request.Url.AbsolutePath): $($_.Exception.Message)"
      try { $ctx.Response.Abort() } catch {}
    }
  }
} finally { $listener.Stop() }
