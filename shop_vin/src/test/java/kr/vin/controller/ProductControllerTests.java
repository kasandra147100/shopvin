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

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class ProductControllerTests {

	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;
	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

//	목록보기
//	@Test()
//	public void testList() throws Exception{
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/product/list"))				
//		.andReturn().getModelAndView().getModelMap());
//	}

//	등록테스트
//	@Test()
//	public void testRegister() throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post( 		//POST방식이용, param() : 전달해야할 파라미터지정
//				"/product/register")
//				.param("productName", "테스트 새상품명")
//				.param("productPrice", "테스트 새상품가격")
//				.param("productDesc", "테스트 새상품설명")
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}

//	조회
//	@Test()
//	public void testGet() throws Exception{
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/product/get") // GET방식
//				.param("bno", "21")) // 전달할 파라미터
//				.andReturn()
//				.getModelAndView().getModelMap());
//	}

//	수정
//	@Test()
//	public void testModify() throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post(
//				"/product/modify")
//				.param("bno","1")
//				.param("productName", "수정된 새상품명")
//				.param("productPrice", "수정된 새상품가격")
//				.param("productDesc", "수정된 새상품설명")
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}

//	삭제
//	@Test()
//	public void testRemove() throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post(
//				"/product/remove")
//				.param("bno","1"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}

	@Test
	public void testList() throws Exception {
		log.info(
				mockMvc.perform(
						MockMvcRequestBuilders.get("/product/list")
				.param("pageNum", "2")
				.param("amount", "10"))
				.andReturn().getModelAndView().getModelMap()
				);
	}

}
