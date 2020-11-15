package fpt.edu.project.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	public String index(ModelMap model, Authentication authentication, Principal principal,
			HttpServletRequest request) {
		if (authentication != null && principal != null) {
			Account account = accountService.findById(principal.getName()).get();
			HttpSession session = request.getSession();
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
	public String inforuser() {

		return "user/inforuser";
	}

	@RequestMapping(value = "/404page")
	public String errorpage() {

		return "user/404";
	}
}
