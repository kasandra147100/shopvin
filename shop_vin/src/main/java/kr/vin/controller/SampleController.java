package kr.vin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/sample/*")
@Controller
public class SampleController {
	
	@GetMapping("/all")
	public void doAll() {
		
		log.info("do all can 접근 모두");
		}
	
	@GetMapping("/member")
	public void domember() {
		
		log.info("로그인 멤버");
		}
	@GetMapping("/admin")
	public void doAdmin() {
		
		log.info("amdin only 어드민");
		}
	

}
