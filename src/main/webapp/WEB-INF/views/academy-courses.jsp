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
                <li><a href="#" onclick="closeMenu()">커뮤니티</a></li>
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

        <!-- 과정 선택 탭 -->
        <section class="curriculum-section" style="padding: 80px 0;">
            <div class="container">
                <div class="curriculum-tabs fade-in">
                    <button class="curriculum-tab active" onclick="showCurriculum('basic')">기초과정</button>
                    <button class="curriculum-tab" onclick="showCurriculum('advanced')">심화과정</button>
                    <button class="curriculum-tab" onclick="showCurriculum('master')">마스터과정</button>
                </div>

                <div id="basic-curriculum" class="curriculum-content active fade-in">
                    <div class="course-card">
                        <div class="course-header">
                            <h3>기초과정 (Basic Course)</h3>
                            <div class="course-price">₩450,000</div>
                        </div>
                        <div class="course-details">
                            <div class="course-duration">📅 교육기간: 4주 (주 3회, 총 12회)</div>
                            <div class="course-time">🕐 수업시간: 1회 3시간</div>
                            <h4>커리큘럼</h4>
                            <ul class="curriculum-list">
                                <li>바버샵 기본 도구 사용법</li>
                                <li>기본 헤어컷 기법</li>
                                <li>클리퍼 워크 기초</li>
                                <li>시저 컷 기본기</li>
                                <li>고객 상담 및 서비스</li>
                                <li>위생 및 안전 관리</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div id="advanced-curriculum" class="curriculum-content fade-in">
                    <div class="course-card">
                        <div class="course-header">
                            <h3>심화과정 (Advanced Course)</h3>
                            <div class="course-price">₩650,000</div>
                        </div>
                        <div class="course-details">
                            <div class="course-duration">📅 교육기간: 6주 (주 3회, 총 18회)</div>
                            <div class="course-time">🕐 수업시간: 1회 3시간</div>
                            <h4>커리큘럼</h4>
                            <ul class="curriculum-list">
                                <li>다양한 페이드 기법 마스터</li>
                                <li>언더컷 &amp; 텍스처링</li>
                                <li>클래식 면도법</li>
                                <li>포마드 &amp; 스타일링</li>
                                <li>트렌드 헤어스타일</li>
                                <li>고급 클리퍼 테크닉</li>
                                <li>비즈니스 마인드 교육</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div id="master-curriculum" class="curriculum-content fade-in">
                    <div class="course-card">
                        <div class="course-header">
                            <h3>마스터과정 (Master Course)</h3>
                            <div class="course-price">₩950,000</div>
                        </div>
                        <div class="course-details">
                            <div class="course-duration">📅 교육기간: 8주 (주 4회, 총 32회)</div>
                            <div class="course-time">🕐 수업시간: 1회 4시간</div>
                            <h4>커리큘럼</h4>
                            <ul class="curriculum-list">
                                <li>전문 바버 마스터 과정</li>
                                <li>크리에이티브 컷팅</li>
                                <li>헤어 디자인 &amp; 아트</li>
                                <li>면도 마스터 클래스</li>
                                <li>살롱 운영 및 관리</li>
                                <li>강사 양성 과정</li>
                                <li>개인 브랜딩</li>
                                <li>포트폴리오 제작</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 가격 비교 요약 -->
        <section style="padding: 60px 0; background: #f8f9fa;">
            <div class="container">
                <h2 class="section-title fade-in" style="text-align:center; margin-bottom: 2.5rem;">과정별 가격 요약</h2>
                <div class="ac-price-grid fade-in">
                    <div class="ac-price-card">
                        <div class="ac-price-badge">기초</div>
                        <div class="ac-price-name">Basic Course</div>
                        <div class="ac-price-amount">₩450,000</div>
                        <div class="ac-price-detail">4주 / 12회 / 회당 3시간</div>
                        <a href="tel:${shopPhone}" class="btn btn-outline" style="margin-top:1.2rem; display:inline-block;">문의하기</a>
                    </div>
                    <div class="ac-price-card ac-price-card--highlight">
                        <div class="ac-price-badge">심화</div>
                        <div class="ac-price-name">Advanced Course</div>
                        <div class="ac-price-amount">₩650,000</div>
                        <div class="ac-price-detail">6주 / 18회 / 회당 3시간</div>
                        <a href="tel:${shopPhone}" class="btn btn-primary" style="margin-top:1.2rem; display:inline-block;">문의하기</a>
                    </div>
                    <div class="ac-price-card">
                        <div class="ac-price-badge">마스터</div>
                        <div class="ac-price-name">Master Course</div>
                        <div class="ac-price-amount">₩950,000</div>
                        <div class="ac-price-detail">8주 / 32회 / 회당 4시간</div>
                        <a href="tel:${shopPhone}" class="btn btn-outline" style="margin-top:1.2rem; display:inline-block;">문의하기</a>
                    </div>
                </div>
                <p class="fade-in" style="text-align:center; margin-top:1.5rem; color:#888; font-size:0.9rem;">* 분할 결제 가능 (2~3개월) &nbsp;|&nbsp; 조기 등록 시 10% 할인</p>
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

    <footer id="footer" class="footer-simple">
        <div class="footer-simple-inner">
            <p class="footer-brand">바버가든</p>
            <p>대표 : 김희영 &nbsp;|&nbsp; 사업자 번호 : 104-11-22-127</p>
            <p>TEL : 010-5539-0831</p>
            <p>주소 : 05616 서울특별시 송파구 송파대로 447 2층</p>
            <p>정보관리자 : 조재영 &nbsp;(romeo4648@gmail.com)</p>
            <p class="footer-copy">Copyrights &copy; 2024 All Rights Reserved by BarberGarden.</p>
        </div>
    </footer>

    <div class="fixed-buttons">
        <div id="gotoTop" class="goto-top"><span>↑</span></div>
    </div>

    <script src="${resources}/js/barbershop.js"></script>
</body>
</html>
