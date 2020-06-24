package kr.vin.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.vin.domain.Criteria;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private ProductService service;
	
//	@Test
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
	
//	@Test
//	
//	public void testRegister() {
//		ProductVO product = new ProductVO();
//		product.setProductName("새로운 상품명 select key");
//		product.setProductPrice("새로운 상품가격 select key");
//		product.setProductDesc("새로운 상품설명 select key");
//		
//		service.register(product);
//		
//		log.info("생성된 게시물 번호: " + product.getBno());
//	}
//	@Test
//	public void testGetList() {
//		service.getList().forEach(product -> log.info(product));
//	}
//	@Test
//	public void testGet() {
//		log.info(service.get(1L));
//	}
//	@Test
//	public void testDelete() {
//		log.info("REMOVE RESULT : " + service.remove(2L));
//	}
	
//	@Test
//	public void testUpdate() {
//		ProductVO product = service.get(4L);
//
//		if (product == null) {
//			return;
//		}
//
//		product.setProductName("상품명 수정합니다");
//		log.info("MODIFY RESULT : " + service.modify(product));
//	}

	@Test
	public void testGetList() {
		service.getList(
				new Criteria(2, 10)).forEach(product -> log.info(product));
	}
}
