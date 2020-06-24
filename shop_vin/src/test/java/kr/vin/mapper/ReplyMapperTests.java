package kr.vin.mapper;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.vin.domain.ReplyVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	private Long[] bnoArr = { 203L, 202L, 201L, 200L, 199L  };
	// 현재 각자 디비에 등록되어 있는 가장 최근 게시물 5개의 번호, 

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

//	@Test
//	public void testMapper() {
//		log.info("테스트매퍼: " + mapper);
//	}
	
	@Test
	public void testCreate() {
		// 정수형을 스트림 형태로 전환. 범위 1~10.
		// 게시물당 2개씩 덧글 등록, 5*2 로 총 10번.
		IntStream.rangeClosed(1, 10).forEach(i -> {
			ReplyVO vo = new ReplyVO();

			vo.setBno(bnoArr[i % 5]); // 0~4
			vo.setReply("추가 댓글 테스트" + i);
			vo.setReplyer("추가 replyer" + i);

			mapper.insert(vo);
		});
	}
	
//	@Test
//	public void testRead() {
//		Long targetRno = 5L;//읽고자 하는 덧글 번호. 1~10 사이 아무거나 번호.
//		ReplyVO vo = mapper.read(targetRno);
//		log.info(vo);
//	}
	
//	@Test
//	public void testDelete() {
//		Long targetRno = 10L;
//		mapper.delete(targetRno);
//	}
	
//	@Test
//	public void testUpdate() {
//		
//		Long targetRno = 9L;
//		ReplyVO vo = mapper.read(targetRno);
//		
//		vo.setReply("Update Reply ");
//		
//		int count = mapper.update(vo);
//		log.info("update cont: " + count);
//		
//	}
	
	
	
	
//	@Test
//	public void testList() {
//		Criteria cri = new Criteria();
//		List<ReplyVO> replies 
//		= mapper.getListWithPaging(cri, bnoArr[0]);
//		replies.forEach(reply -> log.info(reply));
//	}
	
	
//	@Test
//	public void testList2() {
//		Criteria cri = new Criteria(1, 10); // 1페이지, 10개씩
//		List<ReplyVO> replies 
//		= mapper.getListWithPaging(cri, 202L);
//		// 611L 은 게시물 번호.
//		replies.forEach(reply -> log.info(reply));
//	}
//	
	
//	@Test
//	public void testList2() {
//	Criteria cri = new Criteria(1,10); // (1,2)
//	List<ReplyVO> replies
//	= mapper.getListWithPaging(cri, 203L);
//	// 174L 은 게시물 번호.
//	replies.forEach(reply->log.info(reply));
//	}
	
	
	
	
	
}









