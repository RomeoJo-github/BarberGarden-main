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
    <title>과정 및 가격 - ${shopName}</title>
    <link rel="stylesheet" href="${resources}/css/barbershop.css">
</head>
<body>
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
                    <a href="#" class="nav-dropdown-toggle" onclick="return false;">바버샵 ▾</a>
                    <ul class="dropdown-menu">
                        <li><a href="/staff" onclick="closeMenu()">직원소개</a></li>
                        <li><a href="/gallery" onclick="closeMenu()">갤러리</a></li>
                        <li><a href="/#location" onclick="closeMenu()">매장정보</a></li>
                    </ul>
                </li>
                <li class="nav-dropdown">
                    <a href="#" class="nav-dropdown-toggle active" onclick="return false;">바버아카데미 ▾</a>
                    <ul class="dropdown-menu">
                        <li><a href="/academy/courses" onclick="closeMenu()">과정 및 가격</a></li>
                        <li><a href="/academy/reviews" onclick="closeMenu()">후기</a></li>
                        <li><a href="/academy/qna" onclick="closeMenu()">QnA</a></li>
                    </ul>
                </li>
                <li><a href="/community" onclick="closeMenu()">커뮤니티</a></li>
                <li><a href="#" class="nav-naver-booking" onclick="closeMenu()" target="_blank" title="네이버 예약">
                    <img src="${resources}/images/naver-booking.png" alt="네이버 예약">
                </a></li>
            </ul>
        </div>
    </header>

    <main class="main-content">
        <section class="page-title-section">
            <div class="container">
                <h1 class="page-title fade-in">과정 및 가격</h1>
                <p class="page-subtitle fade-in">BarberGarden 아카데미의 체계적인 교육과정을 확인해보세요</p>
            </div>
        </section>

        <!-- 바버 아카데미 과정 요약 (상단 카드) -->
        <section style="padding: 80px 0; background: #f8f9fa;">
            <div class="container">
                <h2 class="section-title fade-in" style="text-align:center; margin-bottom: 2.5rem;">바버 아카데미 과정 안내</h2>
                <div class="ac-price-grid fade-in">
                    <div class="ac-price-card ac-price-card--highlight">
                        <div class="ac-price-badge">자격증</div>
                        <div class="ac-price-name">자격증과정</div>
                        <div class="ac-price-amount">₩500,000</div>
                        <div class="ac-price-detail">이용사 자격증과정</div>
                    </div>
                    <div class="ac-price-card">
                        <div class="ac-price-badge">클리퍼</div>
                        <div class="ac-price-name">바버 클리퍼 과정</div>
                        <div class="ac-price-amount">₩500,000</div>
                        <div class="ac-price-detail">추후 업데이트</div>
                    </div>
                    <div class="ac-price-card">
                        <div class="ac-price-badge">기초</div>
                        <div class="ac-price-name">바버 기초과정</div>
                        <div class="ac-price-amount">₩1,000,000</div>
                        <div class="ac-price-detail">추후 업데이트</div>
                    </div>
                    <div class="ac-price-card">
                        <div class="ac-price-badge">심화</div>
                        <div class="ac-price-name">바버 심화과정</div>
                        <div class="ac-price-amount">₩2,000,000</div>
                        <div class="ac-price-detail">추후 업데이트</div>
                    </div>
                </div>
                <p class="fade-in" style="text-align:center; margin-top:1.5rem; color:#888; font-size:0.9rem;">
                    * 과정 구성 및 세부 커리큘럼은 추후 업데이트 예정입니다.
                </p>
            </div>
        </section>

        <!-- 수강 신청 -->
        <section class="enrollment-section">
            <div class="container">
                <div class="enrollment-content fade-in">
                    <h2 class="section-title">수강 신청</h2>
                    <div class="enrollment-info">
                        <div class="info-box">
                            <h4>📞 전화 상담</h4>
                            <p>${shopPhone}</p>
                            <p>상담 시간: 평일 10:00-18:00</p>
                        </div>
                        <div class="info-box">
                            <h4>📍 방문 상담</h4>
                            <p>${shopAddress}</p>
                            <p>방문 상담 예약 필수</p>
                        </div>
                        <div class="info-box">
                            <h4>💳 결제 안내</h4>
                            <p>분할 결제 가능 (2-3개월)</p>
                            <p>조기 등록 시 10% 할인</p>
                        </div>
                    </div>
                    <div class="enrollment-buttons">
                        <a href="tel:${shopPhone}" class="btn btn-primary">📞 상담 신청</a>
                        <a href="/academy/reviews" class="btn btn-secondary">수강 후기 보기</a>
                        <a href="/academy/qna" class="btn btn-outline">QnA 보기</a>
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

    <div class="fixed-buttons">
        <div id="gotoTop" class="goto-top"><span>↑</span></div>
    </div>

    <script src="${resources}/js/barbershop.js"></script>
</body>
</html>
