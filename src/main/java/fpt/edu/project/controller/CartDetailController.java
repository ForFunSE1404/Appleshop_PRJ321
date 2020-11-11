package fpt.edu.project.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fpt.edu.project.model.CartDetail;
import fpt.edu.project.service.CartDetailServiceImpl;

@Controller
public class CartDetailController {
	@Autowired
	private CartDetailServiceImpl cartDetailService;

	@RequestMapping(value = "/cartdetails", method = RequestMethod.GET)
	public String viewCartDetail(ModelMap model, @RequestParam("cartID") int cartID) {
		List<CartDetail> listCartDetail = cartDetailService.getByCartId(cartID);
		double total = 0;
		for (int i = 0; i < listCartDetail.size(); i++) {
			total += listCartDetail.get(i).getPrice();
		}
		model.addAttribute("listCartDetail", listCartDetail);
		model.addAttribute("total", total);
		return "user/cartdetail";
	}
}
