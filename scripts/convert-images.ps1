# PowerShell helper to convert images in screenshots/ to WebP using Node script
# Usage: from repository root run: pwsh ./scripts/convert-images.ps1

$node = Get-Command node -ErrorAction SilentlyContinue
if (-not $node) {
    Write-Error "Node.js is not installed or not in PATH. Install Node.js first: https://nodejs.org/"
    exit 1
}

if (-not (Test-Path "./scripts/convert-images.js")) {
    Write-Error "Missing ./scripts/convert-images.js. Ensure the Node script exists."
    exit 1
}

# Ensure dependencies
if (-not (Test-Path "./package.json")) {
    Write-Output "Creating package.json and installing dependencies..."
    npm init -y | Out-Null
}

npm install sharp --save-dev | Out-Null

# Run the converter
node ./scripts/convert-images.js "$PWD/screenshots" --quality 80

Write-Output "Conversion complete. WebP files written alongside originals in screenshots/."