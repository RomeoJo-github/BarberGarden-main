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
	 * 아카데미 페이지를 렌더링합니다.
	 */
	@RequestMapping(value = "/academy", method = RequestMethod.GET)
	public String academy(Locale locale, Model model) {
		logger.info("Academy page accessed. The client locale is {}.", locale);

		addShopInfo(model);

		return "academy";
	}
	
}
