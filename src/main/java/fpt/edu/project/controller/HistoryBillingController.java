package fpt.edu.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fpt.edu.project.model.Account;
import fpt.edu.project.model.Cart;
import fpt.edu.project.service.CartServiceImpl;

@Controller
public class HistoryBillingController {
	@Autowired
	public CartServiceImpl cartServiceImpl;

	@RequestMapping(value = "/historybilling", method = RequestMethod.GET)
	public String viewHistory(ModelMap model, HttpSession session) {
		Account acc = (Account) session.getAttribute("account");
		List<Cart> listCart = cartServiceImpl.getById(acc.getUserId());
		model.addAttribute("listLength", listCart.size());
		model.addAttribute("listCart", listCart);

		if (listCart.size() == 0) {
			model.addAttribute("userName", acc.getFullname());
		}
		return "user/historybilling";
	}
}
