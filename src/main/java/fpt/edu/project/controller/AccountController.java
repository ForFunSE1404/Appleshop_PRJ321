package fpt.edu.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fpt.edu.project.model.Account;
import fpt.edu.project.model.InfoUser;
import fpt.edu.project.service.AccountServiceImpl;
import fpt.edu.project.service.InfoUserServiceImpl;

@Controller
public class AccountController {

	@Autowired
	private InfoUserServiceImpl infoUserService;
	@Autowired
	private AccountServiceImpl accountService;

	@RequestMapping(value = "/updateuser", method = RequestMethod.POST)
	public String updateuser(HttpServletRequest request, HttpSession session) {
		String name = request.getParameter("fullname");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		Account account = (Account) session.getAttribute("account");
		account.setFullname(name);
		account.setEmail(email);
		if (account.getInfoUser() != null) {
			if (account.getInfoUser().getCity().equalsIgnoreCase(city)
					&& account.getInfoUser().getAddress().equalsIgnoreCase(address)
					&& account.getInfoUser().getPhone().equalsIgnoreCase(phone)) {

			} else {
				InfoUser info = new InfoUser();
				info.setAddress(address);
				info.setCity(city);
				info.setPhone(phone);
				info = infoUserService.save(info);
				account.setInfoUser(info);
			}
		} else {
			InfoUser info = new InfoUser();
			info.setAddress(address);
			info.setCity(city);
			info.setPhone(phone);
			info = infoUserService.save(info);
			account.setInfoUser(info);
		}

		account = accountService.save(account);
		session.setAttribute("account", account);

		return "user/inforuser";
	}

	@RequestMapping(value = "/changepassuser", method = RequestMethod.GET)
	public String changePassUser() {
		return "user/changepassword";
	}

	@RequestMapping(value = "/changepassuser", method = RequestMethod.POST)
	public String changePassUser(HttpServletRequest request, HttpSession session, ModelMap model) {
		Account account = (Account) session.getAttribute("account");
		String pass = request.getParameter("your_pass");
		String oldPass = request.getParameter("old_your_pass");

		boolean oldPassCorrect = new BCryptPasswordEncoder().matches(oldPass, account.getPassword());

		if (!oldPassCorrect) {
			model.addAttribute("passcorrect", "Old Password not correct");
			return "user/changepassword";
		} else {
			String hashPassword = new BCryptPasswordEncoder().encode(pass);
			account.setPassword(hashPassword);
			accountService.save(account);
			return "redirect:inforuser";
		}
	}

}
