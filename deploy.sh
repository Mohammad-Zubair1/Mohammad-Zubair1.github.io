#!/usr/bin/env bash
# deploy.sh - initialize git, commit, and optionally create & push a GitHub repo using `gh` (if available)

set -euo pipefail
REPO_NAME="${1:-mohammad-zubair-portfolio}"

echo "=== Deploy helper: initialize git & prepare repo ==="

if ! command -v git >/dev/null 2>&1; then
  echo "git is not installed. Install Git and re-run: https://git-scm.com/downloads"
  exit 1
fi

if [ ! -d .git ]; then
  echo "Initializing local git repository..."
  git init
  git add --all
  git commit -m "chore: initial 2025-trendy portfolio"
  echo "Created initial local commit."
else
  echo "Git repo already exists. Staging changes..."
  git add --all
  if git commit -m "chore: update portfolio $(date +%Y-%m-%d_%H:%M)"; then
    echo "Committed changes."
  else
    echo "No changes to commit."
  fi
fi

if command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) found. Creating remote repository and pushing..."
  gh repo create "$REPO_NAME" --public --source . --remote origin --push
  echo "Created remote and pushed to GitHub."
else
  echo "gh CLI not found. To publish manually, create a repo on GitHub and run:" 
  echo "  git remote add origin https://github.com/<your-username>/$REPO_NAME.git"
  echo "  git branch -M main"
  echo "  git push -u origin main"
fi

echo "Done. Connect this GitHub repo to Netlify or Vercel to deploy the site."
