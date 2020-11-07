package fpt.edu.project.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fpt.edu.project.service.CategoryServiceImpl;

@Controller
public class PageControl {
	@Autowired
	private CategoryServiceImpl categoryDao;

	@RequestMapping(value = "/")
	public String index(ModelMap model, Authentication authentication, Principal principal) {
		if (authentication != null) {
			System.out.print(authentication.getAuthorities());
			model.addAttribute("isAdmin", authentication.getAuthorities().toString().contains("ROLE_ADMIN"));

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
