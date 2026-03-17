package com.barber.app;

import java.util.List;
import java.util.Locale;

import com.barber.app.dto.StaffContentDto;
import com.barber.app.service.ContentApiService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the barber shop application.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private ContentApiService contentApiService;
	
	/**
	 * 바버샵 메인 페이지를 렌더링합니다. (모든 섹션 포함)
	 */
	/**
	 * 모든 페이지에 공통으로 매장 정보를 주입합니다.
	 * SHOP_INFO 타입 콘텐츠에서 로딩: title=상호명, description=주소, skills=전화번호
	 */
	private void addShopInfo(Model model) {
		StaffContentDto shopInfo = contentApiService.getShopInfo();
		if (shopInfo != null) {
			model.addAttribute("shopName",    shopInfo.getTitle());
			model.addAttribute("shopAddress", shopInfo.getDescription());
			model.addAttribute("shopPhone",   shopInfo.getSkills());
		} else {
			model.addAttribute("shopName",    "BarberGarden");
			model.addAttribute("shopAddress", "");
			model.addAttribute("shopPhone",   "");
		}

		// 소셜 링크 - SOCIAL_LINKS 콘텐츠: title=인스타, description=유튜브, skills=네이버예약
		StaffContentDto social = contentApiService.getSocialLinks();
		if (social != null) {
			model.addAttribute("instagramUrl",    social.getTitle());
			model.addAttribute("youtubeUrl",      social.getDescription());
			model.addAttribute("naverBookingUrl", social.getSkills());
		} else {
			model.addAttribute("instagramUrl",    "https://www.instagram.com/bbgarden_k");
			model.addAttribute("youtubeUrl",      "https://youtube.com/@bbgardenk");
			model.addAttribute("naverBookingUrl", "https://booking.naver.com/booking/13/bizes/669304");
		}
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome to BarberGarden! The client locale is {}.", locale);

		addShopInfo(model);

		List<StaffContentDto> heroList    = contentApiService.getVisibleContentsByType("HERO");
		List<StaffContentDto> staffList   = contentApiService.getVisibleContentsByType("STAFF");
		List<StaffContentDto> galleryList = contentApiService.getVisibleContentsByType("GALLERY");

		StaffContentDto hero = heroList.isEmpty() ? null : heroList.get(0);
		model.addAttribute("hero",        hero);
		model.addAttribute("staffList",   staffList);
		model.addAttribute("galleryList", galleryList);
		logger.info("히어로: " + heroList.size() + "건, 직원: " + staffList.size() + "건, 갤러리: " + galleryList.size() + "건 로딩");

		return "barbershop";
	}

	/**
	 * 직원소개 페이지를 렌더링합니다.
	 */
	@RequestMapping(value = "/staff", method = RequestMethod.GET)
	public String staff(Locale locale, Model model) {
		logger.info("Staff page accessed. The client locale is {}.", locale);

		addShopInfo(model);

		List<StaffContentDto> staffList = contentApiService.getVisibleContentsByType("STAFF");
		model.addAttribute("staffList", staffList);
		logger.info("직원: {}건 로딩", staffList.size());

		return "staff";
	}

	/**
	 * 갤러리 페이지를 렌더링합니다.
	 */
	@RequestMapping(value = "/gallery", method = RequestMethod.GET)
	public String gallery(Locale locale, Model model) {
		logger.info("Gallery page accessed. The client locale is {}.", locale);

		addShopInfo(model);

		List<StaffContentDto> galleryList = contentApiService.getVisibleContentsByType("GALLERY");
		model.addAttribute("galleryList", galleryList);
		logger.info("갤러리: {}건 로딩", galleryList.size());

		return "gallery";
	}

	/**
	 * 매장정보 페이지 (home.jsp의 /location 링크 대응)
	 */
	@RequestMapping(value = "/location", method = RequestMethod.GET)
	public String location(Locale locale, Model model) {
		logger.info("Location page accessed.");
		addShopInfo(model);
		return "barbershop";
	}

	/**
	 * 아카데미 메인 페이지를 렌더링합니다.
	 */
	@RequestMapping(value = "/academy", method = RequestMethod.GET)
	public String academy(Locale locale, Model model) {
		logger.info("Academy page accessed. The client locale is {}.", locale);
		addShopInfo(model);
		return "academy";
	}

	/**
	 * 아카데미 - 과정 및 가격 페이지를 렌더링합니다.
	 */
	@RequestMapping(value = "/academy/courses", method = RequestMethod.GET)
	public String academyCourses(Locale locale, Model model) {
		logger.info("Academy courses page accessed.");
		addShopInfo(model);
		return "academy-courses";
	}

	/**
	 * 아카데미 - 후기 페이지를 렌더링합니다.
	 */
	@RequestMapping(value = "/academy/reviews", method = RequestMethod.GET)
	public String academyReviews(Locale locale, Model model) {
		logger.info("Academy reviews page accessed.");
		addShopInfo(model);
		return "academy-reviews";
	}

	/**
	 * 아카데미 - QnA 페이지를 렌더링합니다.
	 */
	@RequestMapping(value = "/academy/qna", method = RequestMethod.GET)
	public String academyQna(Locale locale, Model model) {
		logger.info("Academy QnA page accessed.");
		addShopInfo(model);
		return "academy-qna";
	}

}
