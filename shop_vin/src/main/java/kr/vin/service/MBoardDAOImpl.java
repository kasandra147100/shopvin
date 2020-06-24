package kr.vin.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.vin.domain.MBoardVO;

@Repository
public class MBoardDAOImpl implements MBoardDAO {
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<MBoardVO> getMBoardList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.vin.mapper.MBoardMapper.getMBoardList");
	}

	@Override
	public MBoardVO getBoardContent(Long bid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.vin.mapper.MBoardMapper.getMBoardContent", bid);
	}

	@Override
	public int insertMBoard(MBoardVO mboardVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("kr.vin.mapper.MBoardMapper.insertMBaord", mboardVO);
	}

	@Override
	public int updateMBoard(MBoardVO mboardVO) {
		// TODO Auto-generated method stub
		return sqlSession.update("kr.vin.mapper.MBoardMapper.updateeMBoard", mboardVO);
	}

	@Override
	public int deleteMBoard(Long bid) {
		// TODO Auto-generated method stub
		return sqlSession.insert("kr.vin.mapper.MBoardMapper.deleteMBoard", bid);
	}

	@Override
	public int updateViewCnt(Long bid) {
		// TODO Auto-generated method stub
		return sqlSession.update("kr.vin.mapper.MBoardMapper.updateViewCnt" , bid);
	}

}
