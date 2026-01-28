$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $repoRoot

flutter test --coverage
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}

$lcovPath = Join-Path $repoRoot "coverage\\lcov.info"
if (-not (Test-Path $lcovPath)) {
  Write-Error "coverage/lcov.info not found."
  exit 1
}

$daLines = Get-Content $lcovPath | Where-Object { $_ -match '^DA:' }
$total = $daLines.Count
$hit = ($daLines | ForEach-Object { ($_ -split ',')[1] } | Where-Object { [int]$_ -gt 0 }).Count
$percent = if ($total -gt 0) { [math]::Round(($hit / $total) * 100, 2) } else { 0 }

Write-Host ("Coverage: {0}% ({1}/{2} lines hit)" -f $percent, $hit, $total)
