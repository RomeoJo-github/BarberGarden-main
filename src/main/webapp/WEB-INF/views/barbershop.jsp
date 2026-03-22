<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<c:url var="resources" value="/resources" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="${resources}/images/favicon.png">
    <title>바버가든</title>
    <meta name="description" content="바버가든 - 잠실 남성전문 바버샵. 스킨페이드, 하이엔탑, 남자펌, 염색 등 모든 남성 헤어를 시술합니다.">
    <link rel="stylesheet" href="${resources}/css/barbershop.css">
    <!-- 추가 사용자 정의 스타일이 필요한 경우 여기에 작성 -->
    <style>
        /* 페이지별 커스텀 스타일 */
    </style>
</head>
<body>
    <!-- 헤더 네비게이션 -->
    <header class="header">
        <div class="nav-container">
            <div class="logo"><a href="/">${shopName}</a></div>
            <button class="hamburger" id="hamburger" aria-label="메뉴 열기">
                <span></span>
                <span></span>
                <span></span>
            </button>
            <ul class="nav-tabs" id="nav-tabs">
                <li><a href="#hero" class="active" onclick="closeMenu(); scrollToSection('hero'); return false;">홈</a></li>
                <li class="nav-dropdown">
                    <a href="#" class="nav-dropdown-toggle" onclick="return false;">바버샵 ▾</a>
                    <ul class="dropdown-menu">
                        <li><a href="#staff" onclick="closeMenu(); scrollToSection('staff'); return false;">직원소개</a></li>
                        <li><a href="#gallery" onclick="closeMenu(); scrollToSection('gallery'); return false;">갤러리</a></li>
                        <li><a href="#location" onclick="closeMenu(); scrollToSection('location'); return false;">매장정보</a></li>
                    </ul>
                </li>
                <li class="nav-dropdown">
                    <a href="#" class="nav-dropdown-toggle" onclick="return false;">바버아카데미 ▾</a>
                    <ul class="dropdown-menu">
                        <li><a href="/academy/courses" onclick="closeMenu()">과정 및 가격</a></li>
                        <li><a href="/academy/reviews" onclick="closeMenu()">후기</a></li>
                        <li><a href="/academy/qna" onclick="closeMenu()">QnA</a></li>
                    </ul>
                </li>
                <li><a href="/community" onclick="closeMenu()">커뮤니티</a></li>
                <li><a href="${naverBookingUrl}" class="nav-naver-booking" onclick="closeMenu()" target="_blank" rel="noopener noreferrer" title="네이버 예약">
                    <img src="${resources}/images/naver-booking.png" alt="네이버 예약">
                </a></li>
            </ul>
        </div>
    </header>

    <!-- 메인 컨텐츠 -->
    <main class="main-content">
        <!-- 히어로 섹션 (메인 랜딩) -->
        <section id="hero" class="section hero-section">
            <div class="hero-background">
                <c:choose>
                    <%-- 관리자에서 영상을 등록한 경우 --%>
                    <c:when test="${not empty hero and not empty hero.videoUrl}">
                        <video autoplay muted loop playsinline>
                            <source src="${hero.videoUrl}" type="video/mp4">
                            영상을 지원하지 않는 브라우저입니다.
                        </video>
                    </c:when>
                    <%-- 관리자에서 이미지를 등록한 경우 --%>
                    <c:when test="${not empty hero and not empty hero.imageUrl}">
                        <div style="width:100%; height:100%; background-image: url('${hero.imageUrl}'); background-size: cover; background-position: center;"></div>
                    </c:when>
                </c:choose>
            </div>
            <div class="hero-overlay"></div>
            <div class="hero-content">
                <h1 class="hero-title">${shopName}</h1>
                <c:choose>
                    <c:when test="${not empty hero and not empty hero.title}">
                        <p class="hero-subtitle">${hero.title}</p>
                        <p class="hero-description">${hero.description}</p>
                    </c:when>
                    <c:otherwise>
                        <p class="hero-subtitle">프리미엄 바버샵에서 경험하는 완벽한 스타일링</p>
                        <p class="hero-description">전문 바버들의 정교한 기술과 최고급 시설에서<br>당신만의 특별한 스타일을 완성해보세요</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>



        <!-- 직원소개 섹션 -->
        <section id="staff" class="section staff-section">
            <div class="container">
                <h2 class="section-title fade-in">직원소개</h2>
                <div class="staff-grid">
                    <c:forEach items="${staffList}" var="staff" begin="0" end="1">
                        <div class="staff-card fade-in">
                            <c:choose>
                                <c:when test="${not empty staff.imageUrl}">
                                    <div class="staff-photo" style="background-image: url('${staff.imageUrl}'); background-size: cover; background-position: center;"></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="staff-photo">${staff.title.substring(0,1)}</div>
                                </c:otherwise>
                            </c:choose>
                            <h3 class="staff-name">${staff.title}</h3>
                            <p class="staff-role">${not empty staff.role ? staff.role : 'Barber'}</p>
                            <p class="staff-description">${staff.description}</p>
                        </div>
                    </c:forEach>
                </div>
                
                <!-- 직원소개 더보기 버튼 -->
                <div class="section-more-btn fade-in">
                    <a href="/staff" class="btn btn-primary">직원소개 더보기 →</a>
                </div>
            </div>
        </section>

        <!-- 홍보사진 섹션 -->
        <section id="gallery" class="section gallery-section">
            <div class="container">
                <h2 class="section-title fade-in">홍보사진</h2>
                <p class="gallery-subtitle fade-in">← 좌우로 스크롤하여 더 많은 사진을 확인하세요 →</p>
                <div class="gallery-container">
                    <button class="gallery-nav gallery-nav-left" onclick="scrollGallery('left')">‹</button>
                    <div class="gallery-grid">
                        <c:forEach items="${galleryList}" var="gallery">
                            <div class="gallery-item fade-in">
                                <c:choose>
                                    <c:when test="${not empty gallery.imageUrl}">
                                        <div class="gallery-image" style="background-image: url('${gallery.imageUrl}'); background-size: cover; background-position: center; height: 300px;"></div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="gallery-placeholder">${gallery.title}</div>
                                    </c:otherwise>
                                </c:choose>
                                <div class="gallery-content">
                                    <h3 class="gallery-title">${gallery.title}</h3>
                                    <p>${gallery.description}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <button class="gallery-nav gallery-nav-right" onclick="scrollGallery('right')">›</button>
                </div>
                
                <!-- 갤러리 더보기 버튼 -->
                <div class="section-more-btn fade-in">
                    <a href="/gallery" class="btn btn-primary">갤러리 더보기 →</a>
                </div>
            </div>
        </section>

        <!-- 매장정보 섹션 -->
        <section id="location" class="section location-section">
            <div class="container">
                <h2 class="section-title fade-in">매장정보</h2>
                <div class="location-content">
                    <div class="location-info fade-in">
                        <div class="info-item">
                            <div class="info-icon">📍</div>
                            <div>
                                <h4>주소</h4>
                                <p>${shopAddress}</p>
                            </div>
                        </div>
                        <div class="info-item">
                            <div class="info-icon">📞</div>
                            <div>
                                <h4>전화번호</h4>
                                <p>${shopPhone}</p>
                            </div>
                        </div>
                        <div class="info-item">
                            <div class="info-icon">🕒</div>
                            <div>
                                <h4>운영시간</h4>
                                <p>평일: 10:00 - 21:00<br>
                                   주말: 10:00 - 21:00</p>
                            </div>
                        </div>
                    </div>
                    <div class="map-container fade-in">
                        <iframe 
                            src="${googleMapsUrl}"
                            width="100%" 
                            height="400" 
                            style="border:0;" 
                            allowfullscreen="" 
                            loading="lazy" 
                            referrerpolicy="no-referrer-when-downgrade"
                            title="BarberGarden 매장 위치">
                        </iframe>
                        <div class="map-overlay">
                            <div class="map-info">
                                <h4>📍 BarberGarden 위치</h4>
                                <p>${shopAddress}</p>
                                <a href="https://maps.google.com?q=석촌동+174-15" target="_blank" class="map-link">
                                    큰 지도로 보기 →
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                

            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer id="footer" class="footer-simple">
        <div class="footer-simple-inner">
            <p class="footer-brand">바버가든</p>
            <p>대표 : 김희영 &nbsp;|&nbsp; 사업자 번호 : 104-11-22-127</p>
            <p>TEL : 010-5539-0831</p>
            <p>주소 : 05616 서울특별시 송파구 송파대로 447 2층</p>
            <p>정보관리자 : 조재영 &nbsp;(romeo4648@gmail.com)</p>
            <p class="footer-copy">
                Copyrights &copy; 2024 All Rights Reserved by BarberGarden.
                <span style="margin-left: 1rem; display: inline-flex; align-items: center; gap: 0.4rem;">
                    <span class="social-icons">
                        <a href="${instagramUrl}" target="_blank" rel="noopener noreferrer" class="social-icon instagram" title="Instagram">📷</a>
                        <a href="${youtubeUrl}" target="_blank" rel="noopener noreferrer" class="social-icon youtube" title="YouTube">📺</a>
                        <a href="${naverBookingUrl}" target="_blank" rel="noopener noreferrer" class="social-icon naver" title="네이버 예약">🟢</a>
                    </span>
                </span>
            </p>
        </div>
    </footer>

    <!-- 고정 버튼들 -->
    <div class="fixed-buttons">
        <!-- Go To Top 버튼 -->
        <div id="gotoTop" class="goto-top">
            <span>↑</span>
        </div>
    </div>

    <!-- JavaScript 파일 연결 -->
    <script src="${resources}/js/barbershop.js"></script>
</body>
</html> 