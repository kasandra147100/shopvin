package kr.vin.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String userid;
	private String userpw;
	private String userName;
	private boolean enabled; // 계정 정지 유무
	private Date regDate;
	private Date updateDate;
	private List<AuthVO> authList;
}
