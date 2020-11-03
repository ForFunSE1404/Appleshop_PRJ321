package fpt.edu.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
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
import fpt.edu.project.service.CategoryServiceImpl;
import fpt.edu.project.service.ProductServiceImpl;

@Controller
public class ProductAdminController {
	@Autowired
	public ProductServiceImpl productService;
	@Autowired
	public ProductRepository productRepository;
	@Autowired
	public CategoryServiceImpl categoryServiceImpl;

	@RequestMapping(value = "admin/products", method = RequestMethod.GET)
	public String showProduct(@RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
			@RequestParam(name = "size", required = false, defaultValue = "10") Integer size, ModelMap model) {
			Pageable pageable = PageRequest.of(page, size);
			int num = (int) Math.ceil(productRepository.count() / 10);
			model.addAttribute("numpage", num);
			model.addAttribute("listproduct", productRepository.findProducts(pageable).getContent());
        // model.addAttribute("listproduct", productService.findAll());
	
		return "admin/showallproduct";
	
	}
 
	@RequestMapping(value = "admin/addproduct", method = RequestMethod.GET)
	public String addproduct() {
		return "admin/addproduct";
	}
	
	@RequestMapping(value = "admin/searchproducts", method = RequestMethod.GET)
	public String searchproduct(ModelMap model, @RequestParam(name = "txtName") String name) {
		List<Product> product = productService.searchproduct(name);
		model.addAttribute("product", product);
		return "admin/showallproduct";
	}
	
}
