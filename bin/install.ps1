param(
  [string]$MATLAB_VERSION,
  [string]$INSTALL_DIR,
  [string]$TOOLBOXES
)

$mpmPath = Join-Path $PSScriptRoot "mpm.exe"

if (-not (Test-Path $mpmPath)) {
    Write-Host "Downloading MPM..."
    Invoke-WebRequest -Uri "https://www.mathworks.com/mpm/win64/mpm.exe" -OutFile $mpmPath
}

& $mpmPath install --release=$MATLAB_VERSION --destination=$INSTALL_DIR --products=$TOOLBOXES

Write-Host "MATLAB $MATLAB_VERSION with toolboxes [$TOOLBOXES] installed at $INSTALL_DIR"
