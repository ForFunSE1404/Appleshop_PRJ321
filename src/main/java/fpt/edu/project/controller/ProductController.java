package fpt.edu.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fpt.edu.project.model.Product;
import fpt.edu.project.service.CartDetailServiceImpl;
import fpt.edu.project.service.CategoryServiceImpl;
import fpt.edu.project.service.ProductServiceImpl;

@Controller

public class ProductController {

	@Autowired
	private ProductServiceImpl productService;
	@Autowired
	private CategoryServiceImpl categoryService;
	@Autowired
	private CartDetailServiceImpl cartDetailService;

	@RequestMapping(value = "/product")
	public String productCategory(@RequestParam(name = "catId", required = false) String catId,
			@RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(name = "size", required = false, defaultValue = "12") Integer size,
			@RequestParam(name = "keySearch", required = false) String keySearch, ModelMap model) {
		model.addAttribute("listCategories", categoryService.findAll());
		page = page - 1;
		List<Product> listProduct = null;
		long numpage = 1;
		Pageable pageable = PageRequest.of(page, size);
		if (catId == null && keySearch == null) {
			listProduct = productService.findProductsVisibile(pageable).getContent();
			numpage = productService.countAllProductsVisibile();
		} else if (catId == null && keySearch != null) {
			listProduct = productService.findProductByNameVisible(keySearch, pageable).getContent();
			numpage = productService.countProductsByNameVisible(keySearch);
		} else if (catId != null && keySearch == null) {
			listProduct = productService.findProductByCategoryVisible(catId, pageable).getContent();
			numpage = productService.countProductsByCategoryVisible(catId);
		}
		model.addAttribute("listProduct", listProduct);
		model.addAttribute("numpage", ((long) numpage / size) + 1);
		return "user/product";
	}

	@RequestMapping(value = "/product_details")
	public String details(@RequestParam String proId, ModelMap model) {
		Product product = productService.findById(proId).get();
		model.addAttribute("product", product);
		List<Product> listProduct = cartDetailService.getLastestProduct();
		model.addAttribute("listbestsell", listProduct);
		return "user/product_details";
	}

}
