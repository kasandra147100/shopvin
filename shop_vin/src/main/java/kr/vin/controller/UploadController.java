package kr.vin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.vin.domain.AttachFileDTO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {
	String uploadFolder = "c:\\upload";

	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
// rest 방식 으로 ajax 처리
// 파일을 받고 json 값을 리턴.
		List<AttachFileDTO> list = new ArrayList<>();
// 여러개 파일 저장을 위한 객체 배열 타입 선언.
		String uploadFolder = "c:\\upload";
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
// 예) c:\\upload\\2020\\05\\07 에 파일 저장 예정.
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
// 경로에 폴더들이 생성되어 있지 않다면, 폴더 생성.
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
// 파일 검색 시간을 줄이기 위해서,
// 폴더 1개에 모두 저장하는 것이 아니라,
// 년월일로 구분하여 폴더를 생성하고 그곳에 파일을 저장.
// File.separator : 폴더 구분자를 운영체제에 맞춰서 변경.
// 2019-09-18
// 2019/09/18 결과적으로 날짜별로 파일 저장.
	}
}