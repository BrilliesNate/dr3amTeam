$Root = $PSScriptRoot

$env:DEV_ENV_ROOT = $Root
$env:HOME = "$Root\config\home"
$env:USERPROFILE = "$Root\config\home"
$env:APPDATA = "$Root\config\appdata"
$env:LOCALAPPDATA = "$Root\config\localappdata"
$env:NPM_CONFIG_CACHE = "$Root\cache\npm"
$env:YARN_CACHE_FOLDER = "$Root\cache\yarn"
$env:VSCODE_PORTABLE = "$Root\apps\vscode\data"
$env:GIT_PAGER = "cat"
$env:PAGER = "cat"

$env:PATH = @(
    "$Root\bin"
    "$Root\apps\node"
    "$Root\apps\git\cmd"
    "$Root\apps\yarn\bin"
    $env:PATH
) -join ";"

foreach ($directory in @(
    $env:HOME,
    $env:APPDATA,
    $env:LOCALAPPDATA,
    $env:NPM_CONFIG_CACHE,
    $env:YARN_CACHE_FOLDER
)) {
    New-Item $directory -ItemType Directory -Force | Out-Null
}

$name = git config --global --get user.name

if ([string]::IsNullOrWhiteSpace($name)) {
    $name = Read-Host "Enter your full name"
    git config --global user.name $name
}

$email = git config --global --get user.email

if ([string]::IsNullOrWhiteSpace($email)) {
    $email = Read-Host "Enter your Stellenbosch University e-mail address"
    git config --global user.email $email
}

Set-Location "$Root\projects"

Write-Host "Organisational Informatics 348 Development Environment"
Write-Host "Node: $(node --version)"
Write-Host "Git:  $(git --version)"
Write-Host "Yarn: $(yarn --version)"
Write-Host ""
Write-Host "Working directory: $PWD"
Write-Host ""
