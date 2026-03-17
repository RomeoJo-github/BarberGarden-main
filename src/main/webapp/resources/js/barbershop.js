/**
 * BarberGarden 바버샵 홍보 페이지 JavaScript
 */

// 햄버거 메뉴 토글
function toggleMenu() {
    const hamburger = document.getElementById('hamburger');
    const navTabs = document.getElementById('nav-tabs');
    if (!hamburger || !navTabs) return;
    hamburger.classList.toggle('open');
    navTabs.classList.toggle('open');
}

function closeMenu() {
    const hamburger = document.getElementById('hamburger');
    const navTabs = document.getElementById('nav-tabs');
    if (!hamburger || !navTabs) return;
    hamburger.classList.remove('open');
    navTabs.classList.remove('open');
    // 서브메뉴 닫기 + 화살표 원복
    document.querySelectorAll('.dropdown-menu').forEach(function(m) {
        m.classList.remove('open');
    });
    document.querySelectorAll('.nav-dropdown-toggle').forEach(function(t) {
        t.textContent = t.textContent.replace('▲', '▾');
    });
}

// 모바일 전용: 바버샵 드롭다운 토글
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.nav-dropdown-toggle').forEach(function(toggle) {
        toggle.addEventListener('click', function(e) {
            if (window.innerWidth > 768) return;
            e.preventDefault();
            e.stopPropagation(); // 외부 클릭 핸들러로 버블링 차단

            const dropdown = toggle.nextElementSibling;
            if (!dropdown) return;

            const isOpen = dropdown.classList.contains('open');
            // 열기/닫기 토글
            dropdown.classList.toggle('open');
            // 화살표 방향 전환
            if (isOpen) {
                toggle.textContent = toggle.textContent.replace('▲', '▾');
            } else {
                toggle.textContent = toggle.textContent.replace('▾', '▲');
            }
        });
    });

    // X 버튼(햄버거 닫기) 클릭 시 이벤트 버블링 차단
    const hamburger = document.getElementById('hamburger');
    if (hamburger) {
        hamburger.addEventListener('click', function(e) {
            e.stopPropagation();
            toggleMenu();
        });
    }
});

// 화면 바깥 클릭 시 메뉴 닫기
document.addEventListener('click', function(e) {
    const hamburger = document.getElementById('hamburger');
    const navTabs = document.getElementById('nav-tabs');
    if (!hamburger || !navTabs) return;
    if (!hamburger.contains(e.target) && !navTabs.contains(e.target)) {
        closeMenu();
    }
});

// 빠르고 부드러운 스크롤 이동 함수
function scrollToSection(sectionId) {
    const section = document.getElementById(sectionId);
    const headerHeight = 80; // 헤더 높이
    const targetPosition = section.offsetTop - headerHeight;
    
    // 즉각적이고 부드러운 스크롤
    window.scrollTo({
        top: targetPosition,
        behavior: 'smooth'
    });
}

// 스크롤 애니메이션 효과
function handleScrollAnimation() {
    const elements = document.querySelectorAll('.fade-in');
    
    elements.forEach(element => {
        const elementTop = element.getBoundingClientRect().top;
        const elementBottom = element.getBoundingClientRect().bottom;
        
        if (elementTop < window.innerHeight - 100 && elementBottom > 0) {
            element.classList.add('visible');
        }
    });
}

// 네비게이션 활성화 상태 업데이트
function updateActiveNav() {
    const sections = ['hero', 'staff', 'gallery', 'location'];
    const navLinks = document.querySelectorAll('.nav-tabs a');
    
    sections.forEach((sectionId, index) => {
        const section = document.getElementById(sectionId);
        const rect = section.getBoundingClientRect();
        
        if (rect.top <= 100 && rect.bottom >= 100) {
            navLinks.forEach(link => link.classList.remove('active'));
            if (navLinks[index]) {
                navLinks[index].classList.add('active');
            }
        }
    });
}

// 이미지 레이지 로딩 (실제 이미지 구현 시 사용)
function lazyLoadImages() {
    const images = document.querySelectorAll('img[data-src]');
    const imageObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const img = entry.target;
                img.src = img.dataset.src;
                img.classList.remove('lazy');
                imageObserver.unobserve(img);
            }
        });
    });

    images.forEach(img => imageObserver.observe(img));
}

// 헤더 스크롤 효과
function handleHeaderScroll() {
    const header = document.querySelector('.header');
    if (window.scrollY > 100) {
        header.classList.add('scrolled');
    } else {
        header.classList.remove('scrolled');
    }
}

