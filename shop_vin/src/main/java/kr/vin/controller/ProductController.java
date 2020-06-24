package kr.vin.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.vin.domain.Criteria;
import kr.vin.domain.PageDTO;
import kr.vin.domain.ProductVO;
import kr.vin.service.ProductService;
import kr.vin.utils.UploadFileUtils;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor // 생성자 자동 주입
public class ProductController {

	private ProductService service;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@GetMapping("/list")
	public String list(Model model, Criteria cri) {
		log.info("list : " + cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		return "/product/list";
	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		// bno값 명시적 처리, 해당번호의 게시물을 전달할 파라미터 Model
		log.info("/get or modify");
		model.addAttribute("product", service.get(bno));
	}

	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String register(ProductVO product, MultipartFile file, RedirectAttributes rttr)
			throws IOException, Exception {
		log.info("register : " + product);

		String imagesPath = uploadPath + File.separator + "images";
		String ymdPath = UploadFileUtils.calcPath(imagesPath);
		String fileName = null;

		if (file != null) {
			fileName = UploadFileUtils.fileUpload(imagesPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		product.setProductImg(File.separator + "images" + ymdPath + File.separator + fileName);
		product.setProductThumbImg(
				File.separator + "images" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		service.register(product);
		rttr.addFlashAttribute("result", product.getBno());
		return "redirect:/product/list";
	}

	@PostMapping("/modify")
	public String modify(ProductVO product, MultipartFile file, HttpServletRequest req,
			@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws IOException, Exception {
		log.info("modify:" + product);

		// 새로운 파일이 등록되었는지 확인
		if ((file.getOriginalFilename() != null)) {
			// 기존 파일을 삭제
			System.out.println("666666666666666666666");
			new File(uploadPath + req.getParameter("productImg")).delete();
			new File(uploadPath + req.getParameter("productThumbImg")).delete();

			// 새로 첨부한 파일을 등록
			String imagesPath = uploadPath + File.separator + "images";
			String ymdPath = UploadFileUtils.calcPath(imagesPath);
			String fileName = UploadFileUtils.fileUpload(imagesPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);

			product.setProductImg(File.separator + "images" + ymdPath + File.separator + fileName);
			product.setProductThumbImg(
					File.separator + "images" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			product.setProductImg(req.getParameter("productImg"));
			product.setProductThumbImg(req.getParameter("productThumbImg"));

		}

		if (service.modify(product)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:/product/list";

	}

	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		// 삭제 후 페이지이동
		log.info("remove : " + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "sucess");
		}
		rttr.addFlashAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("amount", cri.getAmount());

		return "redirect:/product/list";
	}

}
