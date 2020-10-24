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
<<<<<<< HEAD
		categoryDao.newCategory(new Category("C0001","a1"));
		categoryDao.newCategory(new Category("C0002","a2"));
		categoryDao.update("AP1", "Lol ma may ");
//		categoryDao.delete("AP5");
		for(Category cate : categoryDao.getAllCategories()) {
			System.out.println("Category ID "+cate.getCategoryId()+"|| Category name "+cate.getCategoryName());
		}
=======
		
>>>>>>> 3fbca3cebcf74c0f9f9093da7a28e9bf0d77a300
		return "user/index";
	}

	@RequestMapping(value = "/product")
	public String product(ModelMap model) {
		List<Product> listProduct = productDao.getAllProduct();
		model.addAttribute("listProduct",listProduct);
		List<Category> listCategories = categoryDao.getAllCategories();
		model.addAttribute("listCategories", listCategories);
		return "user/product";
	}

	@RequestMapping(value = "/cart")
	public String cart() {
		return "user/cart";
	}
	
	@RequestMapping(value= "/product_search")
	public String productSearch(@RequestParam String proName,ModelMap model) {
		List<Product> product = productDao.findProductByName(proName);
		model.addAttribute("listProduct",product);
		return "user/product";
	}

	@RequestMapping(value = "/details")
	public String details(@RequestParam String proId,ModelMap model) {
		Product product = productDao.findProductByID(proId);
		model.addAttribute("product",product);
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
