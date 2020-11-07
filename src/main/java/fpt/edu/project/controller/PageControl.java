package fpt.edu.project.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import fpt.edu.project.model.Account;
import fpt.edu.project.service.AccountServiceImpl;

@Controller
public class PageControl {

	@Autowired
	private AccountServiceImpl accountService;

	@RequestMapping(value = "/")
	public String index(Authentication authentication, Principal principal, HttpServletRequest request) {
		if (authentication != null && principal != null) {
			Account account = accountService.findById(principal.getName()).get();
			HttpSession session = request.getSession();
			session.setAttribute("account", account);
			session.setAttribute("isAdmin", authentication.getAuthorities().toString().contains("ROLE_ADMIN"));

		}
		return "user/index";
	}

	@RequestMapping(value = "/forgot_password")
	public String forgotp() {
		
		return "user/forgotpassword";
	}
	
	@RequestMapping(value = "/changepassword")
	public String changepassword() {
		
		return "user/changepassword";
	}
	
	@RequestMapping(value = "/information")
	public String inputaddress() {
		
		return "user/information";
	}

	@RequestMapping(value = "/cart")
	public String cart() {
		return "user/cart";
	}

	@RequestMapping(value = "/wishlist")
	public String wishlist() {
		return "user/wishlist";
	}
}
