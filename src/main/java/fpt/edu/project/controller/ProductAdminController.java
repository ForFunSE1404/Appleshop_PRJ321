package fpt.edu.project.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fpt.edu.project.service.ProductServiceImpl;
import fpt.edu.project.utils.WebUtils;

@Controller
public class ProductAdminController {
	@Autowired
	public ProductServiceImpl productService;
	
	@RequestMapping(value = "/admin2", method = RequestMethod.GET)
	public String showProduct(Model model, Principal principal) {

		User loginedUser = (User) ((Authentication) principal).getPrincipal();

		String userInfo = WebUtils.toString(loginedUser);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("listproduct", productService.findAll());
		return "admin/showallproduct";
	}
}
