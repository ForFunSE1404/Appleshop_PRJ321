package fpt.edu.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import fpt.edu.project.dao.AccountDao;
import fpt.edu.project.dao.RoleDao;
import fpt.edu.project.model.Account;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	@Autowired
	private AccountDao accountDao;
	@Autowired
	private RoleDao roleDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account account = accountDao.findUserAccount(username);
		if (account == null) {
			System.out.println("User not found! " + username);
			throw new UsernameNotFoundException("User " + username + " was not found in the database");
		} else {

		}

		List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
		// ROLE_USER, ROLE_ADMIN,..
		String roleName = roleDao.getRoleName(account.getRole().getRoleId());
		switch (roleName) {
		case "ROLE_ADMIN":
			grantList.add(new SimpleGrantedAuthority("ROLE_USER"));
			grantList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
			break;
		case "ROLE_USER":
			grantList.add(new SimpleGrantedAuthority("ROLE_USER"));
			break;
		}
		UserDetails userDetails = (UserDetails) new User(account.getUserId(), //
				account.getPassword(), grantList);

		return userDetails;
	}

}
