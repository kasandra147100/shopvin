package kr.vin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.vin.domain.BoardVO;
import kr.vin.domain.Criteria;

public interface BoardMapper {
	
	public List<BoardVO> getList();
	
	public List<BoardVO> getQnaList();	

	public List<BoardVO> getListWithPaging(Criteria cri);

	public void insert(BoardVO board);

	public BoardVO read(Long bno);

	public int delete(Long bno);

	public int update(BoardVO board);

	public void insertSelectKey(BoardVO board);
	// 생성되는 시퀀스 값을 확인하고 나머지 값 입력.
	
	public int getTotalCount(Criteria cri);
	// 총 게시물 갯수 파악
	
	public void updateReplyCnt(@Param("bno") Long bno
			, @Param("amount") int amount);

}
