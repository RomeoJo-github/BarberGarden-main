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
    <title>QnA - ${shopName}</title>
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
                <h1 class="page-title fade-in">QnA</h1>
                <p class="page-subtitle fade-in">아카데미에 대해 궁금한 점을 확인해보세요</p>
            </div>
        </section>

        <!-- FAQ -->
        <section style="padding: 80px 0;">
            <div class="container">
                <h2 class="section-title fade-in" style="text-align:center; margin-bottom:2.5rem;">자주 묻는 질문</h2>
                <div class="faq-list">

                    <div class="faq-item fade-in">
                        <div class="faq-question" onclick="toggleFaq(this)">
                            <h4>Q. 전혀 경험이 없어도 수강할 수 있나요?</h4>
                            <span class="faq-toggle">+</span>
                        </div>
                        <div class="faq-answer">
                            <p>네, 가능합니다. 기초과정은 바버 경험이 전혀 없는 분들도 수강할 수 있도록 기초부터 차근차근 교육합니다. 입문자도 걱정 없이 시작하세요.</p>
                        </div>
                    </div>

                    <div class="faq-item fade-in">
                        <div class="faq-question" onclick="toggleFaq(this)">
                            <h4>Q. 수업에 필요한 도구들은 제공되나요?</h4>
                            <span class="faq-toggle">+</span>
                        </div>
                        <div class="faq-answer">
                            <p>기본적인 교육용 도구들은 아카데미에서 제공됩니다. 개인 전용 도구(클리퍼, 가위 등)는 별도 구매를 권장하며, 구매 시 추천 제품 안내를 도와드립니다.</p>
                        </div>
                    </div>

                    <div class="faq-item fade-in">
                        <div class="faq-question" onclick="toggleFaq(this)">
                            <h4>Q. 수료 후 취업 지원이 있나요?</h4>
                            <span class="faq-toggle">+</span>
                        </div>
                        <div class="faq-answer">
                            <p>우수 수료생에게는 BarberGarden 및 제휴 바버샵 취업 기회를 제공합니다. 이력서 작성, 면접 준비 등 취업 전반에 걸쳐 적극적으로 지원해 드립니다.</p>
                        </div>
                    </div>

                    <div class="faq-item fade-in">
                        <div class="faq-question" onclick="toggleFaq(this)">
                            <h4>Q. 온라인 강의만 수강할 수 있나요?</h4>
                            <span class="faq-toggle">+</span>
                        </div>
                        <div class="faq-answer">
                            <p>온라인 강의는 보충 학습 자료로 제공됩니다. 바버 교육의 특성상 오프라인 실습 수업 참여가 필수이며, 이를 통해 실질적인 실력을 쌓을 수 있습니다.</p>
                        </div>
                    </div>

                    <div class="faq-item fade-in">
                        <div class="faq-question" onclick="toggleFaq(this)">
                            <h4>Q. 수강료 분할 결제가 가능한가요?</h4>
                            <span class="faq-toggle">+</span>
                        </div>
                        <div class="faq-answer">
                            <p>네, 2~3개월 분할 결제가 가능합니다. 또한 조기 등록 시 10% 할인 혜택이 적용되니 미리 신청하시면 유리합니다. 자세한 사항은 상담 전화로 문의해 주세요.</p>
                        </div>
                    </div>

                    <div class="faq-item fade-in">
                        <div class="faq-question" onclick="toggleFaq(this)">
                            <h4>Q. 수강 후 수료증이 발급되나요?</h4>
                            <span class="faq-toggle">+</span>
                        </div>
                        <div class="faq-answer">
                            <p>모든 과정을 이수한 수료생에게 BarberGarden 공인 수료증을 발급합니다. 수료증은 취업 시 유용하게 활용하실 수 있습니다.</p>
                        </div>
                    </div>

                    <div class="faq-item fade-in">
                        <div class="faq-question" onclick="toggleFaq(this)">
                            <h4>Q. 수강 중 결석하면 어떻게 되나요?</h4>
                            <span class="faq-toggle">+</span>
                        </div>
                        <div class="faq-answer">
                            <p>불가피한 결석은 보강 수업을 통해 보충이 가능합니다. 다만, 전체 수업의 80% 이상 출석해야 수료증이 발급되므로 최대한 성실히 참여해 주시기 바랍니다.</p>
                        </div>
                    </div>

                    <div class="faq-item fade-in">
                        <div class="faq-question" onclick="toggleFaq(this)">
                            <h4>Q. 나이 제한이 있나요?</h4>
                            <span class="faq-toggle">+</span>
                        </div>
                        <div class="faq-answer">
                            <p>만 18세 이상이면 누구든 수강 가능합니다. 20~40대 수강생이 가장 많으며, 경력 전환을 원하시는 분들도 환영합니다.</p>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <!-- 문의하기 -->
        <section style="padding: 70px 0; background: #f8f9fa;">
            <div class="container">
                <div style="max-width: 600px; margin: 0 auto; text-align:center;">
                    <h2 class="section-title fade-in">추가 문의</h2>
                    <p class="fade-in" style="color:#666; margin-bottom:2rem;">찾으시는 답이 없으셨나요? 직접 연락 주시면 친절하게 안내해 드리겠습니다.</p>
                    <div class="enrollment-info fade-in" style="margin-bottom:2rem;">
                        <div class="info-box">
                            <h4>📞 전화 문의</h4>
                            <p>${shopPhone}</p>
                            <p>평일 10:00 ~ 18:00</p>
                        </div>
                        <div class="info-box">
                            <h4>📍 방문 문의</h4>
                            <p>${shopAddress}</p>
                            <p>방문 전 전화 예약 필수</p>
                        </div>
                    </div>
                    <div class="enrollment-buttons fade-in">
                        <a href="tel:${shopPhone}" class="btn btn-primary">📞 전화 문의</a>
                        <a href="/academy/courses" class="btn btn-secondary">과정 및 가격 보기</a>
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
