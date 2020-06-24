package kr.vin.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.vin.domain.BoardVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
// 어노테이션에 전달값이 여러개의 배열 형태라면 {} 이용
	@Setter(onMethod_ = { @Autowired })
	private BoardService service;

	@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setTitle("서비스 새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("새로운 작성자");

		service.writer(board);
		log.info("생성된 게시물 번호: " + board.getBno());
	}
	
//	@Test
//	public void testGetList() {
//		
//		service.getList().forEach(board -> log.info(board));
//		
//	}
	
//	@Test
//	public void testGet() {
//		log.info(service.get(1L));
//	}
	
//	@Test
//	public void testDelete() {
//		
//		log.info("삭제 테스트 : " + service.remove(6L));
//	}
	
//	@Test
//	public void testUpdate() {
//		BoardVO board = service.get(27L);
//		
//		if(board == null) {
//			return;
//		}
//		
//		board.setTitle("제목 수정합니다.");
//		log.info("수정 테스트 : " + service.modify(board));
//	}
	
	
}
