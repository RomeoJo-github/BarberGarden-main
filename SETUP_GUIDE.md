# BarberGarden 프로젝트 로컬 실행 가이드

## 필수 요구사항

이 프로젝트를 로컬에서 실행하기 위해 다음이 필요합니다:

### 1. Java JDK 설치 (필수)

**현재 상태**: Java가 설치되어 있지 않습니다.

**설치 방법**:
1. **Oracle JDK** 또는 **OpenJDK** 다운로드
   - 권장 버전: Java 8 이상 (프로젝트는 Java 1.6 이상 요구)
   - 다운로드 링크:
     - Oracle JDK: https://www.oracle.com/java/technologies/downloads/
     - OpenJDK: https://adoptium.net/ (권장)

2. **설치 후 환경 변수 설정**:
   - `JAVA_HOME`: Java 설치 경로 (예: `C:\Program Files\Java\jdk-17`)
   - `PATH`에 `%JAVA_HOME%\bin` 추가

3. **설치 확인**:
   ```powershell
   java -version
   javac -version
   ```

### 2. Maven (선택사항 - 프로젝트에 포함됨)

프로젝트에 Maven 3.8.6이 포함되어 있습니다 (`apache-maven-3.8.6` 폴더).

**Maven을 시스템에 설치하려면**:
- 다운로드: https://maven.apache.org/download.cgi
- 환경 변수 `MAVEN_HOME` 설정
- `PATH`에 `%MAVEN_HOME%\bin` 추가

**또는 프로젝트에 포함된 Maven 사용**:
- 프로젝트 폴더의 `apache-maven-3.8.6\bin\mvn.cmd` 사용

## 실행 방법

### 방법 1: Maven Tomcat 플러그인 사용 (권장)

```powershell
# 프로젝트 디렉토리로 이동
cd C:\dev\BarberGarden\workspace\BarberGarden

# 프로젝트에 포함된 Maven 사용
.\apache-maven-3.8.6\bin\mvn.cmd clean compile
.\apache-maven-3.8.6\bin\mvn.cmd tomcat7:run
```

서버가 시작되면 브라우저에서 `http://localhost:8080/` 접속

### 방법 2: WAR 파일 생성 후 Tomcat에 배포

```powershell
# WAR 파일 생성
.\apache-maven-3.8.6\bin\mvn.cmd clean package

# 생성된 WAR 파일: target\app-1.0.0-BUILD-SNAPSHOT.war
# 이 파일을 Tomcat의 webapps 폴더에 복사
```

### 방법 3: IDE에서 실행 (Eclipse/IntelliJ)

1. 프로젝트를 IDE로 열기
2. Maven 프로젝트로 인식
3. Run Configuration에서 Tomcat 서버 설정
4. 서버 실행

## 빠른 시작 스크립트

Java 설치 후 다음 스크립트를 실행하세요:

**run.ps1** (PowerShell):
```powershell
# Java 확인
if (-not (Get-Command java -ErrorAction SilentlyContinue)) {
    Write-Host "Java가 설치되어 있지 않습니다. Java를 먼저 설치해주세요."
    exit 1
}

# 프로젝트 디렉토리로 이동
Set-Location $PSScriptRoot

# Maven으로 빌드 및 실행
.\apache-maven-3.8.6\bin\mvn.cmd clean compile tomcat7:run
```

## 문제 해결

### Java가 인식되지 않는 경우
- 환경 변수 `JAVA_HOME`이 올바르게 설정되었는지 확인
- PowerShell을 재시작
- `java -version` 명령어로 확인

### Maven 빌드 실패 시
- 인터넷 연결 확인 (의존성 다운로드 필요)
- `~/.m2/repository` 폴더 확인
- `mvn clean` 후 다시 시도

### 포트 8080이 이미 사용 중인 경우
- `pom.xml`에서 포트 번호 변경:
  ```xml
  <configuration>
      <port>8081</port>
  </configuration>
  ```

## 다음 단계

1. Java JDK 설치
2. 환경 변수 설정
3. 위의 실행 방법 중 하나 선택하여 실행
4. 브라우저에서 `http://localhost:8080/` 접속 확인
