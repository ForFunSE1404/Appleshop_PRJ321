package fpt.edu.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fpt.edu.project.dao.AccountDao;
import fpt.edu.project.dao.CategoryDao;
import fpt.edu.project.model.Account;
import fpt.edu.project.model.Category;
import fpt.edu.project.model.Role;

@Controller
public class PageControl {
	@Autowired
	private AccountDao accountDao;
	@Autowired
	private CategoryDao categoryDao;

	@RequestMapping(value = "/index")
	public String index() {
//		accountDao.register(new Account("A0001",new Role(3,"Customer"),"12345","nhan@gmail.com","Nhan", true));
		accountDao.delete("A0001");
	accountDao.update(new Account("seller2", new Role(1,"Admin"),"aaaaaaa","agsa@gamail.com", "Nhan nguyen", false));
		for(Account acc : accountDao.showAll()) {
			System.out.println("Account ID "+acc.getUserId() + "Account name "+acc.getFullname());
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
