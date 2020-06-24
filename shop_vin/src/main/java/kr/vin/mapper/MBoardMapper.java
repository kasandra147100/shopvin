package kr.vin.mapper;

import java.util.List;

import kr.vin.domain.MBoardVO;


public interface MBoardMapper {
	
	public List<MBoardVO> getMBoardList();
	
	public MBoardVO getBoardContent(Long bid);

	public int insertMBoard(MBoardVO mboardVO);
	
	public int updateMBoard(MBoardVO mbaordVO);
	
	public int deleteMBoard(Long bid);
	
	public int updateViewCnt(Long bid);

	

}
