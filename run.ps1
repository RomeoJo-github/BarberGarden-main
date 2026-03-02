# BarberGarden 프로젝트 실행 스크립트

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "BarberGarden 프로젝트 실행" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Java 확인
Write-Host "[1/3] Java 설치 확인 중..." -ForegroundColor Yellow
try {
    $javaVersion = java -version 2>&1 | Select-Object -First 1
    Write-Host "✓ Java 확인됨: $javaVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Java가 설치되어 있지 않습니다!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Java 설치가 필요합니다:" -ForegroundColor Yellow
    Write-Host "  1. https://adoptium.net/ 에서 Java JDK 다운로드" -ForegroundColor White
    Write-Host "  2. 설치 후 환경 변수 JAVA_HOME 설정" -ForegroundColor White
    Write-Host "  3. PowerShell 재시작 후 다시 실행" -ForegroundColor White
    Write-Host ""
    Write-Host "자세한 내용은 SETUP_GUIDE.md 파일을 참고하세요." -ForegroundColor Yellow
    exit 1
}

# 프로젝트 디렉토리로 이동
Write-Host ""
Write-Host "[2/3] 프로젝트 디렉토리 확인 중..." -ForegroundColor Yellow
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptPath
Write-Host "✓ 작업 디렉토리: $scriptPath" -ForegroundColor Green

# Maven 경로 확인
$mavenPath = Join-Path $scriptPath "apache-maven-3.8.6\bin\mvn.cmd"
if (-not (Test-Path $mavenPath)) {
    Write-Host "✗ Maven을 찾을 수 없습니다: $mavenPath" -ForegroundColor Red
    exit 1
}

# 빌드 및 실행
Write-Host ""
Write-Host "[3/3] 프로젝트 빌드 및 실행 중..." -ForegroundColor Yellow
Write-Host "서버가 시작되면 브라우저에서 http://localhost:8080/ 접속하세요." -ForegroundColor Cyan
Write-Host "서버를 중지하려면 Ctrl+C를 누르세요." -ForegroundColor Cyan
Write-Host ""

try {
    & $mavenPath clean compile tomcat7:run
} catch {
    Write-Host ""
    Write-Host "✗ 실행 중 오류가 발생했습니다." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit 1
}
