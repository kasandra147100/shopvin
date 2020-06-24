package kr.vin.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.vin.domain.Criteria;
import kr.vin.domain.ReplyPageDTO;
import kr.vin.domain.ReplyVO;



public interface ReplyService {
	public int register(ReplyVO vo);
	public ReplyVO get(Long rno);
	public int remove(Long rno);
	public int modify(ReplyVO reply);
	public List<ReplyVO> getList(
			@Param("cri") Criteria cri
			, @Param("bno") Long bno);
	// 페이지 정보와 게시물 번호를 전달.
	// @Param : Query 매개변수에 전달 이름.
	public ReplyPageDTO getListPage(Criteria cri, Long bno);


}
