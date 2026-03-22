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
                <li><a href="/community" onclick="closeMenu()">커뮤니티</a></li>
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
