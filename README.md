# BarberGarden - 바버샵 홍보 페이지

프리미엄 바버샵 **BarberGarden**의 홍보 웹사이트입니다.

## 🎯 주요 기능

### 📱 반응형 웹 디자인
- 모바일, 태블릿, 데스크톱 모든 기기에서 최적화된 화면 제공
- 부드러운 스크롤 애니메이션과 인터랙티브 UI

### 🏠 히어로 메인 섹션 
- 풀스크린 백그라운드 영상 지원
- 깔끔한 흰색 테마와 우아한 타이포그래피
- 커스텀 부드러운 스크롤 애니메이션

### 📸 홍보사진 갤러리
- 가로 스크롤 갤러리 (좌우 네비게이션 버튼)
- 매장 외관, 시술 공간, 전문 서비스 사진
- 호버 효과와 클릭 인터랙션
- 터치/드래그 스크롤 지원

### 👥 직원소개
- 전문 바버 및 스타일리스트 프로필
- 경력과 전문분야 소개

### 📍 매장위치
- 상세 주소, 연락처, 운영시간 정보
- **실제 Google Maps 지도 연동** (석촌동 174-15)
- 지도 오버레이 정보창 (주소, 큰 지도 링크)
- 대중교통 안내

### 🦶 Footer 섹션
- 가로 배치된 균등한 2컬럼 레이아웃
- 회사 소개 및 통계 정보 (애니메이션 카운터)
- 연락처 정보 및 운영시간
- 소셜 미디어 링크 (Facebook, Instagram, YouTube, KakaoTalk)
- 저작권 정보 및 정책 링크
- Go To Top 버튼 (스크롤 300px 이상 시 표시)
- **카카오톡 문의하기** 고정 버튼 (우측 하단 상시 표시)

## 🛠 기술 스택

- **Backend**: Spring MVC 3.1.1
- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Template Engine**: JSP
- **Build Tool**: Maven
- **Server**: Apache Tomcat

## 📁 프로젝트 구조

```
BarberGarden/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/barber/app/
│   │   │       └── HomeController.java
│   │   ├── resources/
│   │   └── webapp/
│   │       ├── resources/
│   │       │   ├── css/
│   │       │   │   └── barbershop.css
│   │       │   └── js/
│   │       │       └── barbershop.js
│   │       └── WEB-INF/
│   │           ├── views/
│   │           │   └── barbershop.jsp
│   │           ├── spring/
│   │           └── web.xml
│   └── test/
├── pom.xml
└── README.md
```

## 🚀 설치 및 실행 방법

### 1. 사전 요구사항

**필수:**
- **Java JDK 1.6 이상** (권장: Java 8 이상)
  - 다운로드: https://adoptium.net/ (OpenJDK 권장)
  - 설치 후 환경 변수 `JAVA_HOME` 설정 필요
  - 설치 확인: `java -version`

**선택사항:**
- Maven 3.0 이상 (프로젝트에 Maven 3.8.6 포함되어 있음)
- Apache Tomcat 7.0 이상 (Maven 플러그인으로 자동 실행됨)

### 2. IDE에서 실행 (권장)

#### Eclipse/Spring Tool Suite
1. `File` → `Import` → `Existing Maven Projects`
2. 프로젝트 폴더 선택
3. 프로젝트 우클릭 → `Run As` → `Run on Server`
4. Tomcat 서버 선택 후 실행

#### IntelliJ IDEA
1. `File` → `Open` → 프로젝트 폴더 선택
2. Maven 프로젝트로 인식 후 import
3. Run Configuration에서 Tomcat 서버 설정
4. 서버 실행

### 3. 터미널에서 실행

#### 방법 1: 실행 스크립트 사용 (가장 간단) ⭐

**Windows PowerShell:**
```powershell
.\run.ps1
```

**Windows 명령 프롬프트:**
```cmd
run.bat
```

#### 방법 2: 프로젝트에 포함된 Maven 사용

**Windows PowerShell:**
```powershell
# 프로젝트 디렉토리로 이동
cd C:\dev\BarberGarden\workspace\BarberGarden

# 빌드 및 실행
.\apache-maven-3.8.6\bin\mvn.cmd clean compile tomcat7:run
```

**Windows 명령 프롬프트:**
```cmd
cd C:\dev\BarberGarden\workspace\BarberGarden
apache-maven-3.8.6\bin\mvn.cmd clean compile tomcat7:run
```

#### 방법 3: 시스템에 Maven이 설치된 경우

```bash
# 빌드 및 실행
mvn clean compile tomcat7:run

# 또는 WAR 파일 생성 후 Tomcat에 배포
mvn clean package
# target/app-1.0.0-BUILD-SNAPSHOT.war를 Tomcat webapps 폴더에 복사
```

#### Java 17 사용 시 (Tomcat 7 호환용)
Java 17에서 실행하려면 터미널에서 `MAVEN_OPTS`를 설정한 뒤 실행하세요.

**PowerShell:**
```powershell
$env:MAVEN_OPTS="--add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.base/java.util.concurrent=ALL-UNNAMED --add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED"
.\apache-maven-3.8.6\bin\mvn.cmd tomcat7:run
```

