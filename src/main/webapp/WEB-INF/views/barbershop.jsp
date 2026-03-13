<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<c:url var="resources" value="/resources" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${shopName} - 프리미엄 바버샵</title>
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
            <div class="logo">${shopName}</div>
            <ul class="nav-tabs">
                <li><a href="#hero" onclick="scrollToSection('hero')">홈</a></li>
                <li><a href="#staff" onclick="scrollToSection('staff')">직원소개</a></li>
                <li><a href="#gallery" onclick="scrollToSection('gallery')">갤러리</a></li>
                <li><a href="#location" onclick="scrollToSection('location')">매장정보</a></li>
                <li><a href="/academy">아카데미</a></li>
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
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.5984567891234!2d127.10598765432109!3d37.508934567890123!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca50de1c8ae7d%3A0x63b1a2e6b9a0f7db!2z7ISc7Jq47Yq567OE7IucIOyGoeq1tOq1rCDshJzruITrj5kg7ISd7LG07J2RIDcgMTc0LTE1!5e0!3m2!1sko!2skr!4v1703123456789!5m2!1sko!2skr"
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
    <footer id="footer" class="footer-dark">
        <div class="container">
            <div class="footer-content">
                <div class="footer-left">
                    <div class="footer-info">
                        <h4>${shopName}</h4>
                        <p>최고의 품질과 서비스로 고객님의 만족을 추구하는 프리미엄 바버샵입니다.</p>
                    </div>
                </div>
                
                <div class="footer-right">
                    <div class="footer-contact">
                        <h4>연락처</h4>
                        <div class="contact-info">
                            <p><i class="icon-location">📍</i> ${shopAddress}</p>
                            <p><i class="icon-phone">📞</i> ${shopPhone}</p>
                            <p><i class="icon-email">📧</i> info@barbergarden.com</p>
                            <p><i class="icon-time">🕒</i> 09:00-22:00</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="footer-bottom">
            <div class="container">
                <div class="copyright-content">
                    <div class="copyright-left">
                        <p>Copyrights &copy; 2024 All Rights Reserved by ${shopName}.</p>
                        <div class="footer-links">
                            <a href="#privacy">개인정보처리방침</a>
                            <span>|</span>
                            <a href="#terms">이용약관</a>
                        </div>
                    </div>
                    <div class="copyright-right">
                        <div class="social-icons">
                            <a href="#" class="social-icon facebook" title="Facebook">📘</a>
                            <a href="#" class="social-icon instagram" title="Instagram">📷</a>
                            <a href="#" class="social-icon youtube" title="YouTube">📺</a>
                            <a href="#" class="social-icon kakao" title="KakaoTalk">💬</a>
                        </div>
                    </div>
                </div>
            </div>
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