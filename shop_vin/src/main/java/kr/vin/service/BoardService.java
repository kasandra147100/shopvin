package kr.vin.service;

import java.util.List;

import kr.vin.domain.BoardAttachVO;
import kr.vin.domain.BoardVO;
import kr.vin.domain.Criteria;



public interface BoardService {
	public void writer(BoardVO board);

	public BoardVO get(Long bno);

	public boolean modify(BoardVO board);

	public boolean remove(Long bno);

	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(Long bno);

}
