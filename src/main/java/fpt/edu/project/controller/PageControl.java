package fpt.edu.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fpt.edu.project.dao.AccountDao;
import fpt.edu.project.dao.CategoryDao;
import fpt.edu.project.model.Category;

@Controller
public class PageControl {
	@Autowired
	private AccountDao accountDao;
	@Autowired
	private CategoryDao categoryDao;

	@RequestMapping(value = "/index")
	public String index() {
		return "user/index";
	}

	@RequestMapping(value = "/product")
	public String product(ModelMap model) {
		List<Category> listCategories = categoryDao.getAllCategories();
		model.addAttribute("listCategories", listCategories);
		return "user/product";
	}

	@RequestMapping(value = "/cart")
	public String cart() {
		return "user/cart";
	}

	@RequestMapping(value = "/details")
	public String details() {
		return "user/product_details";
	}

	@RequestMapping(value = "/login")
	public String login() {
		return "user/login";
	}

}
