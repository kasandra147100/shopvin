package kr.vin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.vin.domain.UserVO;

@Service
public interface UserService {

	public void register(UserVO user) throws Exception;

	public List<UserVO> getList();

	public int userIdCheck(String userId);
	
	public UserVO search(String id);
	
	


}
