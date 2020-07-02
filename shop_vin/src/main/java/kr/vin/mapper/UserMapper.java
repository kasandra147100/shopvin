package kr.vin.mapper;

import java.util.ArrayList;
import java.util.List;

import kr.vin.domain.UserVO;


public interface UserMapper {

	// @Select("select * from user_tbl")
	public List<UserVO> getList();

	public void insert(UserVO user) throws Exception;

	public void insertSelectKey(UserVO user) throws Exception;

	public UserVO read(String userId) throws Exception;
	
	public int delete(String userId) throws Exception;
	
	public int update(UserVO user) throws Exception;
	
	public UserVO idCheck(String id) throws Exception;

	public int checkOverId(String userId);

	public ArrayList<UserVO> idCheck(UserVO vo);
	
	public UserVO id_all_check(String id);

	public void Member_dete(String userId);

	public void memberUpdate(UserVO vo) throws Exception;
	
	}


