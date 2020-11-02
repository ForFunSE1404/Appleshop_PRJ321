package fpt.edu.project.controller;

import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import fpt.edu.project.model.Category;
import fpt.edu.project.model.Product;
import fpt.edu.project.repository.ProductRepository;
import fpt.edu.project.service.ProductServiceImpl;

@Controller
public class ProductAdminController {
	@Autowired
	public ProductServiceImpl productService;
	@Autowired
	public ProductRepository productRepository;

	@RequestMapping(value = "admin/products", method = RequestMethod.GET)
	public String showProduct(@RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
			@RequestParam(name = "size", required = false, defaultValue = "5") Integer size, ModelMap model) {
			Pageable pageable = PageRequest.of(page, size);
			model.addAttribute("numpage", Math.ceil(productRepository.count() / 5));
			model.addAttribute("listproduct", productRepository.findProducts(pageable).getContent());
			
        // model.addAttribute("listproduct", productService.findAll());
	
		return "admin/showallproduct";
	
	}
 
	@RequestMapping(value = "admin/addproduct", method = RequestMethod.GET)
	public String addproduct() {
		return "admin/addproduct";
	}
}
