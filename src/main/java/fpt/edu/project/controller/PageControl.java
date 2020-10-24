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
		categoryDao.newCategory(new Category("C0001","a1"));
		categoryDao.newCategory(new Category("C0002","a2"));
		categoryDao.update("AP1", "Lol ma may ");
//		categoryDao.delete("AP5");
		for(Category cate : categoryDao.getAllCategories()) {
			System.out.println("Category ID "+cate.getCategoryId()+"|| Category name "+cate.getCategoryName());
		}
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

	@RequestMapping(value = "/wishlist")
	public String wishlist() {
		return "user/wishlist";
	}

}
