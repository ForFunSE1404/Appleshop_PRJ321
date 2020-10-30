package fpt.edu.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fpt.edu.project.service.ProductServiceImpl;

@Controller
public class ProductAdminController {
	@Autowired
	public ProductServiceImpl productService;

	@RequestMapping(value = "admin/products", method = RequestMethod.GET)
	public String showProduct(Model model) {
		model.addAttribute("listproduct", productService.findAll());
		return "admin/showallproduct";
	}

	@RequestMapping(value = "admin/addproduct", method = RequestMethod.GET)
	public String addproduct() {
		return "admin/addproduct";
	}
}
