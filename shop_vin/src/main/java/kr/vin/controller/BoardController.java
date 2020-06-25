package kr.vin.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.vin.domain.BoardAttachVO;
import kr.vin.domain.BoardVO;
import kr.vin.domain.Criteria;
import kr.vin.domain.PageDTO;
import kr.vin.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/* @Controller : 스프링 프레임워크에 이 클래스는 controller이다.
- 컴포넌트 중 하나이다.
- 위 어노테이션이 있으면 자동으로 메모리에 등록된다.
 - 생성, 초기화, 할당을 모두 자동으로 처리한다.
 @RequestMapping : url 요청에 대한 처리를 명시한다.
 - @WebServlet 역할과 비슷하다. */
@Log4j
@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;

	/*
	 * @GetMapping : 페이지 요청 방식이 get일 경우.
	 * 
	 * @PostMapping : 페이지 요청 방식이 post일 경우.
	 */

//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("list");
//		model.addAttribute("list", service.getList());
//// 과거 jsp에서는 request.setAttribute로 ArrayList를 전달했지만, 같은 역할을model이 대신한다.
//	}

	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
//		log.info("list");
//		model.addAttribute("list", service.getList());
		// 과거 jsp에서는 request.setAttribute로 ArrayList를 전달했지만,
		// 같은 역할을 model이 대신한다.

		log.info("list: " + cri);
		int total = service.getTotal(cri);
		log.info("total : " + total);

		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

// jsp 대비로 if~else 분기 처리가 필요 없음.
	@PostMapping("/writer")
	public String writer(BoardVO board, RedirectAttributes rttr) {
// @Controller 어노테이션이 붙고,
// 컴포넌트 스캔에 패키지가 지정되어 있다면,
// 매개변수 인자들은 스프링이 자동으로 생성 할당 함.
		log.info("writer : " + board);
		if (board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}

		service.writer(board);
		rttr.addFlashAttribute("result", board.getBno());

		return "redirect:/board/list";
	}

	@GetMapping("/writer")
	public void writer() {

	}

	// 제목 링크를 클릭하여 글 상세보기 - get 방식.
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam(value = "bno", required = false) Long bno, @ModelAttribute("cri") Criteria cri,
			Model model) {
		// @ModelAttribute("cri") 는 자동으로 객체 할당 저장.
		// 자동으로 생성된 Criteria cri를 모델값으로 저장하는데,
		// 저장명이 cri
		// model.addAttribute("cri",cri) 와 같음.

		// @RequestParam : 요청 전달값으로 글번호 이용.
		// 매개 변수명과 전달값명이 다를때 이용 가능. 현재 코드에서는 생략 가능함.
		log.info("/get");
		model.addAttribute("board", service.get(bno));
		// jsp에서 request.setAttribute 하던 것과 비슷.
		// 전달값으로 명시만 하면 스프링이 자동 처리.
		// 사용하는 부분만 추가 구현.
	}

	// post 요청으로 /modify 가 온다면, 아래 메소드 수행.
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		// 수정이 성공하면 success 메세지가 포함되어 이동.
		// 실패해도 메세지 빼고 이동.

//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());

//		return "redirect:/board/list" ;
		return "redirect:/board/list" + cri.getListLink();
	}

	@PostMapping("/remove")
	public String remove(@RequestParam(value = "bno", required = false) Long bno, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		log.info("remove..." + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());

//		return "redirect:/board/list";
		return "redirect:/board/list" + cri.getListLink();
	}

	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {
		log.info("getAttachList: " + bno);
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}

	private void deleteFiles(List<BoardAttachVO> attachList) {
		// 게시물당 첨부된 파일을 찾아서 디스크에서 삭제.
		if (attachList == null || attachList.size() == 0) {
			return;
		}
		log.info("delete attach file......");
		log.info(attachList);
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get(
						"c:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
	}

} // end of class
