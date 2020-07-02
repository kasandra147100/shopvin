package kr.vin.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		
		if (error != null)
			model.addAttribute("error", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
		if (logout != null)
			model.addAttribute("logout", "로그아웃");
	}
	
	@GetMapping("/customLogout")
	public void logoutGet() {
	log.info("custom logout");
	}
	@PostMapping("/customLogout")
	public void logoutPost() {
	log.info("post custom logout");
	}
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		model.addAttribute("msg" , "Access Denied");
	}

	
	
	
}
