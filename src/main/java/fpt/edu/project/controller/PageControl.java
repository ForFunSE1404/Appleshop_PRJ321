package fpt.edu.project.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fpt.edu.project.model.Account;
import fpt.edu.project.model.Product;
import fpt.edu.project.service.AccountServiceImpl;
import fpt.edu.project.service.CartDetailServiceImpl;

@Controller
public class PageControl {

	@Autowired
	private AccountServiceImpl accountService;
	@Autowired
	private CartDetailServiceImpl cartDetailService;

	@RequestMapping(value = "/")
	public String index(ModelMap model, Authentication authentication, Principal principal, HttpSession session) {
		if (authentication != null && principal != null) {
			Account account = accountService.findById(principal.getName()).get();
			session.setAttribute("account", account);
			session.setAttribute("isAdmin", authentication.getAuthorities().toString().contains("ROLE_ADMIN"));
		}
		List<Product> listProduct = cartDetailService.getLastestProduct();
		model.addAttribute("listbestsell", listProduct);
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

	@RequestMapping(value = "/inforuser")
	public String inforuser(HttpSession session, Authentication authentication, Principal principal) {
		if (authentication != null && principal != null) {
			Account account = accountService.findById(principal.getName()).get();
			session.setAttribute("account", account);
			session.setAttribute("isAdmin", authentication.getAuthorities().toString().contains("ROLE_ADMIN"));
		}
		return "user/inforuser";
	}

	@RequestMapping(value = "/404page")
	public String errorpage() {

		return "user/404";
	}
}
