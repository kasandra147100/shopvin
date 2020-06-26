package kr.vin.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
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

		// 파일은 1개 일수도 있고, 여러개 일수도 있음.
		for (MultipartFile multipartFile : uploadFile) {
			AttachFileDTO attachDTO = new AttachFileDTO();
			String uploadFileName = multipartFile.getOriginalFilename();
			// 파일의 원래 이름 저장.

			// 인터넷 익스플로러 경우, 예외 처리
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

			attachDTO.setFileName(uploadFileName);
			// 파일 이름 저장.

			UUID uuid = UUID.randomUUID();
			// universal unique identifier, 범용 고유 식별자.
			// 파일의 중복을 회피.

			uploadFileName = uuid.toString() + "_" + uploadFileName;
			// 예) uuid_일일일.txt

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				// 서버에 파일 저장.

				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);

				list.add(attachDTO);
				// 업로드된 파일 정보를 객체 배열에 담아서 리턴.
			} catch (Exception e) {
				e.printStackTrace();
			}
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

	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {

		log.info("deleteFile: " + fileName);
		File file;

		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			// 한글의 경우, 페이지 전환시 변경됨.
			// 알맞는 문자 포맷으로 해석해서 읽어들여야함.
			file.delete();
			// 파일 삭제.

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);

	}

	// 모든 파일은 내부적으로 bit값을 가짐.(문서, 영상, 이미지, 소리)
	// 비트 스트림을 재조합하여 파일로 구성.
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {
		// 서버에 접속한 브라우저의 정보는 헤더의 User-Agent를 보면 알 수 있음.

		Resource resource = new FileSystemResource("c:\\upload\\" + fileName);
		// 파일을 리소스(자원: 가공 처리를 위한 중간 단계)로 변경.
		log.info("resource: " + resource);

		if (resource.exists() == false) {//해당 자원이 존재하지 않는다면
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		String resourceName = resource.getFilename();
		// 리소스에서 파일명을 찾아서 할당.

		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);//실제 파일 명만 가져오겠다.
		// uuid를 제외한 파일명 만들기.
//
		HttpHeaders headers = new HttpHeaders();//웹 브라우저는 해석기이다.

		try {
			String downloadName = null;

			if (userAgent.contains("Trident")) {
				log.info("IE browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\", " ");

			} else if (userAgent.contains("Edge")) {
				log.info("Edge browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");

			} else {
				log.info("chrome browser");
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");// 브라우저별 특성을 말해주고있는 부분 if~else

			}
			log.info("downloadName: " + downloadName);
			headers.add("Content-disposition", "attachment; filename=" + downloadName);//여기에 정보를 추가함으로서 첨부파일인지 아닌지 판별하게된다.
			// 헤더에 파일 다운로드 정보 추가.
			//attachment는 천부파일이다. 바뀌는 파일명의 정보가 downloadName에 들어간다.

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);

	}
}