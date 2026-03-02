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
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome to BarberGarden! The client locale is {}.", locale);
		
		model.addAttribute("shopName", "BarberGarden");
		model.addAttribute("shopDescription", "프리미엄 바버샵 서비스");
		model.addAttribute("shopAddress", "석촌동 174-15 2층 바버가든");
		model.addAttribute("shopPhone", "010-5539-0831");

		// 어드민 백엔드 API에서 콘텐츠 로딩
		List<StaffContentDto> heroList    = contentApiService.getVisibleContentsByType("HERO");
		List<StaffContentDto> staffList   = contentApiService.getVisibleContentsByType("STAFF");
		List<StaffContentDto> galleryList = contentApiService.getVisibleContentsByType("GALLERY");

		// 히어로 섹션: 첫 번째 항목 사용
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
		
		model.addAttribute("shopName", "BarberGarden");
		model.addAttribute("shopAddress", "석촌동 174-15 2층 바버가든");
		model.addAttribute("shopPhone", "010-5539-0831");

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
		
		model.addAttribute("shopName", "BarberGarden");
		model.addAttribute("shopAddress", "석촌동 174-15 2층 바버가든");
		model.addAttribute("shopPhone", "010-5539-0831");

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
		
		// 바버샵 정보를 모델에 추가
		model.addAttribute("shopName", "BarberGarden");
		model.addAttribute("shopAddress", "석촌동 174-15 2층 바버가든");
		model.addAttribute("shopPhone", "010-5539-0831");
		
		return "academy";
	}
	
}
