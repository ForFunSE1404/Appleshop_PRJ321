package fpt.edu.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String showAccount(@RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(name = "size", required = false, defaultValue = "10") Integer size,
			@RequestParam(name = "keySearch", required = false) String keySearch, ModelMap model) {
		page = page - 1;
		long numpage = 1;
		List<Account> listAccount = null;
		Pageable pageable = PageRequest.of(page, size);
		if (keySearch == null) {
			listAccount = accountService.findAccount(pageable).getContent();
			numpage = accountService.countAllAccount();
		} else {
			listAccount = accountService.findAccountByName(keySearch, pageable).getContent();
			numpage = accountService.countAccountByName(keySearch);
		}
		model.addAttribute("listaccount", listAccount);
		model.addAttribute("numpage", ((long) numpage / size) + 1);
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
		int roleID = Integer.parseInt(request.getParameter("RoleId"));
		Role role = roleService.findById(roleID).get();
		Account account = accountService.findById(username).get();
		account.setRole(role);
		accountService.save(account);
		return "redirect:/admin/account";
	}

	@RequestMapping(value = "admin/deleteaccount", method = RequestMethod.GET)
	public String deleteaccount(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("accountid");
		accountService.deleteById(id);
		return "redirect:admin/account";
	}
}
