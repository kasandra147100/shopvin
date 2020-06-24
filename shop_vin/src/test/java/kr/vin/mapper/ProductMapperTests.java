package kr.vin.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.vin.domain.Criteria;
import kr.vin.domain.ProductVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;

//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(product -> log.info(product));
//	}

//	@Test
//	public void testInsert() {
//		ProductVO product = new ProductVO();
//		product.setProductName("새로운 상품명");
//		product.setProductPrice("새로운 상품가격");
//		product.setProductPhoto("새로운 상품이미지");
//		mapper.insert(product);
//
//		log.info(product);
//
//	}
//	@Test
//	public void testInsertSelectKey() {
//		ProductVO product = new ProductVO();
//		product.setProductName("새로운 상품명 select key");
//		product.setProductPrice("새로운 상품가격 select key");
//		product.setProductDesc("새로운 상품설명 select key");
//		mapper.insertSelectKey(product);
//
//		log.info(product);
//	}
//	@Test
//	public void testRead() {
//		ProductVO product = mapper.read(3L); // 3번 게시물
//		
//		log.info(product);
//	}
//	
//	@Test
//	public void testDelete() {
//		log.info("DELETE COUNT: " + mapper.delete(3L));
//	}

//	@Test
//	public void testUpdate() {
//		ProductVO product = new ProductVO();
//		
//		product.setBno(1L);
//		product.setProductName("수정된 상품명");
//		product.setProductPrice("수정된 상품가격");
//		product.setProductDesc("수정된 설명");
//		
//		int count = mapper.update(product);
//		log.info("UPDATE COUNT: " + count);
//	}

	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		List<ProductVO> list = mapper.getListWithPaging(cri);
		list.forEach(product -> log.info(product));
	}
}