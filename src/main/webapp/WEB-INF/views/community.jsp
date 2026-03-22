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
    <title>커뮤니티 - ${shopName}</title>
    <link rel="stylesheet" href="${resources}/css/barbershop.css">
    <style>
        .community-form { max-width: 600px; margin: 0 auto 3rem; padding: 2rem; background: #f8f9fa; border-radius: 12px; }
        .community-form h3 { margin-bottom: 1.2rem; }
        .community-form label { display: block; margin-top: 1rem; font-weight: 600; }
        .community-form input[type="text"], .community-form textarea { width: 100%; padding: 0.6rem; border: 1px solid #ddd; border-radius: 6px; box-sizing: border-box; }
        .community-form textarea { min-height: 100px; resize: vertical; }
        .community-form input[type="file"] { margin-top: 0.5rem; }
        .community-form .btn { margin-top: 1rem; }
        .community-list { list-style: none; padding: 0; max-width: 700px; margin: 0 auto; }
        .community-item { background: #fff; border-radius: 12px; padding: 1.5rem; margin-bottom: 1rem; box-shadow: 0 2px 12px rgba(0,0,0,0.08); border: 1px solid #eee; }
        .community-item h4 { margin: 0 0 0.5rem; font-size: 1.1rem; }
        .community-item .body { color: #555; white-space: pre-wrap; margin: 0.5rem 0; }
        .community-item .photo { margin-top: 0.8rem; }
        .community-item .photo img { max-width: 100%; height: auto; border-radius: 8px; max-height: 300px; object-fit: cover; }
        .msg { padding: 0.8rem; border-radius: 8px; margin-bottom: 1rem; max-width: 600px; margin-left: auto; margin-right: auto; }
        .msg.success { background: #d4edda; color: #155724; }
        .msg.error { background: #f8d7da; color: #721c24; }
    </style>
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
                    <a href="#" class="nav-dropdown-toggle" onclick="return false;">바버아카데미 ▾</a>
                    <ul class="dropdown-menu">
                        <li><a href="/academy/courses" onclick="closeMenu()">과정 및 가격</a></li>
                        <li><a href="/academy/reviews" onclick="closeMenu()">후기</a></li>
                        <li><a href="/academy/qna" onclick="closeMenu()">QnA</a></li>
                    </ul>
                </li>
                <li><a href="/community" onclick="closeMenu()" class="active">커뮤니티</a></li>
                <li><a href="${naverBookingUrl}" class="nav-naver-booking" onclick="closeMenu()" target="_blank" rel="noopener noreferrer" title="네이버 예약">
                    <img src="${resources}/images/naver-booking.png" alt="네이버 예약">
                </a></li>
            </ul>
        </div>
    </header>

    <main class="main-content">
        <section class="page-title-section">
            <div class="container">
                <h1 class="page-title fade-in">커뮤니티</h1>
                <p class="page-subtitle fade-in">소통하고 사진도 올려보세요</p>
            </div>
        </section>

        <c:if test="${not empty message}">
            <div class="msg success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="msg error">${error}</div>
        </c:if>

        <section style="padding: 20px 0 40px;">
            <div class="container">
                <div class="community-form fade-in">
                    <h3>✏️ 글쓰기</h3>
                    <form action="/community/post" method="post" enctype="multipart/form-data">
                        <label for="title">제목</label>
                        <input type="text" id="title" name="title" required placeholder="제목을 입력하세요" maxlength="200">
                        <label for="description">내용</label>
                        <textarea id="description" name="description" placeholder="내용을 입력하세요"></textarea>
                        <label for="file">사진 (선택)</label>
                        <input type="file" id="file" name="file" accept="image/*">
                        <button type="submit" class="btn btn-primary">등록</button>
                    </form>
                </div>

                <h2 class="section-title fade-in" style="text-align:center; margin-bottom: 1.5rem;">최근 글</h2>
                <ul class="community-list">
                    <c:forEach items="${communityList}" var="post">
                        <li class="community-item fade-in">
                            <h4>${post.title}</h4>
                            <c:if test="${not empty post.description}">
                                <div class="body">${post.description}</div>
                            </c:if>
                            <c:if test="${not empty post.imageUrl}">
                                <div class="photo">
                                    <img src="${post.imageUrl}" alt="">
                                </div>
                            </c:if>
                        </li>
                    </c:forEach>
                    <c:if test="${empty communityList}">
                        <li class="community-item" style="text-align:center; color:#888;">아직 글이 없습니다. 첫 글을 올려보세요!</li>
                    </c:if>
                </ul>
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
