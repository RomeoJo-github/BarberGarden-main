@echo off
REM BarberGarden 프로젝트 실행 스크립트 (Windows 배치 파일)

echo ========================================
echo BarberGarden 프로젝트 실행
echo ========================================
echo.

REM Java 확인
echo [1/3] Java 설치 확인 중...
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo [오류] Java가 설치되어 있지 않습니다!
    echo.
    echo Java 설치가 필요합니다:
    echo   1. https://adoptium.net/ 에서 Java JDK 다운로드
    echo   2. 설치 후 환경 변수 JAVA_HOME 설정
    echo   3. 명령 프롬프트 재시작 후 다시 실행
    echo.
    echo 자세한 내용은 SETUP_GUIDE.md 파일을 참고하세요.
    pause
    exit /b 1
)
echo [확인] Java 설치됨

REM 프로젝트 디렉토리로 이동
echo.
echo [2/3] 프로젝트 디렉토리 확인 중...
cd /d "%~dp0"
echo [확인] 작업 디렉토리: %CD%

REM Maven 경로 확인
if not exist "apache-maven-3.8.6\bin\mvn.cmd" (
    echo [오류] Maven을 찾을 수 없습니다.
    pause
    exit /b 1
)

REM 빌드 및 실행
echo.
echo [3/3] 프로젝트 빌드 및 실행 중...
echo 서버가 시작되면 브라우저에서 http://localhost:8080/ 접속하세요.
echo 서버를 중지하려면 Ctrl+C를 누르세요.
echo.

call apache-maven-3.8.6\bin\mvn.cmd clean compile tomcat7:run

pause
