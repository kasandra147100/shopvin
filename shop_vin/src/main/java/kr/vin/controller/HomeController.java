package kr.vin.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.vin.domain.UserVO;
import kr.vin.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
@RequestMapping("/**")
@AllArgsConstructor
public class HomeController {
	
	
	@Autowired
	private UserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,Principal principal) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		String userid = principal.getName();
		System.out.println("아이디는: "+ userid);
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping(value = "/member/test", method = RequestMethod.GET)
	public String gotest(Locale locale, Model model,Principal principal) {
		String userid = principal.getName();
		System.out.println("아이디는"+userid);
		
		return "member/test";
	}
	
	// 로그인 컨트롤러
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String gologin() {

		return "login";
	}
	
	@PostMapping("/register")
	public String register(UserVO user, RedirectAttributes rttr) throws Exception {
		log.info("Register: " + user);
		service.register(user);
		rttr.addFlashAttribute("result", user.getUserId());

		return "redirect:/";
	}
	@RequestMapping(value = "register",method =RequestMethod.GET )
public String go_register() {
		
		return "register";
	
}
	
	
}
