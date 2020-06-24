package security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.vin.domain.UserVO;
import kr.vin.mapper.UserMapper;

public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	UserMapper security;

	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("오니, id :" + username);
		System.out.println("Security :" + security);// null
		
	
		UserVO member = security.id_all_check(username);

		System.out.println(member);

		if (member == null) {

			throw new UsernameNotFoundException(username);
		}
		CustomUserDetails user = new CustomUserDetails(member);
		return user;

		

	}
}