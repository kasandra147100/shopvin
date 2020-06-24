package kr.vin.domain;

import lombok.Data;

@Data
public class UserVO {
	private String userId;
	private String userPw;
	private String userName;
	private String Birth;
	private String zipCode;
	private String userAddr;
	private String userAddr2;
	private String userPhone;
	private String userMail;
	private String detailAddr;
	private String extraAddr;
	int Enabled;
	private String AUTHORITY;
	
}