### 4. 웹 브라우저에서 확인
- 기본 URL: `http://localhost:8080/`
- 포트번호는 `pom.xml`에서 설정 가능 (기본값: 8080)
- 서버 중지: 터미널에서 `Ctrl+C` 누르기

### 5. Docker로 실행

**필수:** [Docker Desktop](https://www.docker.com/products/docker-desktop/) 설치 후 실행

**PowerShell / 터미널:**
```powershell
cd C:\dev\BarberGarden\workspace\BarberGarden

# 이미지 빌드
docker build -t barbergarden .

# 컨테이너 실행 (8080 포트)
docker run -p 8080:8080 --name barbergarden barbergarden
```

- 접속: `http://localhost:8080/`
- 컨테이너 중지: `docker stop barbergarden`
- 컨테이너 삭제: `docker rm barbergarden`

## 🎨 커스터마이징

### 매장 정보 수정
`src/main/java/com/barber/app/HomeController.java`에서 다음 정보를 수정하세요:

```java
model.addAttribute("shopName", "BarberGarden");           // 매장명
model.addAttribute("shopDescription", "프리미엄 바버샵 서비스"); // 매장 설명
model.addAttribute("shopAddress", "서울시 강남구 바버가든로 123"); // 주소
model.addAttribute("shopPhone", "02-1234-5678");          // 전화번호
```

### 스타일 커스터마이징
- `src/main/webapp/resources/css/barbershop.css`에서 색상, 폰트, 레이아웃 수정
- CSS 변수를 활용하여 브랜드 컬러 통일 가능

### 기능 추가
- `src/main/webapp/resources/js/barbershop.js`에서 인터랙션 기능 추가
- 예약 시스템, 온라인 상담 등 연동 가능

### 백그라운드 영상 추가
1. `src/main/webapp/resources/video/` 폴더 생성
2. 바버샵 홍보 영상을 `barbershop-intro.mp4` 파일명으로 저장
3. `barbershop.jsp`에서 주석 처리된 video 태그의 주석 해제
4. 플레이스홀더 div 제거

```html
<video autoplay muted loop>
    <source src="${resources}/video/barbershop-intro.mp4" type="video/mp4">
    <source src="${resources}/video/barbershop-intro.webm" type="video/webm">
</video>
```

### Footer 사용자 정의

**통계 수치 변경:**
`barbershop.jsp`에서 `data-target` 속성값 수정:
```html
<div class="counter"><span data-target="1000">0</span>+</div>
```

**소셜 미디어 링크 연결:**
`barbershop.js`에서 실제 URL로 연결:
```javascript
// 예시: Facebook 링크 연결
if (this.classList.contains('facebook')) {
    window.open('https://facebook.com/barbergarden', '_blank');
}
```

### 갤러리 사용법

**가로 스크롤 기능:**
- 마우스 휠로 좌우 스크롤
- 좌우 네비게이션 버튼 클릭
- 모바일에서 터치 드래그

**갤러리 아이템 추가:**
`barbershop.jsp`에서 새로운 갤러리 아이템 추가:
```html
<div class="gallery-item fade-in">
    <div class="gallery-placeholder">새 이미지</div>
    <div class="gallery-content">
        <h3 class="gallery-title">제목</h3>
        <p>설명</p>
    </div>
</div>
```

### 지도 사용법

**Google Maps 지도 변경:**
`barbershop.jsp`에서 iframe의 `src` URL 변경:

1. [Google Maps](https://maps.google.com)에서 원하는 위치 검색
2. 공유 → 지도 퍼가기 → HTML 복사
3. JSP 파일의 iframe src에 붙여넣기

**카카오맵으로 변경 (옵션):**
```html
<!-- 카카오맵 예시 -->
<div id="kakao-map" style="width:100%;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_APP_KEY"></script>
```

### 카카오톡 문의 버튼 설정

**실제 카카오톡 채널 연결:**
`barbershop.js`의 `openKakaoTalk()` 함수에서 주석 해제:

```javascript
// 카카오톡 플러스친구/채널 연결
window.open('https://pf.kakao.com/_your_channel_id', '_blank');

// 또는 오픈채팅방 연결
window.open('https://open.kakao.com/o/your_open_chat_id', '_blank');
```

**카카오톡 채널 생성 방법:**
1. [카카오톡 채널 관리자센터](https://center-pf.kakao.com/)에서 채널 생성
2. 채널 ID 복사 후 JavaScript 코드에 적용
3. 채널 프로필 설정 및 자동응답 메시지 구성

## 📋 추가 개발 계획

- [ ] 실제 이미지 업로드 및 관리
- [ ] 예약 시스템 연동
- [ ] 고객 후기 섹션
- [ ] 다국어 지원
- [ ] SEO 최적화
- [x] 소셜 미디어 연동 (완료)
- [ ] 관리자 페이지
- [ ] 개인정보처리방침/이용약관 페이지 구현
- [ ] 실제 소셜 미디어 링크 연결
- [ ] Newsletter 구독 기능

## 📞 문의사항

프로젝트 관련 문의나 개선 사항이 있으시면 언제든 연락주세요!

---

**BarberGarden** - 당신의 스타일을 완성하는 프리미엄 바버샵 ✂️ 