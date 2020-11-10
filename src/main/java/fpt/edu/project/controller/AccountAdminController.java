package fpt.edu.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fpt.edu.project.model.Account;
import fpt.edu.project.model.Role;
import fpt.edu.project.service.AccountServiceImpl;
import fpt.edu.project.service.RoleServiceImpl;

@Controller
public class AccountAdminController {
	@Autowired
	public AccountServiceImpl accountService;
	@Autowired
	public RoleServiceImpl roleService;

	@RequestMapping(value = "admin/account", method = RequestMethod.GET)
	public String showProduct(Model model) {
		model.addAttribute("listaccount", accountService.findAll());
		return "admin/showallaccount";
	}

	@RequestMapping(value = "admin/editaccount", method = RequestMethod.GET)
	public String addAccount(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("accountid");
		Account account = accountService.findById(id).get();
		model.addAttribute("account", account);
		model.addAttribute("listRole", roleService.findAll());
		return "admin/editaccount";
	}

	@RequestMapping(value = "admin/editaccount", method = RequestMethod.POST)
	public String editAccount(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		System.out.print("=======" + username);

		int roleID = Integer.parseInt(request.getParameter("RoleId"));
		Role role = roleService.findById(roleID).get();
		Account account = accountService.findById(username).get();
		account.setRole(role);
		accountService.save(account);
		model.addAttribute("listaccount", accountService.findAll());
		return "admin/showallaccount";
	}

	@RequestMapping(value = "admin/deleteaccount", method = RequestMethod.GET)
	public String deleteaccount(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("accountid");
		accountService.deleteById(id);
		model.addAttribute("listaccount", accountService.findAll());
		return "admin/showallaccount";
	}
}
