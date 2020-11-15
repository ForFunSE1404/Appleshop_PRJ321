package fpt.edu.project.controller;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fpt.edu.project.model.Cart;
import fpt.edu.project.model.CartDetail;
import fpt.edu.project.model.Product;
import fpt.edu.project.service.AccountServiceImpl;
import fpt.edu.project.service.CartDetailServiceImpl;
import fpt.edu.project.service.CartServiceImpl;
import fpt.edu.project.service.ProductServiceImpl;

@Controller
public class CartAdminController {
	@Autowired
	public CartServiceImpl cartServiceImpl;
	@Autowired
	public CartDetailServiceImpl cartDetailServiceImpl;
	@Autowired
	public AccountServiceImpl accountServiceImpl;
	@Autowired
	ProductServiceImpl productServiceImpl;

	@RequestMapping(value = "admin/bills", method = RequestMethod.GET)
	public String viewAllCart(ModelMap model,
			@RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(name = "size", required = false, defaultValue = "10") Integer size,
			@RequestParam(name = "keySearch", required = false) String keySearch) {
		page = page - 1;
		long numpage = 1;
		List<Cart> listCart = null;
		Pageable pageable = PageRequest.of(page, size);
		if (keySearch == null) {
			listCart = cartServiceImpl.getAllCart(pageable).getContent();
			numpage = cartServiceImpl.count();
		} else {
			listCart = cartServiceImpl.getByUserId(keySearch, pageable).getContent();
			numpage = cartServiceImpl.countCart(keySearch);
		}
		model.addAttribute("numpage", ((long) numpage / size) + 1);
		model.addAttribute("listCart", listCart);
		return "admin/showallcart";
	}

	@RequestMapping(value = "admin/confirm")
	public String confirmCart(@RequestParam("cartId") int cartId) {
		cartServiceImpl.confirmCart(cartId);
		Cart cart = cartServiceImpl.findById(cartId);
		Set<CartDetail> setCartDetails = cart.getCartDetails();
		for (CartDetail cDetail : setCartDetails) {
			Product product = cDetail.getProduct();
			product.setQuantity(product.getQuantity() - cDetail.getQuantity());
			productServiceImpl.save(product);
		}
		return "redirect:bills";
	}

	@RequestMapping(value = "admin/viewcartdetail", method = RequestMethod.GET)
	public String viewCartDetail(ModelMap model, @RequestParam("cartId") int cartId) {
		List<CartDetail> listCartDetail = cartDetailServiceImpl.getByCartId(cartId);
		Cart cart = cartServiceImpl.findById(cartId);
		model.addAttribute("fullname", cart.getAccount().getFullname());
		model.addAttribute("city", cart.getInfoUser().getCity());
		model.addAttribute("address", cart.getInfoUser().getAddress());
		model.addAttribute("phone", cart.getInfoUser().getPhone());
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
		int num = (int) Math.ceil(cartServiceImpl.countCart(userId) / 10);
		model.addAttribute("numpage", num);
		model.addAttribute("listSearchCart", cartServiceImpl.getByUserId(userId, pageable).getContent());
		return "admin/showallcart";
	}
}
