package fpt.edu.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fpt.edu.project.service.AccountServiceImpl;

@Controller
public class AccountAdminController {
	@Autowired
	public AccountServiceImpl accountService;

	@RequestMapping(value = "admin/account", method = RequestMethod.GET)
	public String showProduct(Model model) {
		model.addAttribute("listaccount", accountService.findAll());
		return "admin/showallaccount";
	}

	@RequestMapping(value = "admin/addaccount", method = RequestMethod.GET)
	public String addproduct() {
		return "admin/addaccount";
	}
}
