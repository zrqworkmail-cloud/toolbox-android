@echo off
chcp 65001 >nul
cd /d "%~dp0"

REM Repo URL already set to your account; just double-click to push.
set REPO=https://github.com/zrqworkmail-cloud/toolbox-android.git

if not exist .git (
  git init
)
git add .
git commit -m "init toolbox app"
git branch -M main

git remote get-url origin >nul 2>&1
if errorlevel 1 (
  git remote add origin %REPO%
)

git push -u origin main
if errorlevel 1 (
  echo.
  echo [FAIL] push failed. Check:
  echo   1) Replace REPLACE_ME in REPO URL above with your GitHub username
  echo   2) The GitHub repo already created (empty, no README)
  echo   3) GitHub credentials signed in (or use GitHub Desktop to push)
  pause
  exit /b 1
)
echo.
echo [OK] Pushed. Go to repo Actions tab, wait 3-5 min for auto-built apk.
pause
