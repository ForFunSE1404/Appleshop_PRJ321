package fpt.edu.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fpt.edu.project.model.Category;
import fpt.edu.project.service.CategoryServiceImpl;

@Controller
public class CategoryAdminController {
	@Autowired
	public CategoryServiceImpl categoryServiceImpl;

	@RequestMapping(value = "admin/addcategory", method = RequestMethod.GET)
	public String addproduct() {
		return "admin/addcategory";
	}
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String showCategory(Model model) {
		model.addAttribute("listcategory", categoryServiceImpl.findAll());
		return "admin/showallcategory";
	}

	@RequestMapping(value = "admin/addcategory", method = RequestMethod.POST)
	public String addCategory(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("txtCategoryIdAdd");
		String name = request.getParameter("txtCategoryNameAdd");
		Category c = new Category(id, name);
		categoryServiceImpl.save(c);
		model.addAttribute("listcategory", categoryServiceImpl.findAll());
		return "admin/showallcategory";
	}

	@RequestMapping(value = "admin/delcategory")
	public String deleteCategory(Model model, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("categoryId");
		categoryServiceImpl.deleteById(id);
		model.addAttribute("listcategory", categoryServiceImpl.findAll());
		return "admin/showallcategory";
	}

	@RequestMapping(value = "admin/editcategory", method = RequestMethod.GET)
	public String editcategory(Model model, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("categoryId");
		model.addAttribute("id", id);
		return "admin/addcategory";
	}
}