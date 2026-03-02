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
</head>
<body>
    <!-- 헤더 네비게이션 -->
    <header class="header">
        <div class="nav-container">
            <div class="logo">${shopName}</div>
            <ul class="nav-tabs">
                <li><a href="/" class="active">홈</a></li>
                <li><a href="/staff">직원소개</a></li>
                <li><a href="/gallery">갤러리</a></li>
                <li><a href="/location">매장정보</a></li>
            </ul>
        </div>
    </header>

    <!-- 메인 컨텐츠 -->
    <main class="main-content">
        <!-- 히어로 섹션 (메인 랜딩) -->
        <section id="hero" class="section hero-section">
            <div class="hero-background">
                <!-- 백그라운드 영상 -->
                <video autoplay muted loop>
                    <source src="${resources}/video/barbershop-intro.mp4" type="video/mp4">
                    영상을 지원하지 않는 브라우저입니다.
                </video>
            </div>
            <div class="hero-overlay"></div>
            <div class="hero-content">
                <h1 class="hero-title">${shopName}</h1>
                <p class="hero-subtitle">프리미엄 바버샵에서 경험하는 완벽한 스타일링</p>
                <p class="hero-description">전문 바버들의 정교한 기술과 최고급 시설에서<br>당신만의 특별한 스타일을 완성해보세요</p>
                
                <!-- 더보기 버튼들 -->
                <div class="hero-buttons">
                    <a href="/staff" class="btn btn-primary">직원소개 보기</a>
                    <a href="/gallery" class="btn btn-secondary">갤러리 보기</a>
                    <a href="/location" class="btn btn-outline">매장정보 보기</a>
                </div>
            </div>
            <div class="scroll-indicator">
                <div class="scroll-arrow">↓</div>
                <span>스크롤하여 더보기</span>
            </div>
        </section>

        <!-- 서비스 소개 섹션 -->
        <section id="services" class="section services-section">
            <div class="container">
                <h2 class="section-title fade-in">우리의 서비스</h2>
                <div class="services-grid">
                    <div class="service-card fade-in">
                        <div class="service-icon">✂️</div>
                        <h3>프리미엄 헤어컷</h3>
                        <p>개인의 얼굴형과 스타일에 맞는 맞춤형 헤어컷 서비스를 제공합니다.</p>
                        <a href="/staff" class="service-link">직원소개 →</a>
                    </div>
                    <div class="service-card fade-in">
                        <div class="service-icon">🪒</div>
                        <h3>클래식 면도</h3>
                        <p>전통적인 방식의 면도 서비스로 완벽한 마무리를 선사합니다.</p>
                        <a href="/gallery" class="service-link">갤러리 보기 →</a>
                    </div>
                    <div class="service-card fade-in">
                        <div class="service-icon">💆‍♂️</div>
                        <h3>헤드 마사지</h3>
                        <p>편안한 헤드 마사지로 스트레스를 해소하고 릴렉스하세요.</p>
                        <a href="/location" class="service-link">예약하기 →</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- 매장 소개 섹션 -->
        <section id="about" class="section about-section">
            <div class="container">
                <div class="about-content">
                    <div class="about-text fade-in">
                        <h2 class="section-title">BarberGarden 소개</h2>
                        <p class="about-description">
                            BarberGarden은 석촌동에 위치한 프리미엄 바버샵입니다. 
                            최고의 기술과 서비스로 고객님의 만족을 위해 노력하고 있습니다.
                        </p>
                        <div class="about-stats">
                            <div class="stat-item">
                                <div class="stat-number">1000+</div>
                                <div class="stat-label">만족 고객</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-number">15</div>
                                <div class="stat-label">전문 스타일</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-number">5</div>
                                <div class="stat-label">운영 연차</div>
                            </div>
                        </div>
                        <a href="/staff" class="btn btn-primary">직원소개 보기</a>
                    </div>
                    <div class="about-image fade-in">
                        <div class="image-placeholder">매장 이미지</div>
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