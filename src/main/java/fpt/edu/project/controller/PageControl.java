package fpt.edu.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fpt.edu.project.dao.AccountDao;
import fpt.edu.project.dao.CategoryDao;
import fpt.edu.project.dao.ProductDao;
import fpt.edu.project.model.Category;
import fpt.edu.project.model.Product;

@Controller
public class PageControl {
	@Autowired
	private AccountDao accountDao;
	@Autowired
	private CategoryDao categoryDao;

	@Autowired
	private ProductDao productDao;

	@RequestMapping(value = "/index")
	public String index() {

		return "user/index";
	}

	@RequestMapping(value = "/product_cat")
	public String productCategory(@RequestParam String catId, ModelMap model) {
		List<Category> listCategories = categoryDao.getAllCategories();
		model.addAttribute("listCategories", listCategories);
		model.addAttribute("listProduct", categoryDao.search(catId).getProducts());
		return "user/product";
	}

	@RequestMapping(value = "/product")
	public String product(ModelMap model) {
		List<Product> listProduct = productDao.getList();
		model.addAttribute("listProduct", listProduct);
		List<Category> listCategories = categoryDao.getAllCategories();
		model.addAttribute("listCategories", listCategories);
		return "user/product";
	}

	@RequestMapping(value = "/cart")
	public String cart() {
		return "user/cart";
	}

	@RequestMapping(value = "/product_search")
	public String productSearch(@RequestParam String proName, ModelMap model) {
		List<Category> listCategories = categoryDao.getAllCategories();
		model.addAttribute("listCategories", listCategories);
		List<Product> product = productDao.findProductByName(proName);
		model.addAttribute("listProduct", product);
		return "user/product";
	}

	@RequestMapping(value = "/details")
	public String details(@RequestParam String proId, ModelMap model) {
		Product product = productDao.findProductByID(proId);
		model.addAttribute("product", product);
		return "user/product_details";
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
