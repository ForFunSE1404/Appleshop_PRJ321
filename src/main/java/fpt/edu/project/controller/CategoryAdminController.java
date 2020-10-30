package fpt.edu.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fpt.edu.project.service.CategoryServiceImpl;

@Controller
public class CategoryAdminController {
	@Autowired
	public CategoryServiceImpl categoryServiceImpl;

	@RequestMapping(value = "admin/category", method = RequestMethod.GET)
	public String showProduct() {
		return "admin/showallproduct";
	}

	@RequestMapping(value = "admin/addcategory", method = RequestMethod.GET)
	public String addproduct() {
		return "admin/addcategory";
	}
}