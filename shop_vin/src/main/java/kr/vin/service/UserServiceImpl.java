package kr.vin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.vin.domain.UserVO;
import kr.vin.mapper.UserMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service("UserService")
@AllArgsConstructor
@Repository

public class UserServiceImpl implements UserService {
	private UserMapper mapper;

	@Autowired
	private SqlSessionTemplate userSql;

	@Override
	public void register(UserVO user) throws Exception {
		log.info("register....." + user);

		mapper.insert(user);
	}

	@Override
	public List<UserVO> getList() {
		log.info("getList........");

		return mapper.getList();
	}

	@Override
	public int userIdCheck(String userId) {
		mapper = userSql.getMapper(UserMapper.class);

		return mapper.checkOverId(userId);
	}

	@Override
	public UserVO search(String id) {
		System.out.println(mapper.id_all_check(id));
		return mapper.id_all_check(id);
	}

	@Override
	public void Member_delete(String userId) {
		mapper.Member_dete(userId);

	}

	@Override
	public void memberUpdate(UserVO vo) throws Exception {
		mapper.memberUpdate(vo);
		
	}


}