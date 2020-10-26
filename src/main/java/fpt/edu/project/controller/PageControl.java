package fpt.edu.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fpt.edu.project.model.Category;
import fpt.edu.project.model.Product;
import fpt.edu.project.service.CategoryServiceImpl;

@Controller
public class PageControl {
	@Autowired
	private CategoryServiceImpl categoryDao;


	@RequestMapping(value = "/")
	public String index() {

		return "user/index";
	}

	@RequestMapping(value = "/cart")
	public String cart() {
		return "user/cart";
	}



	@RequestMapping(value = "/register")
	public String register() {
		return "user/register";
	}

	@RequestMapping(value = "/wishlist")
	public String wishlist() {
		return "user/wishlist";
	}
}
