package fpt.edu.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

import fpt.edu.project.bean.CategoryProductCount;
import fpt.edu.project.service.ProductServiceImpl;

@RestController
public class ProductAdminRestController {
	@Autowired
	public ProductServiceImpl productService;

	@RequestMapping("/getproductcategorycount")
	public List<CategoryProductCount> admin() {
		String ajaxString = "";
		ObjectMapper mapper = new ObjectMapper();
		return productService.findCategoryCount();
	}
}
