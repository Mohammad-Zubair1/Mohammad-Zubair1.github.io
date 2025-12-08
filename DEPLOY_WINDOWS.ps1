# 🚀 Mohammad Zubair Portfolio - Automated Deployment Script
# Windows PowerShell Version

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "  Mohammad Zubair Portfolio Deploy" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Check if Git is installed
$gitExists = $null -ne (Get-Command git -ErrorAction SilentlyContinue)

if (-not $gitExists) {
    Write-Host "⚠️  Git is not installed. Please install Git first:" -ForegroundColor Yellow
    Write-Host "https://git-scm.com/download/win"
    exit 1
}

Write-Host "Choose deployment option:" -ForegroundColor Blue
Write-Host "1) Vercel (Recommended - Free & Fast)" -ForegroundColor Green
Write-Host "2) Netlify (Free & Easy)" -ForegroundColor Green
Write-Host "3) GitHub Pages (Free)" -ForegroundColor Green
Write-Host "4) Manual Setup Guide" -ForegroundColor Green
Write-Host ""

$choice = Read-Host "Enter choice (1-4)"

switch ($choice) {
    "1" {
        Write-Host ""
        Write-Host "🚀 Vercel Deployment Setup" -ForegroundColor Green
        Write-Host "=============================" -ForegroundColor Green
        Write-Host ""
        Write-Host "Step 1: Install Vercel CLI"
        Write-Host "  Command: npm install -g vercel"
        Write-Host ""
        Write-Host "Step 2: Deploy"
        Write-Host "  Command: vercel"
        Write-Host "  (Run in your project folder and follow prompts)"
        Write-Host ""
        Write-Host "Step 3: Your portfolio will be LIVE in seconds!"
        Write-Host ""
        Write-Host "Your URL will be: https://portfolio.vercel.app" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "Ready to deploy? Install Node.js first:" -ForegroundColor Yellow
        Write-Host "https://nodejs.org/" -ForegroundColor Yellow
    }
    "2" {
        Write-Host ""
        Write-Host "🚀 Netlify Deployment Setup" -ForegroundColor Green
        Write-Host "=============================" -ForegroundColor Green
        Write-Host ""
        Write-Host "Super Simple Steps:"
        Write-Host "1. Go to: https://netlify.com"
        Write-Host "2. Click: New site → Deploy manually"
        Write-Host "3. Drag & drop your project folder"
        Write-Host "4. Get instant live URL!"
        Write-Host ""
        Write-Host "That's literally it! No CLI needed." -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Your URL will be: https://your-site.netlify.app" -ForegroundColor Cyan
    }
    "3" {
        Write-Host ""
        Write-Host "🚀 GitHub Pages Setup" -ForegroundColor Green
        Write-Host "======================" -ForegroundColor Green
        Write-Host ""
        
        $githubUser = Read-Host "Enter your GitHub username"
        Write-Host ""
        Write-Host "Creating Git repository..." -ForegroundColor Yellow
        
        # Initialize Git
        & git init
        & git add .
        & git commit -m "Initial portfolio commit - Mohammad Zubair"
        & git branch -M main
        
        Write-Host ""
        Write-Host "⚠️  You need a GitHub Personal Access Token" -ForegroundColor Yellow
        Write-Host "Create one: https://github.com/settings/tokens" -ForegroundColor Yellow
        Write-Host ""
        
        $githubToken = Read-Host "Paste your GitHub token (or press Enter to do manually)"
        
        if ($githubToken) {
            Write-Host ""
            Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
            
            & git remote add origin "https://$($githubUser):$($githubToken)@github.com/$($githubUser)/portfolio.git"
            & git push -u origin main
            
            Write-Host ""
            Write-Host "✅ Repository uploaded!" -ForegroundColor Green
        } else {
            Write-Host ""
            Write-Host "Manual steps:" -ForegroundColor Yellow
            Write-Host "1. Create repo on https://github.com/new"
            Write-Host "2. Name it: portfolio"
            Write-Host "3. Run:"
            Write-Host "   git remote add origin https://github.com/$($githubUser)/portfolio.git"
            Write-Host "   git push -u origin main"
        }
        
        Write-Host ""
        Write-Host "Enable GitHub Pages:" -ForegroundColor Cyan
        Write-Host "1. Go to: https://github.com/$($githubUser)/portfolio/settings"
        Write-Host "2. Scroll to 'Pages'"
        Write-Host "3. Set source to: main branch"
        Write-Host "4. Save"
        Write-Host ""
        Write-Host "Your site will be at: https://$($githubUser).github.io/portfolio" -ForegroundColor Green
    }
    "4" {
        Write-Host ""
        Write-Host "📖 Deployment Options Guide" -ForegroundColor Cyan
        Write-Host "============================" -ForegroundColor Cyan
        Write-Host ""
        
        Write-Host "FASTEST (Recommend): Netlify" -ForegroundColor Green
        Write-Host "  • Go to netlify.com"
        Write-Host "  • Drag & drop folder"
        Write-Host "  • Get live URL in 10 seconds"
        Write-Host ""
        
        Write-Host "MOST PROFESSIONAL: Vercel" -ForegroundColor Green
        Write-Host "  • Used by top companies"
        Write-Host "  • Auto-deploys from GitHub"
        Write-Host "  • Perfect for portfolio"
        Write-Host ""
        
        Write-Host "FREE & SIMPLE: GitHub Pages" -ForegroundColor Green
        Write-Host "  • Free with GitHub account"
        Write-Host "  • URL: yourname.github.io/portfolio"
        Write-Host "  • Version control included"
        Write-Host ""
        
        Write-Host "CUSTOM DOMAIN (Optional)" -ForegroundColor Cyan
        Write-Host "  • Deploy to Vercel/Netlify first"
        Write-Host "  • Buy domain from Namecheap (~$1.88/year)"
        Write-Host "  • Point to your hosting provider"
        Write-Host ""
    }
    default {
        Write-Host "Invalid choice. Please run again." -ForegroundColor Red
        exit 1
    }
}

Write-Host ""
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "✨ Choose an option above and get online!" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Questions? Check the PUBLISHING_GUIDE.md file" -ForegroundColor Yellow
