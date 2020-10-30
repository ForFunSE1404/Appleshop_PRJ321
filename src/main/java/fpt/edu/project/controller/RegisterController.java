package fpt.edu.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fpt.edu.project.model.Account;
import fpt.edu.project.model.Role;
import fpt.edu.project.service.AccountServiceImpl;

@Controller
public class RegisterController {
	@Autowired
	private AccountServiceImpl accountService;

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String resgister(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		String newPass = new BCryptPasswordEncoder().encode(password);
		if (!accountService.findById(userId).isPresent()) {
			Account acc = new Account(userId, new Role(3, "ROLE_USER"), newPass, email, fullname, true);
			accountService.save(acc);
			return "user/login";
		} else {
			model.addAttribute("err", "Username " + userId + " is exist !");
			return "user/register";
		}
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String resgister() {
		return "user/register";
	}
}
