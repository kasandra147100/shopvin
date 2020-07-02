package kr.vin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.vin.domain.UserVO;
import kr.vin.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/**")
@AllArgsConstructor
public class UserController {

	@Autowired
	private UserService service;

	@GetMapping("/list")
	public String list(Model model) {
		log.info("list");

		model.addAttribute("list", service.getList());

		return "list";
	}

	

	// id 중복 체크 컨트롤러
    @RequestMapping(value = "idCheck", method = RequestMethod.POST)
    @ResponseBody
    public int idCheck(@RequestParam(value="userId") String userId) {

       System.out.println("오니");
       log.info("userid값 " + userId);
       
       return service.userIdCheck(userId);
    }
	
	
	
	@RequestMapping(value="/memberUpdateView", method=RequestMethod.GET)
	public String registerUpdateView() throws Exception{
		return "user/memberUpdateView";
		
	}
	
	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
	public String registerUpdate(UserVO vo, HttpSession session)throws Exception{
		service.memberUpdate(vo);
		session.invalidate();
		return "redirect:/";
	}
	

	
	

}

//	@PostMapping
//	public String register(UserVO user, RedirectAttributes rttr) {
//		log.info("Register: " + user);
//		service.register(user);
//		rttr.addFlashAttribute("result", user.getUserId());
//
//		return "redirect:/user/register";
//	}
