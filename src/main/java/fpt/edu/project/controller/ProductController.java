package fpt.edu.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fpt.edu.project.dao.CategoryDao;
import fpt.edu.project.dao.ProductDao;
import fpt.edu.project.model.Category;
import fpt.edu.project.model.Product;

@Controller

public class ProductController {

	@Autowired
	private ProductDao productDao;
	@Autowired
	private CategoryDao categoryDao;

	@RequestMapping(value = "/product")
	public String product(ModelMap model) {
		List<Product> listProduct = productDao.getList();
		model.addAttribute("listProduct", listProduct);
		List<Category> listCategories = categoryDao.getAllCategories();
		model.addAttribute("listCategories", listCategories);
		return "user/product";
	}

	@RequestMapping(value = "/category")
	public String productCategory(@RequestParam String catId, ModelMap model) {
		List<Category> listCategories = categoryDao.getAllCategories();
		model.addAttribute("listCategories", listCategories);
		model.addAttribute("listProduct", categoryDao.search(catId).getProducts());
		return "user/product";
	}

	@RequestMapping(value = "/product_details")
	public String details(@RequestParam String proId, ModelMap model) {
		Product product = productDao.findProductByID(proId);
		model.addAttribute("product", product);
		return "user/product_details";
	}

}
