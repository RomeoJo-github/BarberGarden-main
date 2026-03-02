# BarberGarden 폴더를 GitHub 레포지토리에 올리는 스크립트
# 사용법: PowerShell에서 .\push-to-github.ps1 실행
# 또는 Cursor 터미널에서 실행

$ErrorActionPreference = "Stop"
$repoPath = "C:\dev\BarberGarden\workspace\BarberGarden"
$remoteUrl = "https://github.com/RomeoJo-github/BarberGarden-main.git"

Set-Location $repoPath

# Git 설치 확인
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git이 설치되어 있지 않거나 PATH에 없습니다." -ForegroundColor Red
    Write-Host "https://git-scm.com/download/win 에서 Git for Windows를 설치한 뒤 다시 실행하세요." -ForegroundColor Yellow
    exit 1
}

# 이미 원격이 있으면 제거 후 다시 추가 (충돌 방지)
$existing = git remote get-url origin 2>$null
if ($existing) {
    git remote remove origin 2>$null
}

# 초기화 및 첫 커밋
if (-not (Test-Path ".git")) {
    git init
    git add .
    git commit -m "Initial commit: BarberGarden 홍보 페이지"
} else {
    git add .
    $status = git status --short
    if ($status) {
        git commit -m "Update: BarberGarden 홍보 페이지"
    }
}

git branch -M main
git remote add origin $remoteUrl

Write-Host "원격 저장소로 푸시 중..." -ForegroundColor Cyan
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "완료! https://github.com/RomeoJo-github/BarberGarden-main 에서 확인하세요." -ForegroundColor Green
} else {
    Write-Host "푸시 실패. GitHub 로그인(또는 Personal Access Token)이 필요할 수 있습니다." -ForegroundColor Yellow
    Write-Host "브라우저에서 로그인 창이 뜨면 인증 후 다시 .\push-to-github.ps1 를 실행하세요." -ForegroundColor Yellow
}
