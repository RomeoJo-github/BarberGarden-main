<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<c:url var="resources" value="/resources" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아카데미 - ${shopName}</title>
    <link rel="stylesheet" href="${resources}/css/barbershop.css">
</head>
<body>
    <!-- 헤더 네비게이션 -->
    <header class="header">
        <div class="nav-container">
            <div class="logo"><a href="/">${shopName}</a></div>
            <ul class="nav-tabs">
                <li><a href="/">홈</a></li>
                <li><a href="/academy" class="active">아카데미</a></li>
            </ul>
        </div>
    </header>

    <!-- 메인 컨텐츠 -->
    <main class="main-content">
        <!-- 페이지 타이틀 섹션 -->
        <section class="page-title-section">
            <div class="container">
                <h1 class="page-title fade-in">BarberGarden 아카데미</h1>
                <p class="page-subtitle fade-in">전문 바버 양성을 위한 체계적인 교육 프로그램</p>
            </div>
        </section>

        <!-- 아카데미 소개 섹션 -->
        <section class="academy-intro-section">
            <div class="container">
                <div class="intro-content fade-in">
                    <h2 class="section-title">왜 BarberGarden 아카데미인가?</h2>
                    <div class="intro-features">
                        <div class="feature-item">
                            <div class="feature-icon">🎓</div>
                            <h3>전문 교육과정</h3>
                            <p>15년 경력의 전문 바버들이 직접 교육하는 체계적인 커리큘럼</p>
                        </div>
                        <div class="feature-item">
                            <div class="feature-icon">🎬</div>
                            <h3>온라인 강의</h3>
                            <p>언제 어디서나 학습할 수 있는 고품질 강의 영상</p>
                        </div>
                        <div class="feature-item">
                            <div class="feature-icon">✂️</div>
                            <h3>실습 중심</h3>
                            <p>이론과 실습을 병행한 현장 중심의 교육</p>
                        </div>
                        <div class="feature-item">
                            <div class="feature-icon">📜</div>
                            <h3>자격증 취득</h3>
                            <p>수료 후 BarberGarden 공인 수료증 발급</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 강의 영상 섹션 -->
        <section class="video-section">
            <div class="container">
                <h2 class="section-title fade-in">강의 미리보기</h2>
                <div class="video-grid">
                    <div class="video-item fade-in">
                        <div class="video-thumbnail">
                            <div class="video-placeholder">
                                <div class="play-button">▶</div>
                                <div class="video-title">기본 헤어컷 기법</div>
                            </div>
                        </div>
                        <div class="video-info">
                            <h4>Chapter 1. 기본 헤어컷 기법</h4>
                            <p class="video-duration">⏱️ 45분</p>
                            <p class="video-description">바버의 기본이 되는 헤어컷 기법을 단계별로 학습합니다.</p>
                        </div>
                    </div>
                    
                    <div class="video-item fade-in">
                        <div class="video-thumbnail">
                            <div class="video-placeholder">
                                <div class="play-button">▶</div>
                                <div class="video-title">페이드 컷 마스터</div>
                            </div>
                        </div>
                        <div class="video-info">
                            <h4>Chapter 2. 페이드 컷 마스터</h4>
                            <p class="video-duration">⏱️ 60분</p>
                            <p class="video-description">다양한 페이드 기법과 그라데이션 만들기를 배웁니다.</p>
                        </div>
                    </div>
                    
                    <div class="video-item fade-in">
                        <div class="video-thumbnail">
                            <div class="video-placeholder">
                                <div class="play-button">▶</div>
                                <div class="video-title">클래식 면도법</div>
                            </div>
                        </div>
                        <div class="video-info">
                            <h4>Chapter 3. 클래식 면도법</h4>
                            <p class="video-duration">⏱️ 40분</p>
                            <p class="video-description">전통적인 면도 기법과 안전한 면도 방법을 학습합니다.</p>
                        </div>
                    </div>
                    
                    <div class="video-item fade-in">
                        <div class="video-thumbnail">
                            <div class="video-placeholder">
                                <div class="play-button">▶</div>
                                <div class="video-title">고급 스타일링</div>
                            </div>
                        </div>
                        <div class="video-info">
                            <h4>Chapter 4. 고급 스타일링</h4>
                            <p class="video-duration">⏱️ 50분</p>
                            <p class="video-description">트렌디한 스타일링과 포마드 사용법을 익힙니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 교육과정 섹션 -->
        <section class="curriculum-section">
            <div class="container">
                <h2 class="section-title fade-in">교육과정 안내</h2>
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
                                <li>언더컷 & 텍스처링</li>
                                <li>클래식 면도법</li>
                                <li>포마드 & 스타일링</li>
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
                                <li>헤어 디자인 & 아트</li>
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

        <!-- 수강 신청 섹션 -->
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
                            <h4>💳 수강료 안내</h4>
                            <p>분할 결제 가능 (2-3개월)</p>
                            <p>조기 등록 시 10% 할인</p>
                        </div>
                    </div>
                    
                    <div class="enrollment-buttons">
                        <a href="tel:${shopPhone}" class="btn btn-primary">📞 상담 신청</a>
                        <a href="/staff" class="btn btn-secondary">강사진 보기</a>
                        <a href="/gallery" class="btn btn-outline">수업 현장 보기</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- FAQ 섹션 -->
        <section class="faq-section">
            <div class="container">
                <h2 class="section-title fade-in">자주 묻는 질문</h2>
                <div class="faq-list">
                    <div class="faq-item fade-in">
                        <div class="faq-question" onclick="toggleFaq(this)">
                            <h4>Q. 전혀 경험이 없어도 수강할 수 있나요?</h4>
                            <span class="faq-toggle">+</span>
                        </div>
                        <div class="faq-answer">
                            <p>네, 가능합니다. 기초과정은 바버 경험이 전혀 없는 분들도 수강할 수 있도록 기초부터 차근차근 교육합니다.</p>
                        </div>
                    </div>
                    
                    <div class="faq-item fade-in">
                        <div class="faq-question" onclick="toggleFaq(this)">
                            <h4>Q. 수업에 필요한 도구들은 제공되나요?</h4>
                            <span class="faq-toggle">+</span>
                        </div>
                        <div class="faq-answer">
                            <p>기본적인 교육용 도구들은 아카데미에서 제공됩니다. 개인 전용 도구는 별도 구매하시면 됩니다.</p>
                        </div>
                    </div>
                    
                    <div class="faq-item fade-in">
                        <div class="faq-question" onclick="toggleFaq(this)">
                            <h4>Q. 수료 후 취업 지원이 있나요?</h4>
                            <span class="faq-toggle">+</span>
                        </div>
                        <div class="faq-answer">
                            <p>우수 수료생에게는 BarberGarden 및 제휴 바버샵 취업 기회를 제공합니다.</p>
                        </div>
                    </div>
                    
                    <div class="faq-item fade-in">
                        <div class="faq-question" onclick="toggleFaq(this)">
                            <h4>Q. 온라인 강의만 수강할 수 있나요?</h4>
                            <span class="faq-toggle">+</span>
                        </div>
                        <div class="faq-answer">
                            <p>온라인 강의는 보충 자료이며, 오프라인 실습 수업 참여가 필수입니다.</p>
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
                        <h4>${shopName} 아카데미</h4>
                        <p>전문 바버 양성을 위한 체계적인 교육 프로그램을 제공합니다.</p>
                    </div>
                </div>
                
                <div class="footer-right">
                    <div class="footer-contact">
                        <h4>연락처</h4>
                        <div class="contact-info">
                            <p><i class="icon-location">📍</i> ${shopAddress}</p>
                            <p><i class="icon-phone">📞</i> ${shopPhone}</p>
                            <p><i class="icon-email">📧</i> academy@barbergarden.com</p>
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
                        <p>Copyrights &copy; 2024 All Rights Reserved by ${shopName} Academy.</p>
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
