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
    <title>후기 - ${shopName}</title>
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
                <h1 class="page-title fade-in">수강 후기</h1>
                <p class="page-subtitle fade-in">BarberGarden 아카데미를 수료한 분들의 생생한 이야기</p>
            </div>
        </section>

        <!-- 통계 요약 -->
        <section style="padding: 50px 0; background: #f8f9fa;">
            <div class="container">
                <div class="ac-stats-row fade-in">
                    <div class="ac-stat-item">
                        <div class="ac-stat-number">98%</div>
                        <div class="ac-stat-label">수강생 만족도</div>
                    </div>
                    <div class="ac-stat-item">
                        <div class="ac-stat-number">500+</div>
                        <div class="ac-stat-label">누적 수료생</div>
                    </div>
                    <div class="ac-stat-item">
                        <div class="ac-stat-number">4.9★</div>
                        <div class="ac-stat-label">평균 별점</div>
                    </div>
                    <div class="ac-stat-item">
                        <div class="ac-stat-number">85%</div>
                        <div class="ac-stat-label">취업 연계율</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 후기 목록 -->
        <section style="padding: 80px 0;">
            <div class="container">
                <h2 class="section-title fade-in" style="text-align:center; margin-bottom:2.5rem;">수강생 후기</h2>
                <div class="ac-reviews-grid">

                    <div class="ac-review-card fade-in">
                        <div class="ac-review-header">
                            <div class="ac-review-avatar">김</div>
                            <div class="ac-review-info">
                                <div class="ac-review-name">김**님</div>
                                <div class="ac-review-course">마스터과정 수료</div>
                            </div>
                            <div class="ac-review-stars">★★★★★</div>
                        </div>
                        <p class="ac-review-text">처음엔 막막했는데 선생님들이 기초부터 차근차근 가르쳐주셔서 3개월 만에 실력이 확 늘었어요. 지금은 바버샵을 차릴 준비 중입니다. 정말 감사합니다!</p>
                        <div class="ac-review-date">2024.11</div>
                    </div>

                    <div class="ac-review-card fade-in">
                        <div class="ac-review-header">
                            <div class="ac-review-avatar">이</div>
                            <div class="ac-review-info">
                                <div class="ac-review-name">이**님</div>
                                <div class="ac-review-course">심화과정 수료</div>
                            </div>
                            <div class="ac-review-stars">★★★★★</div>
                        </div>
                        <p class="ac-review-text">페이드 컷을 배우러 왔는데 다양한 기법을 익힐 수 있었습니다. 수업 분위기도 좋고 현장 경험이 많은 강사님들이라 실용적인 팁을 많이 얻었어요.</p>
                        <div class="ac-review-date">2024.10</div>
                    </div>

                    <div class="ac-review-card fade-in">
                        <div class="ac-review-header">
                            <div class="ac-review-avatar">박</div>
                            <div class="ac-review-info">
                                <div class="ac-review-name">박**님</div>
                                <div class="ac-review-course">기초과정 수료</div>
                            </div>
                            <div class="ac-review-stars">★★★★★</div>
                        </div>
                        <p class="ac-review-text">직장을 그만두고 바버에 도전했는데, 기초과정 한 달 만에 취업까지 연결됐어요. 체계적인 커리큘럼 덕분에 자신감이 생겼습니다.</p>
                        <div class="ac-review-date">2024.09</div>
                    </div>

                    <div class="ac-review-card fade-in">
                        <div class="ac-review-header">
                            <div class="ac-review-avatar">최</div>
                            <div class="ac-review-info">
                                <div class="ac-review-name">최**님</div>
                                <div class="ac-review-course">마스터과정 수료</div>
                            </div>
                            <div class="ac-review-stars">★★★★★</div>
                        </div>
                        <p class="ac-review-text">현직 바버인데 실력 업그레이드를 위해 수강했습니다. 마스터과정은 고급 기술과 경영적인 부분까지 배울 수 있어서 큰 도움이 됐어요.</p>
                        <div class="ac-review-date">2024.08</div>
                    </div>

                    <div class="ac-review-card fade-in">
                        <div class="ac-review-header">
                            <div class="ac-review-avatar">정</div>
                            <div class="ac-review-info">
                                <div class="ac-review-name">정**님</div>
                                <div class="ac-review-course">심화과정 수료</div>
                            </div>
                            <div class="ac-review-stars">★★★★☆</div>
                        </div>
                        <p class="ac-review-text">강사진의 실력과 열정이 정말 인상적이었습니다. 소규모 수업이라 개인적인 피드백을 많이 받을 수 있어서 빠르게 성장할 수 있었어요.</p>
                        <div class="ac-review-date">2024.07</div>
                    </div>

                    <div class="ac-review-card fade-in">
                        <div class="ac-review-header">
                            <div class="ac-review-avatar">한</div>
                            <div class="ac-review-info">
                                <div class="ac-review-name">한**님</div>
                                <div class="ac-review-course">기초과정 수료</div>
                            </div>
                            <div class="ac-review-stars">★★★★★</div>
                        </div>
                        <p class="ac-review-text">20대 후반에 새로운 도전을 시작했는데, 바버가든 아카데미가 정말 큰 힘이 됐습니다. 친절한 분위기에서 즐겁게 배울 수 있었어요!</p>
                        <div class="ac-review-date">2024.06</div>
                    </div>

                </div>
            </div>
        </section>

        <!-- 후기 작성 안내 -->
        <section style="padding: 60px 0; background: #1a1a1a; text-align:center;">
            <div class="container">
                <h2 class="fade-in" style="color:#fff; margin-bottom:1rem;">수료 후기를 남겨주세요</h2>
                <p class="fade-in" style="color:#aaa; margin-bottom:2rem;">여러분의 경험이 다음 수강생에게 큰 도움이 됩니다</p>
                <a href="tel:${shopPhone}" class="btn btn-primary fade-in">📞 문의 및 후기 등록</a>
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
