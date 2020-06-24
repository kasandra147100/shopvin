package kr.vin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.vin.domain.Criteria;
import kr.vin.domain.ReplyVO;



public interface ReplyMapper {
	public int insert(ReplyVO vo);

	public ReplyVO read(Long rno);

	public int delete(Long rno);

	public int update(ReplyVO reply);

	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri
		  , @Param("bno") Long bno);
// 페이지 정보와 게시물 번호를 전달.
	
	public int getCountByBno(Long bno);
	// 게시물별 댓글 총갯수 파악.

	
	
}
