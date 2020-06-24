package kr.vin.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
// @WebAppConfiguration : Servlet 설정을 하겠다고 서버에 알린다.
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })

public class BoardControllerTests {

	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx; // 웹으로 프로그램을 테스트하기 위한 객체이다.

	private MockMvc mockMvc; // mvc 모델 모형 객체이다.

	@Before // 테스트 실행 전에 먼저 실행하라고 알린다.
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

// 리스트읽기	
// @Test
// public void testList() throws Exception {
// log.info(
//		 mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
//		 .andReturn().getModelAndView().getModelMap());
// 
// /*
// * /board/list 요청에 대한 처리를 get 방식으로 하고, 그 결과를 andReturn()으로 받아서,
// * getModelAndView()를 통해 model로 전환 후, 결과를 getModelMap()으로 jsp페이지로 출력한다.
// */
// 
// }

//	// 등록 테스트
//	@Test
//	public void testRegister() throws Exception {
//		String result = mockMvc
//				.perform(MockMvcRequestBuilders.post("/board/writer")
//						.param("title", "컨트롤러 테스트 제목")
//						.param("content", "컨트롤러 테스트 내용")
//						.param("writer", "user"))
//				.andReturn().getModelAndView().getViewName();
//		// 포스트 요청으로 /board/register 발생되면,
//		// 파라미터로 제목, 내용, 작성자를 전달하고,
//		// 그 결과를 받아서 전달할수 있는 mav 형태로 바꾸고,
//		// 그 객체의 이름을 표시.
//
//		log.info(result);
//	}
	
//	// 게시물 읽기
//	@Test
//	public void testGet() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get")
//				.param("bno", "17")).andReturn()
//				.getModelAndView().getModelMap());
//		// 2번 게시물 내용 읽기.
//	}
	
//	// 수정 테스트
//	@Test
//	public void testModify() throws Exception {
//		String result = mockMvc
//				.perform(MockMvcRequestBuilders.post("/board/modify")
//						.param("bno", "1")
//						.param("title", "수정된 테스트 새글 제목")
//						.param("content", "수정된 테스트 새글 내용")
//						.param("writer", "user"))
//				.andReturn().getModelAndView().getViewName();
//		log.info(result);
//	}

	// 삭제 테스트
	@Test
	public void testRemove() throws Exception {
		String result = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
				.param("bno", "60")).andReturn()
				.getModelAndView().getViewName();
// 25번 게시물 삭제 점검.
		log.info(result);
	}

} // end of class
