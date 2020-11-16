package fpt.edu.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

	@RequestMapping(value = "admin/category", method = RequestMethod.GET)
	public String showCategory(@RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(name = "size", required = false, defaultValue = "10") Integer size,
			@RequestParam(name = "keySearch", required = false) String keySearch, ModelMap model) {
		page = page - 1;
		long numpage = 1;
		List<Category> listCategory = null;
		Pageable pageable = PageRequest.of(page, size);
		if (keySearch == null) {
			listCategory = categoryServiceImpl.findAllCategory(pageable).getContent();
			numpage = categoryServiceImpl.countAllCategory();
		} else {
//			listCategory = categoryServiceImpl.findAccountByName(keySearch, pageable).getContent();
//			numpage = categoryServiceImpl.countAccountByName(keySearch);
		}
		model.addAttribute("listcategory", listCategory);
		model.addAttribute("numpage", ((long) numpage / size) + 1);
		return "admin/showallcategory";
	}

	@RequestMapping(value = "admin/addcategory", method = RequestMethod.POST)
	public String addCategory(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("txtCategoryIdAdd");
		String name = request.getParameter("txtCategoryNameAdd");
		if (!categoryServiceImpl.findById(id).isPresent()) {
			Category c = new Category(id, name);
			categoryServiceImpl.save(c);
			return "redirect:/admin/category";
		} else {
			model.addAttribute("err", "Exist category ID!");
			return "admin/addcategory";
		}
	}

	@RequestMapping(value = "admin/delcategory")
	public String deleteCategory(Model model, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("categoryId");
		if (categoryServiceImpl.findById(id).get().getProducts().size() == 0) {
			categoryServiceImpl.deleteById(id);
		}
		return "redirect:/admin/category";
	}

	@RequestMapping(value = "admin/editcategory", method = RequestMethod.GET)
	public String editcategory(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("categoryId");
		Category category = categoryServiceImpl.findById(id).get();
		model.addAttribute("category", category);
		return "/admin/addcategory";
	}

	@RequestMapping(value = "admin/editcategory", method = RequestMethod.POST)
	public String editcategory(ModelMap model, HttpServletRequest request) {
		String id = request.getParameter("txtCategoryIdAdd");
		String name = request.getParameter("txtCategoryNameAdd");
		Category category = new Category(id, name);
		categoryServiceImpl.save(category);
		return "redirect:/admin/category";
	}
}