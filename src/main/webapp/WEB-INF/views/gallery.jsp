<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<c:url var="resources" value="/resources" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>갤러리 - ${shopName}</title>
    <link rel="stylesheet" href="${resources}/css/barbershop.css">
</head>
<body>
    <!-- 헤더 네비게이션 -->
    <header class="header">
        <div class="nav-container">
            <div class="logo"><a href="/">${shopName}</a></div>
            <ul class="nav-tabs">
                <li><a href="/">홈</a></li>
                <li><a href="/staff">직원소개</a></li>
                <li><a href="/gallery" class="active">갤러리</a></li>
                <li><a href="/#location">매장정보</a></li>
                <li><a href="/academy">아카데미</a></li>
            </ul>
        </div>
    </header>

    <!-- 메인 컨텐츠 -->
    <main class="main-content">
        <!-- 페이지 타이틀 섹션 -->
        <section class="page-title-section">
            <div class="container">
                <h1 class="page-title fade-in">갤러리</h1>
                <p class="page-subtitle fade-in">BarberGarden의 분위기와 작업 과정을 확인해보세요</p>
            </div>
        </section>

        <!-- 갤러리 카테고리 -->
        <section class="gallery-categories">
            <div class="container">
                <div class="category-tabs fade-in">
                    <button class="category-tab active" onclick="filterGallery('all')">전체</button>
                    <button class="category-tab" onclick="filterGallery('interior')">매장 인테리어</button>
                    <button class="category-tab" onclick="filterGallery('haircut')">헤어컷 작업</button>
                    <button class="category-tab" onclick="filterGallery('styling')">스타일링</button>
                    <button class="category-tab" onclick="filterGallery('tools')">전문 도구</button>
                </div>
            </div>
        </section>

        <!-- 갤러리 섹션 -->
        <section id="gallery" class="section gallery-section">
            <div class="container">
                <div class="gallery-grid-large">
                    <c:forEach items="${galleryList}" var="gallery">
                        <div class="gallery-item-large fade-in" data-category="all">
                            <c:choose>
                                <c:when test="${not empty gallery.imageUrl}">
                                    <div class="gallery-image-large" style="background-image: url('http://localhost:8090${gallery.imageUrl}'); background-size: cover; background-position: center; min-height: 400px;"></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="gallery-placeholder-large">${gallery.title}</div>
                                </c:otherwise>
                            </c:choose>
                            <div class="gallery-overlay">
                                <div class="gallery-content">
                                    <h3 class="gallery-title">${gallery.title}</h3>
                                    <p>${gallery.description}</p>
                                    <span class="gallery-category">갤러리</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                
                <!-- 갤러리 하단 안내 -->
                <div class="gallery-info fade-in">
                    <h3>더 많은 사진이 궁금하시다면?</h3>
                    <p>BarberGarden의 인스타그램과 페이스북에서 더 많은 사진을 확인하세요!</p>
                    <div class="social-links">
                        <a href="#" class="social-link instagram">📷 Instagram</a>
                        <a href="#" class="social-link facebook">📘 Facebook</a>
                        <a href="/staff" class="btn btn-primary">직원소개 보기</a>
                        <a href="/location" class="btn btn-secondary">매장 방문하기</a>
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
