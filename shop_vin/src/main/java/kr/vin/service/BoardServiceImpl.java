package kr.vin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.vin.domain.BoardAttachVO;
import kr.vin.domain.BoardVO;
import kr.vin.domain.Criteria;
import kr.vin.mapper.BoardAttachMapper;
import kr.vin.mapper.BoardMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void writer(BoardVO board) {
		log.info("writer......" + board);
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null ||
				board.getAttachList().size() <=0) {
				return;
				}
		
				board.getAttachList().forEach(attach->{
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
				});
		
	}

	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		log.info("get........" + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("수정........" + board);

		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		log.info("remove......" + bno);
		return (mapper.delete(bno)) == 1;
	}

//	@Override
//	public List<BoardVO> getList() {
//		// TODO Auto-generated method stub
//		log.info("getList...................");
//		return mapper.getList();
//	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("getListWithPaging....." + cri);

		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
	log.info("get Attach list by bno: "+bno);
	return attachMapper.findByBno(bno);
	// 게시물 번호를 전달하고,
	// 게시물 번호와 일치하는 첨부파일을 모두 리턴.
	}

	@Override
	public List<BoardVO> getQnaList(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("getQnaList...................");
		
		return mapper.getQnaList();
	
	}
	

}
