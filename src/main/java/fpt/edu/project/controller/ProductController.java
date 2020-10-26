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
import fpt.edu.project.service.ProductServiceImpl;

@Controller

public class ProductController {

	@Autowired
	private ProductServiceImpl productService;
	@Autowired
	private CategoryServiceImpl categoryService;

	@RequestMapping(value = "/product")
	public String product(ModelMap model) {
		List<Product> listProduct = productService.findAll();
		model.addAttribute("listProduct", listProduct);
		List<Category> listCategories = categoryService.findAll();
		model.addAttribute("listCategories", listCategories);
		return "user/product";
	}
	
	@RequestMapping(value = "/product_search")
	public String productSearch(@RequestParam String proName, ModelMap model) {
		List<Category> listCategories = categoryService.findAll();
		model.addAttribute("listCategories", listCategories);
		List<Product> product = productService.findProductByName(proName);
		model.addAttribute("listProduct", product);
		return "user/product";
	}
	
	@RequestMapping(value = "/category")
	public String productCategory(@RequestParam String catId, ModelMap model) {
		List<Category> listCategories = categoryService.findAll();
		model.addAttribute("listCategories", listCategories);
		model.addAttribute("listProduct", categoryService.findById(catId).get().getProducts());
		return "user/product";
	}

	@RequestMapping(value = "/product_details")
	public String details(@RequestParam String proId, ModelMap model) {
		Product product = productService.findById(proId).get();
		model.addAttribute("product", product);
		return "user/product_details";
	}
	
//	@RequestMapping(value = "/product")
//	public String 

}
