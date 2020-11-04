package fpt.edu.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fpt.edu.project.service.CategoryServiceImpl;
import fpt.edu.project.service.ProductServiceImpl;

@Controller
public class ProductAdminController {
	@Autowired
	public ProductServiceImpl productService;
	@Autowired
	public CategoryServiceImpl categoryServiceImpl;

	@RequestMapping(value = "admin/products", method = RequestMethod.GET)
	public String showProduct(@RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
			@RequestParam(name = "size", required = false, defaultValue = "10") Integer size, ModelMap model) {
		Pageable pageable = PageRequest.of(page, size);
		int num = (int) Math.ceil(productService.count() / 10);
		model.addAttribute("numpage", num);
		model.addAttribute("listproduct", productService.findProducts(pageable).getContent());

		return "admin/showallproduct";

	}

	@RequestMapping(value = "admin/addproduct", method = RequestMethod.GET)
	public String addproduct() {
		return "admin/addproduct";
	}

	@RequestMapping(value = "admin/searchproducts", method = RequestMethod.GET)
	public String searchproduct(@RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
			@RequestParam(name = "size", required = false, defaultValue = "10") Integer size, ModelMap model,
			@RequestParam(name = "txtName") String name) {
		Pageable pageable = PageRequest.of(page, size);
		int num = (int) Math.ceil(productService.count() / 10);
		model.addAttribute("numpage", num);
		model.addAttribute("listproduct", productService.searchproduct(pageable, name).getContent());
		return "admin/showallproduct";
	}

}
