<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<c:url var="resources" value="/resources" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="${resources}/images/favicon.png">
    <title>직원소개 - ${shopName}</title>
    <link rel="stylesheet" href="${resources}/css/barbershop.css">
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
                <li><a href="/" onclick="closeMenu()">홈</a></li>
                <li class="nav-dropdown">
                    <a href="#" class="nav-dropdown-toggle active" onclick="return false;">바버샵 ▾</a>
                    <ul class="dropdown-menu">
                        <li><a href="/staff" onclick="closeMenu()">직원소개</a></li>
                        <li><a href="/gallery" onclick="closeMenu()">갤러리</a></li>
                        <li><a href="/#location" onclick="closeMenu()">매장정보</a></li>
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
                <li><a href="#" onclick="closeMenu()">커뮤니티</a></li>
                <li><a href="${naverBookingUrl}" class="nav-naver-booking" onclick="closeMenu()" target="_blank" rel="noopener noreferrer" title="네이버 예약">
                    <img src="${resources}/images/naver-booking.png" alt="네이버 예약">
                </a></li>
            </ul>
        </div>
    </header>

    <!-- 메인 컨텐츠 -->
    <main class="main-content">
        <!-- 페이지 타이틀 섹션 -->
        <section class="page-title-section">
            <div class="container">
                <h1 class="page-title fade-in">직원소개</h1>
                <p class="page-subtitle fade-in">BarberGarden의 전문 스타일리스트들을 소개합니다</p>
            </div>
        </section>

        <!-- 직원소개 섹션 -->
        <section id="staff" class="section staff-section">
            <div class="container">
                <div class="staff-grid">
                    <c:forEach items="${staffList}" var="staff">
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
                            <c:if test="${not empty staff.skills}">
                                <div class="staff-skills">
                                    <c:forEach items="${fn:split(staff.skills, ',')}" var="skill">
                                        <span class="skill-tag">${fn:trim(skill)}</span>
                                    </c:forEach>
                                </div>
                            </c:if>
                            <p class="staff-description">${staff.description}</p>
                        </div>
                    </c:forEach>
                </div>
                
                <!-- 예약 안내 -->
                <div class="reservation-info fade-in">
                    <h3>예약 및 문의</h3>
                    <p>전화: ${shopPhone}</p>
                    <p>주소: ${shopAddress}</p>
                    <div class="reservation-buttons">
                        <a href="tel:${shopPhone}" class="btn btn-primary">전화 예약</a>
                        <a href="/location" class="btn btn-secondary">매장 위치</a>
                        <a href="/gallery" class="btn btn-outline">갤러리 보기</a>
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
