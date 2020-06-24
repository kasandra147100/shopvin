package kr.vin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.vin.domain.Criteria;
import kr.vin.domain.ReplyPageDTO;
import kr.vin.domain.ReplyVO;
import kr.vin.mapper.BoardMapper;
import kr.vin.mapper.ReplyMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		log.info("register......" + vo);
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		log.info("get......" + rno);
		return mapper.read(rno);
	}
	
	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("remove......" + rno);
		ReplyVO vo =mapper.read(rno);
		
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		return mapper.delete(rno);
	}

	@Override
	public int modify(ReplyVO reply) {
		log.info("modify......" + reply);
		return mapper.update(reply);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		log.info("get Reply list " + bno);
		return mapper.getListWithPaging(cri, bno);
	}
	
	
	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		
		return new ReplyPageDTO(mapper.getCountByBno(bno),
		mapper.getListWithPaging(cri, bno));
	}
	
	
	
	
	
	
}