// 카운터 애니메이션
function animateCounters() {
    const counters = document.querySelectorAll('.counter span[data-target]');
    
    counters.forEach(counter => {
        const target = parseInt(counter.getAttribute('data-target'));
        const increment = target / 100; // 100단계로 나누어 애니메이션
        let current = 0;
        
        const updateCounter = () => {
            if (current < target) {
                current += increment;
                counter.textContent = Math.floor(current);
                setTimeout(updateCounter, 30);
            } else {
                counter.textContent = target;
            }
        };
        
        updateCounter();
    });
}

// Go To Top 버튼 관리
function handleGoToTop() {
    const gotoTop = document.getElementById('gotoTop');
    
    if (window.scrollY > 300) {
        gotoTop.classList.add('visible');
    } else {
        gotoTop.classList.remove('visible');
    }
}

// 맨 위로 스크롤
function scrollToTop() {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
}

// 카카오톡 문의하기
function openKakaoTalk() {
    // 방법 1: 카카오톡 플러스친구/채널 (실제 운영 시 사용)
    // window.open('https://pf.kakao.com/_your_channel_id', '_blank');
    
    // 방법 2: 카카오톡 개인 메시지 (실제 카카오톡 ID로 변경)
    // window.open('https://open.kakao.com/o/your_open_chat_id', '_blank');
    
    // 방법 3: 전화 연결 (현재 구현)
    const confirmMessage = `💬 카카오톡으로 문의하시겠습니까?\n\n` +
                          `📞 빠른 상담: ${document.querySelector('[href*="tel:"]')?.href.replace('tel:', '') || '010-5539-0831'}\n\n` +
                          `실제 운영 시 카카오톡 채널로 연결됩니다.`;
    
    if (confirm(confirmMessage)) {
        // 실제 구현 시: 카카오톡 채널 또는 오픈채팅방으로 연결
        // 현재는 전화 연결로 대체
        window.location.href = 'tel:010-5539-0831';
    }
}

// 갤러리 스크롤 함수
function scrollGallery(direction) {
    const galleryGrid = document.querySelector('.gallery-grid');
    const scrollAmount = 370; // 갤러리 아이템 너비 + 간격
    
    if (direction === 'left') {
        galleryGrid.scrollBy({
            left: -scrollAmount,
            behavior: 'smooth'
        });
    } else if (direction === 'right') {
        galleryGrid.scrollBy({
            left: scrollAmount,
            behavior: 'smooth'
        });
    }
}

// Footer가 보이는지 체크해서 카운터 애니메이션 실행
function handleFooterAnimation() {
    const footer = document.getElementById('footer');
    if (!footer) return;
    
    const footerRect = footer.getBoundingClientRect();
    const isFooterVisible = footerRect.top < window.innerHeight && footerRect.bottom > 0;
    
    if (isFooterVisible && !footer.classList.contains('animated')) {
        footer.classList.add('animated');
        animateCounters();
    }
}

// 페이지 초기화
function initializePage() {
    // 초기 애니메이션 체크
    handleScrollAnimation();
    
    // 스크롤 이벤트 리스너들
    window.addEventListener('scroll', () => {
        handleScrollAnimation();
        updateActiveNav();
        handleHeaderScroll();
        handleGoToTop();
        handleFooterAnimation();
    });
    

    
    // 갤러리 아이템 클릭 이벤트
    const galleryItems = document.querySelectorAll('.gallery-item');
    galleryItems.forEach(item => {
        item.addEventListener('click', function() {
            // 실제 구현 시 모달 또는 라이트박스 열기
            const title = this.querySelector('.gallery-title').textContent;
            alert(`${title} 상세 이미지를 보여줍니다!\n\n실제 구현 시 이미지 모달이 열립니다.`);
        });
    });
    
    // 직원 카드 호버 효과 강화
    const staffCards = document.querySelectorAll('.staff-card');
    staffCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-15px) scale(1.02)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });
    
    // 전화번호 클릭 이벤트
    const phoneElements = document.querySelectorAll('.info-item');
    phoneElements.forEach(item => {
        const text = item.textContent;
        if (text.includes('010-5539-0831')) {
            item.style.cursor = 'pointer';
            item.addEventListener('click', function() {
                if (confirm('전화를 걸겠습니까?')) {
                    window.location.href = 'tel:010-5539-0831';
                }
            });
        }
    });
    
    // 이미지 레이지 로딩 초기화
    if ('IntersectionObserver' in window) {
        lazyLoadImages();
    }
    
    // Go To Top 버튼 클릭 이벤트
    const gotoTopBtn = document.getElementById('gotoTop');
    if (gotoTopBtn) {
        gotoTopBtn.addEventListener('click', scrollToTop);
    }
    
    // 카카오톡 문의 버튼 클릭 이벤트
    const kakaoBtn = document.getElementById('kakaoTalk');
    if (kakaoBtn) {
        kakaoBtn.addEventListener('click', openKakaoTalk);
    }
    
    // 소셜 미디어 링크 - href에 실제 URL이 설정되어 있으므로 별도 처리 없이 바로 이동
    
    // Footer 링크 이벤트
    const footerLinks = document.querySelectorAll('.footer-links a');
    footerLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const linkText = this.textContent;
            alert(`${linkText} 페이지로 이동합니다!\n\n실제 운영 시 해당 페이지를 구현해주세요.`);
        });
    });
}

