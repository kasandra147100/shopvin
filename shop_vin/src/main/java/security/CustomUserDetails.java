package security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import kr.vin.domain.UserVO;

public class CustomUserDetails implements UserDetails {

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
	private String AUTHORITY;
	boolean Enabled;
	
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(AUTHORITY));
		return auth;

	}
	
	
	
	 public CustomUserDetails(UserVO vo) {
		 userId = vo.getUserId();
		 userPw = vo.getUserPw();
		 userName = vo.getUserName();
		 Birth = vo.getBirth();
		 zipCode = vo.getZipCode();
		 userAddr = vo.getUserAddr();
		 userAddr2= vo.getUserAddr2();
		 userPhone = vo.getUserPhone();
		 userMail = vo.getUserMail();
		 detailAddr = vo.getDetailAddr();
		 extraAddr = vo.getExtraAddr();
		AUTHORITY = vo.getAUTHORITY();
		
		if(vo.getEnabled()==1) {
		
			Enabled = true;
		}else {
			Enabled =false;
		}
		System.out.println(vo);
	}



	 @Override
	    public String getPassword() {
	        return userPw;
	    }
	 
	    @Override
	    public String getUsername() {
	        return userId;
	    }
	 
	    @Override
	    public boolean isAccountNonExpired() {
	        return true;
	    }
	 
	    @Override
	    public boolean isAccountNonLocked() {
	        return true;
	    }
	 
	    @Override
	    public boolean isCredentialsNonExpired() {
	        return true;
	    }
	 
	    @Override
	    public boolean isEnabled() {
	        return Enabled;
	    }
	    
	    public String getuserName() {
	        return userName;
	    }
	 
	    public void setuserName(String name) {
	        userName = name;
	    }
		public String getuserMail() {
			return userMail;
		}
		public void setEMAIL(String eMAIL) {
			userMail = eMAIL;
		}



		public String getUserId() {
			return userId;
		}



		public void setUserId(String userId) {
			this.userId = userId;
		}



		public String getUserPw() {
			return userPw;
		}



		public void setUserPw(String userPw) {
			this.userPw = userPw;
		}



		public String getUserName() {
			return userName;
		}



		public void setUserName(String userName) {
			this.userName = userName;
		}



		public String getBirth() {
			return Birth;
		}



		public void setBirth(String birth) {
			Birth = birth;
		}



		public String getZipCode() {
			return zipCode;
		}



		public void setZipCode(String zipCode) {
			this.zipCode = zipCode;
		}



		public String getUserAddr() {
			return userAddr;
		}



		public void setUserAddr(String userAddr) {
			this.userAddr = userAddr;
		}



		public String getUserAddr2() {
			return userAddr2;
		}



		public void setUserAddr2(String userAddr2) {
			this.userAddr2 = userAddr2;
		}



		public String getUserPhone() {
			return userPhone;
		}



		public void setUserPhone(String userPhone) {
			this.userPhone = userPhone;
		}



		public String getUserMail() {
			return userMail;
		}



		public void setUserMail(String userMail) {
			this.userMail = userMail;
		}



		public String getDetailAddr() {
			return detailAddr;
		}



		public void setDetailAddr(String detailAddr) {
			this.detailAddr = detailAddr;
		}



		public String getExtraAddr() {
			return extraAddr;
		}



		public void setExtraAddr(String extraAddr) {
			this.extraAddr = extraAddr;
		}



		public String getAUTHORITY() {
			return AUTHORITY;
		}



		public void setAUTHORITY(String aUTHORITY) {
			AUTHORITY = aUTHORITY;
		}



		public void setEnabled(boolean enabled) {
			Enabled = enabled;
		}

	    

}
