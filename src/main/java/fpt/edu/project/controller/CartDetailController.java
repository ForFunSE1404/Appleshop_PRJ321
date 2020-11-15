package fpt.edu.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fpt.edu.project.model.Cart;
import fpt.edu.project.model.CartDetail;
import fpt.edu.project.service.CartDetailServiceImpl;
import fpt.edu.project.service.CartServiceImpl;

@Controller
public class CartDetailController {
	@Autowired
	private CartDetailServiceImpl cartDetailService;
	@Autowired
	private CartServiceImpl cartService;

	@RequestMapping(value = "/cartdetails", method = RequestMethod.GET)
	public String viewCartDetail(ModelMap model, @RequestParam("cartID") int cartID) {
		List<CartDetail> listCartDetail = cartDetailService.getByCartId(cartID);
		Cart cart = cartService.findById(cartID);
		double total = 0;
		for (int i = 0; i < listCartDetail.size(); i++) {
			total += listCartDetail.get(i).getPrice();
		}
		model.addAttribute("fullname", cart.getAccount().getFullname());
		model.addAttribute("city", cart.getInfoUser().getCity());
		model.addAttribute("address", cart.getInfoUser().getAddress());
		model.addAttribute("phone", cart.getInfoUser().getPhone());
		model.addAttribute("listCartDetail", listCartDetail);
		model.addAttribute("total", total);
		return "user/cartdetail";
	}
}