// 페이지 로드 완료 시 초기화
document.addEventListener('DOMContentLoaded', initializePage);

// 페이지 완전 로드 시 추가 초기화
window.addEventListener('load', () => {
    // 로딩 애니메이션이 있다면 여기서 제거
    handleScrollAnimation();
});

// 브라우저 뒤로가기/앞으로가기 지원
window.addEventListener('popstate', function(event) {
    if (event.state && event.state.section) {
        scrollToSection(event.state.section);
    }
});

// 섹션 링크 클릭 시 히스토리 업데이트
function scrollToSectionWithHistory(sectionId) {
    scrollToSection(sectionId);
    history.pushState({section: sectionId}, '', `#${sectionId}`);
}

// 유틸리티 함수들
const BarberShopUtils = {
    // 예약 모달 열기 (실제 구현 시 사용)
    openBookingModal: function() {
        alert('예약 시스템을 연결하세요!\n\n실제 구현 시 예약 폼이 열립니다.');
    },
    
    // 지도 초기화 (Google Maps 또는 네이버 지도 연동 시 사용)
    initializeMap: function() {
        console.log('지도 초기화 준비 완료');
        // 실제 지도 API 연동 코드가 여기에 들어갑니다
    },
    
    // 소셜 미디어 공유
    shareOnSocial: function(platform) {
        const url = window.location.href;
        const title = 'BarberGarden - 프리미엄 바버샵';
        
        let shareUrl = '';
        switch(platform) {
            case 'facebook':
                shareUrl = `https://www.facebook.com/sharer/sharer.php?u=${url}`;
                break;
            case 'twitter':
                shareUrl = `https://twitter.com/intent/tweet?url=${url}&text=${title}`;
                break;
            case 'kakao':
                alert('카카오톡 공유 기능 연동 예정입니다.');
                return;
        }
        
        if (shareUrl) {
            window.open(shareUrl, '_blank', 'width=600,height=400');
        }
    }
};

// 갤러리 필터링 기능
function filterGallery(category) {
    const items = document.querySelectorAll('.gallery-item-large');
    const tabs = document.querySelectorAll('.category-tab');
    
    // 활성 탭 업데이트
    tabs.forEach(tab => tab.classList.remove('active'));
    event.target.classList.add('active');
    
    // 아이템 필터링
    items.forEach(item => {
        if (category === 'all' || item.dataset.category === category) {
            item.style.display = 'block';
            item.classList.add('fade-in');
        } else {
            item.style.display = 'none';
        }
    });
}

// 아카데미 커리큘럼 탭 전환
function showCurriculum(courseType) {
    // 모든 탭과 콘텐츠 비활성화
    const tabs = document.querySelectorAll('.curriculum-tab');
    const contents = document.querySelectorAll('.curriculum-content');
    
    tabs.forEach(tab => tab.classList.remove('active'));
    contents.forEach(content => content.classList.remove('active'));
    
    // 선택된 탭과 콘텐츠 활성화
    event.target.classList.add('active');
    document.getElementById(courseType + '-curriculum').classList.add('active');
}

// FAQ 토글 기능
function toggleFaq(element) {
    const faqItem = element.parentElement;
    const isActive = faqItem.classList.contains('active');
    
    // 모든 FAQ 아이템 닫기
    document.querySelectorAll('.faq-item').forEach(item => {
        item.classList.remove('active');
    });
    
    // 클릭된 아이템만 열기 (이미 열려있었다면 닫기)
    if (!isActive) {
        faqItem.classList.add('active');
    }
} 