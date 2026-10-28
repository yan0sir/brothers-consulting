# Builds the static site: src/ -> site/
# Usage (from the project root): powershell -ExecutionPolicy Bypass -File tools\build.ps1
#
# Pages live in src/pages (Arabic in src/pages/ar). Each page starts with a meta block:
#   <!--meta
#   title: About | Brothers Consulting
#   description: ...
#   active: about          (home | about | services | contact; optional)
#   noindex: true          (optional)
#   -->
# Tokens available in pages and layouts:
#   {{root}} {{address}} {{cr}} {{mapsUrl}} {{icon:NAME}} (any file in src/icons)
#   {{icon:whatsapp}} {{icon:phone}} {{icon:arrow}} {{pair}}
# Any [[...]] in visible text is wrapped in <span class="ph"> so placeholders stay obvious.
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$src = Join-Path $root 'src'
$out = Join-Path $root 'site'
$utf8 = New-Object Text.UTF8Encoding $false
function Read-Text($p) { [IO.File]::ReadAllText($p, [Text.Encoding]::UTF8) }

$cfg = Read-Text (Join-Path $src 'site.json') | ConvertFrom-Json
$icons = @{}
Get-ChildItem (Join-Path $src 'icons') -Filter *.svg | ForEach-Object { $icons[$_.BaseName] = (Read-Text $_.FullName).Trim() }
$layouts = @{ en = Read-Text (Join-Path $src 'layouts\en.html'); ar = Read-Text (Join-Path $src 'layouts\ar.html') }

function Wrap-Placeholders([string]$html) {
  # Only touch text between tags, never attribute values.
  $parts = [regex]::Split($html, '(<[^>]+>)')
  for ($i = 0; $i -lt $parts.Length; $i++) {
    if (-not $parts[$i].StartsWith('<')) {
      $parts[$i] = [regex]::Replace($parts[$i], '\[\[[^\]]+\]\]', '<span class="ph">$0</span>')
    }
  }
  -join $parts
}

# Clean output (keep the folder itself so a running preview server is unaffected)
if (Test-Path $out) { Get-ChildItem $out -Force | Remove-Item -Recurse -Force } else { New-Item -ItemType Directory $out | Out-Null }
Copy-Item (Join-Path $src 'assets') (Join-Path $out 'assets') -Recurse

