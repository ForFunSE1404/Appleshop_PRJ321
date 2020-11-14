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
import fpt.edu.project.model.CartDetail;
import fpt.edu.project.service.AccountServiceImpl;
import fpt.edu.project.service.CartDetailServiceImpl;
import fpt.edu.project.service.CartServiceImpl;

@Controller
public class CartAdminController {
	@Autowired
	public CartServiceImpl cartServiceImpl;
	@Autowired
	public CartDetailServiceImpl cartDetailServiceImpl;
	@Autowired
	public AccountServiceImpl accountServiceImpl;

	@RequestMapping(value = "admin/bills", method = RequestMethod.GET)
	public String viewAllCart(ModelMap model,
			@RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
			@RequestParam(name = "size", required = false, defaultValue = "10") Integer size) {
		Pageable pageable = PageRequest.of(page, size);
		int num = (int) Math.ceil(cartServiceImpl.count() / 10);
		model.addAttribute("numpage", num);
		model.addAttribute("listCart", cartServiceImpl.getAllCart(pageable).getContent());
		return "admin/showallcart";
	}

	@RequestMapping(value = "admin/unconfirm")
	public String unconfirmCart(@RequestParam("cartId") int cartId) {
		cartServiceImpl.unconfirmCart(cartId);
		return "redirect:bills";
	}

	@RequestMapping(value = "admin/confirm")
	public String confirmCart(@RequestParam("cartId") int cartId) {
		cartServiceImpl.confirmCart(cartId);
		return "redirect:bills";
	}

	@RequestMapping(value = "admin/viewcartdetail", method = RequestMethod.GET)
	public String viewCartDetail(ModelMap model, @RequestParam("cartId") int cartId,
			@RequestParam("userId") String userId) {
		Account account = accountServiceImpl.findById(userId).get();
		List<CartDetail> listCartDetail = cartDetailServiceImpl.getByCartId(cartId);
		model.addAttribute("fullname", account.getFullname());
		model.addAttribute("city", account.getInfoUser().getCity());
		model.addAttribute("address", account.getInfoUser().getAddress());
		model.addAttribute("phone", account.getInfoUser().getPhone());
		double total = 0;
		for (int i = 0; i < listCartDetail.size(); i++) {
			total += listCartDetail.get(i).getPrice();
		}
		model.addAttribute("total", total);
		model.addAttribute("listCartDetail", listCartDetail);
		return "admin/cartdetailadmin";
	}

	@RequestMapping(value = "admin/searchbills", method = RequestMethod.GET)
	public String searchBills(@RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
			@RequestParam(name = "size", required = false, defaultValue = "10") Integer size, ModelMap model,
			@RequestParam(name = "userId") String userId) {
		Pageable pageable = PageRequest.of(page, size);
		int num = (int) Math.ceil(cartServiceImpl.count() / 10);
		model.addAttribute("numpage", num);
		model.addAttribute("listSearchCart", cartServiceImpl.getByUserId(userId, pageable).getContent());
		return "admin/showallcart";
	}
}
