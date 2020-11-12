package fpt.edu.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fpt.edu.project.model.Account;
import fpt.edu.project.model.Cart;
import fpt.edu.project.service.CartServiceImpl;

@Controller
public class HistoryBillingController {
	@Autowired
	public CartServiceImpl cartServiceImpl;

	@RequestMapping(value = "/historybilling", method = RequestMethod.GET)
	public String viewHistory(ModelMap model, HttpSession session,
			@RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
			@RequestParam(name = "size", required = false, defaultValue = "10") Integer size) {
		Account acc = (Account) session.getAttribute("account");
		List<Cart> listCart = cartServiceImpl.getById(acc.getUserId());
		model.addAttribute("listLength", listCart.size());
		if (listCart.size() == 0) {
			model.addAttribute("userName", acc.getFullname());
		}
		Pageable pageable = PageRequest.of(page, size);
		System.out.println();
		int num = (int) Math.ceil(cartServiceImpl.count() / 10);
		model.addAttribute("numpage", num);
		model.addAttribute("listCart", cartServiceImpl.getAllCart(pageable).getContent());
		return "user/historybilling";
	}
}
