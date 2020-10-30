package fpt.edu.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fpt.edu.project.model.Category;
import fpt.edu.project.model.Product;
import fpt.edu.project.repository.ProductRepository;
import fpt.edu.project.service.CategoryServiceImpl;
import fpt.edu.project.service.ProductServiceImpl;

@Controller

public class ProductController {

	@Autowired
	private ProductServiceImpl productService;
	@Autowired
	private CategoryServiceImpl categoryService;
	@Autowired
	private ProductRepository productRepo;

	@RequestMapping(value = "/product_search")
	public String productSearch(@RequestParam String proName, ModelMap model) {
		List<Category> listCategories = categoryService.findAll();
		model.addAttribute("listCategories", listCategories);
//		List<Product> product = productService.findProductByName(proName);
//		model.addAttribute("listProduct", product);
		return "user/product";
	}

	@RequestMapping(value = "/product")
	public String productCategory(@RequestParam(required = false) String catId,
			@RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
			@RequestParam(name = "size", required = false, defaultValue = "12") Integer size, ModelMap model) {
		List<Category> listCategories = categoryService.findAll();
		model.addAttribute("listCategories", listCategories);
		if (catId == null) {
			Pageable pageable = PageRequest.of(page, size);
			model.addAttribute("numpage", Math.ceil(productRepo.count() / 12));
			model.addAttribute("listProduct", productRepo.findProducts(pageable).getContent());
		} else {
			model.addAttribute("listProduct", categoryService.findById(catId).get().getProducts());
		}
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
