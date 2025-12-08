# PowerShell deploy helper
[CmdletBinding()]
param(
  [string]$RepoName = "mohammad-zubair-portfolio"
)

Write-Host "=== Deploy helper: initialize git & prepare repo ===" -ForegroundColor Cyan

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  Write-Error "git is not installed. Please install Git: https://git-scm.com/downloads"
  exit 1
}

if (-not (Test-Path .git)) {
  Write-Host "Initializing local git repository..."
  git init
  git add --all
  git commit -m "chore: initial 2025-trendy portfolio"
  Write-Host "Created initial local commit." -ForegroundColor Green
} else {
  Write-Host "Git repository already present. Staging and committing changes..."
  git add --all
  git commit -m "chore: update portfolio $(Get-Date -Format yyyy-MM-dd_HH-mm)" || Write-Host "No changes to commit."
}

if (Get-Command gh -ErrorAction SilentlyContinue) {
  Write-Host "GitHub CLI detected. Creating remote repo and pushing..." -ForegroundColor Cyan
  gh repo create $RepoName --public --source . --remote origin --push
  Write-Host "Repository created and pushed to GitHub." -ForegroundColor Green
  Write-Host "Open your repo on GitHub to connect Netlify / Vercel and deploy." -ForegroundColor Yellow
} else {
  Write-Host "GitHub CLI (gh) not found. To publish manually, create a repository on GitHub then run:" -ForegroundColor Yellow
  Write-Host "  git remote add origin https://github.com/<your-username>/$RepoName.git"
  Write-Host "  git branch -M main"
  Write-Host "  git push -u origin main"
}

Write-Host "Done. Next step: connect this GitHub repository to Netlify or Vercel for automatic deploys." -ForegroundColor Cyan
