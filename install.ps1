# Edge Connector Installer
# Usage:
#   Latest stable:      irm https://raw.githubusercontent.com/QuotationFactory/Edge.Connector.Releases/master/install.ps1 | iex
#   Latest prerelease:  $env:PRERELEASE = "true"; irm https://raw.githubusercontent.com/QuotationFactory/Edge.Connector.Releases/master/install.ps1 | iex
#   Specific version:   $env:VERSION = "v0.1.0-beta.5"; irm https://raw.githubusercontent.com/QuotationFactory/Edge.Connector.Releases/master/install.ps1 | iex

param(
    [string]$Version,
    [switch]$PreRelease
)

$ErrorActionPreference = 'Stop'

$GitHubRepo = "QuotationFactory/Edge.Connector.Releases"
$ApiBase = "https://api.github.com/repos/$GitHubRepo"
$TempRoot = Join-Path $env:TEMP "EdgeConnectorInstaller"

# Env var fallback (for irm | iex usage)
if (-not $Version)    { $Version    = $env:VERSION }
if (-not $PreRelease) { $PreRelease = $env:PRERELEASE -eq "true" }

function Write-Step($msg) { Write-Host ">> $msg" -ForegroundColor Cyan }
function Write-Ok($msg)   { Write-Host "   $msg" -ForegroundColor Green }
function Write-Err($msg)  { Write-Host "   $msg" -ForegroundColor Red }

try {
    # ----------------------------------------------------------------
    # 1. Resolve release
    # ----------------------------------------------------------------
    Write-Step "Resolving version..."

    $headers = @{ "User-Agent" = "EdgeConnector-Installer" }

    if ($Version) {
        # Fetch specific tag
        $release = Invoke-RestMethod -Uri "$ApiBase/releases/tags/$Version" -Headers $headers
        Write-Ok "Using specified version: $($release.tag_name)"
    }
    elseif ($PreRelease) {
        # Fetch all releases, pick newest (first)
        $releases = Invoke-RestMethod -Uri "$ApiBase/releases?per_page=1" -Headers $headers
        if (-not $releases -or $releases.Count -eq 0) {
            throw "No releases found in $GitHubRepo."
        }
        $release = $releases[0]
        Write-Ok "Latest (including prerelease): $($release.tag_name)"
    }
    else {
        # Try latest stable
        try {
            $release = Invoke-RestMethod -Uri "$ApiBase/releases/latest" -Headers $headers
            Write-Ok "Latest stable: $($release.tag_name)"
        }
        catch {
            Write-Host "   No stable release found. Falling back to newest release..." -ForegroundColor Yellow
            $releases = Invoke-RestMethod -Uri "$ApiBase/releases?per_page=1" -Headers $headers
            if (-not $releases -or $releases.Count -eq 0) {
                throw "No releases found in $GitHubRepo."
            }
            $release = $releases[0]
            Write-Ok "Using: $($release.tag_name) (prerelease)"
        }
    }

    # ----------------------------------------------------------------
    # 2. Find Installer ZIP asset
    # ----------------------------------------------------------------
    Write-Step "Finding installer asset..."

    $installerAsset = $release.assets | Where-Object { $_.name -like "*Installer*" -and $_.name -like "*.zip" } | Select-Object -First 1

    if (-not $installerAsset) {
        throw "No Installer ZIP found in release $($release.tag_name). Available assets: $($release.assets.name -join ', ')"
    }

    Write-Ok "Found: $($installerAsset.name)"

    # ----------------------------------------------------------------
    # 3. Download ZIP + SHA256SUMS
    # ----------------------------------------------------------------
    $versionDir = Join-Path $TempRoot $release.tag_name
    if (Test-Path $versionDir) { Remove-Item -Recurse -Force $versionDir }
    New-Item -ItemType Directory -Force -Path $versionDir | Out-Null

    $zipPath = Join-Path $versionDir $installerAsset.name

    Write-Step "Downloading $($installerAsset.name)..."
    Invoke-WebRequest -Uri $installerAsset.browser_download_url -OutFile $zipPath -UseBasicParsing
    Write-Ok "Downloaded to $zipPath"

    # Download SHA256SUMS if available
    $sumAsset = $release.assets | Where-Object { $_.name -like "*SHA256SUMS*" } | Select-Object -First 1

    if ($sumAsset) {
        Write-Step "Verifying checksum..."
        $sumPath = Join-Path $versionDir $sumAsset.name
        Invoke-WebRequest -Uri $sumAsset.browser_download_url -OutFile $sumPath -UseBasicParsing

        $expectedHash = (Get-Content $sumPath | Where-Object { $_ -like "*$($installerAsset.name)*" }) -replace '\s+.*$', ''
        $actualHash = (Get-FileHash -Algorithm SHA256 $zipPath).Hash.ToLowerInvariant()

        if ($expectedHash -and $actualHash -ne $expectedHash) {
            throw "Checksum mismatch!`n  Expected: $expectedHash`n  Actual:   $actualHash"
        }

        Write-Ok "Checksum verified."
    }
    else {
        Write-Host "   SHA256SUMS not found, skipping verification." -ForegroundColor Yellow
    }

    # ----------------------------------------------------------------
    # 4. Extract
    # ----------------------------------------------------------------
    $extractDir = Join-Path $versionDir "installer"
    Write-Step "Extracting..."
    Expand-Archive -Path $zipPath -DestinationPath $extractDir -Force
    Write-Ok "Extracted to $extractDir"

    # ----------------------------------------------------------------
    # 5. Launch installer (elevated)
    # ----------------------------------------------------------------
    $installerExe = Join-Path $extractDir "EdgeConnectorSetup.exe"

    if (-not (Test-Path $installerExe)) {
        throw "EdgeConnectorSetup.exe not found in extracted files."
    }

    Write-Step "Launching installer (requesting admin elevation)..."

    $proc = Start-Process -FilePath $installerExe -Verb RunAs -Wait -PassThru
    if ($proc.ExitCode -ne 0) {
        Write-Err "Installer exited with code $($proc.ExitCode)."
    }
    else {
        Write-Ok "Installer completed successfully."
    }
}
catch {
    Write-Err "Installation failed: $_"
    exit 1
}
finally {
    # Clean up env vars
    $env:VERSION = $null
    $env:PRERELEASE = $null

    # Clean up temp files
    if (Test-Path $versionDir) {
        try { Remove-Item -Recurse -Force $versionDir } catch { }
    }
}