$pagesDir = Join-Path $src 'pages'
$pages = Get-ChildItem $pagesDir -Recurse -Filter *.html
$arExists = @{}; $pages | Where-Object { $_.DirectoryName -like '*\ar' } | ForEach-Object { $arExists[$_.Name] = $true }
$count = 0
foreach ($p in $pages) {
  $rel = $p.FullName.Substring($pagesDir.Length + 1).Replace('\', '/')
  $isAr = $rel.StartsWith('ar/')
  $lang = if ($isAr) { 'ar' } else { 'en' }
  $depth = ($rel.Split('/').Count - 1)
  $prefix = ('../' * $depth)

  $raw = Read-Text $p.FullName
  $meta = @{}
  $m = [regex]::Match($raw, '^\s*<!--meta(.*?)-->', 'Singleline')
  if ($m.Success) {
    foreach ($line in $m.Groups[1].Value -split "`n") {
      if ($line -match '^\s*([\w-]+)\s*:\s*(.+?)\s*$') { $meta[$Matches[1]] = $Matches[2] }
    }
    $raw = $raw.Substring($m.Length)
  }
  $html = $layouts[$lang].Replace('{{content}}', $raw.Trim("`r", "`n"))

  # Language switch + alternate links
  $name = [IO.Path]::GetFileName($rel)
  $langSwitch = ''; $alternate = ''
  if ($cfg.showArabic) {
    if ($isAr) {
      $langSwitch = "<a class=`"lang-switch`" href=`"${prefix}$name`" lang=`"en`" hreflang=`"en`">English</a>"
      $alternate = "<link rel=`"alternate`" hreflang=`"en`" href=`"${prefix}$name`">"
    } else {
      $target = if ($arExists[$name]) { "ar/$name" } else { 'ar/index.html' }
      $langSwitch = "<a class=`"lang-switch`" href=`"${prefix}$target`" lang=`"ar`" hreflang=`"ar`">عربي</a>"
      if ($arExists[$name]) { $alternate = "<link rel=`"alternate`" hreflang=`"ar`" href=`"${prefix}ar/$name`">" }
    }
  }
  # Globe language menu (header) and language pills (mobile menu)
  $langMenu = ''; $langMobile = ''
  if ($cfg.showLanguageMenu) {
    $arTarget = if ($isAr) { "${prefix}ar/$name" } elseif ($arExists[$name]) { "${prefix}ar/$name" } else { "${prefix}ar/index.html" }
    $enTarget = "${prefix}$name"
    $curEn = if ($isAr) { '' } else { ' aria-current="true"' }
    $curAr = if ($isAr) { ' aria-current="true"' } else { '' }
    $chkEn = if ($isAr) { '' } else { $icons['check'] }
    $chkAr = if ($isAr) { $icons['check'] } else { '' }
    $code = if ($isAr) { 'AR' } else { 'EN' }
    $menuLabel = if ($isAr) { 'اللغة' } else { 'Language' }
    $langMenu = "<details class=`"lang-menu`"><summary class=`"lang-menu__btn`" aria-label=`"$menuLabel`">$($icons['globe'])<span class=`"lang-menu__label`">$code</span>$($icons['chevron'])</summary>" +
      "<div class=`"lang-menu__list`"><a href=`"$enTarget`" lang=`"en`" hreflang=`"en`"$curEn>English $chkEn</a>" +
      "<a href=`"$arTarget`" lang=`"ar`" hreflang=`"ar`"$curAr>العربية $chkAr</a></div></details>"
    $langMobile = "<div class=`"mobile-menu__langs`"><a href=`"$enTarget`" lang=`"en`" hreflang=`"en`"$curEn>$($icons['globe']) English</a>" +
      "<a href=`"$arTarget`" lang=`"ar`" hreflang=`"ar`"$curAr>العربية</a></div>"
  }
  $legal = ''
  if ($cfg.showLegal) {
    $base = if ($isAr) { "${prefix}ar/" } else { $prefix }
    $legal = if ($isAr) { "<p><a href=`"${base}privacy.html`">الخصوصية</a> · <a href=`"${base}terms.html`">الشروط</a></p>" }
             else { "<p><a href=`"${base}privacy.html`">Privacy</a> · <a href=`"${base}terms.html`">Terms</a></p>" }
  }
  $noindex = ($meta['noindex'] -eq 'true') -or ($isAr -and -not $cfg.showArabic)
  $robots = if ($noindex) { '<meta name="robots" content="noindex">' } else { '' }

  $tokens = [ordered]@{
    '{{title}}' = $meta['title']; '{{description}}' = $meta['description']; '{{robots}}' = $robots
    '{{alternate}}' = $alternate; '{{langSwitch}}' = $langSwitch; '{{legalLinks}}' = $legal
    '{{langMenu}}' = $langMenu; '{{langMobile}}' = $langMobile
    '{{address}}' = $cfg.address.$lang; '{{cr}}' = $cfg.cr
    '{{mapsUrl}}' = $cfg.mapsUrl
    '{{icon:whatsapp}}' = $icons['whatsapp']; '{{icon:phone}}' = $icons['phone']; '{{icon:arrow}}' = $icons['arrow']
    '{{pair}}' = $icons['pair']; '{{mark}}' = $icons['mark']
  }
  foreach ($k in $tokens.Keys) { $html = $html.Replace($k, [string]$tokens[$k]) }
  foreach ($k in $icons.Keys) { $html = $html.Replace("{{icon:$k}}", $icons[$k]) }
  foreach ($nav in 'home','about','services','contact') {
    $html = $html.Replace("{{current:$nav}}", $(if ($meta['active'] -eq $nav) { ' aria-current="page"' } else { '' }))
  }
  $html = $html.Replace('{{root}}', $prefix)
  $left = [regex]::Matches($html, '\{\{[^}]+\}\}') | ForEach-Object { $_.Value } | Select-Object -Unique
  if ($left) { Write-Warning "$rel has unknown tokens: $($left -join ', ')" }
  $html = Wrap-Placeholders $html

  $dest = Join-Path $out $rel.Replace('/', '\')
  New-Item -ItemType Directory -Force (Split-Path $dest) | Out-Null
  [IO.File]::WriteAllText($dest, $html, $utf8)
  $count++
}
"Built $count pages into site/"
