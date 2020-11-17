package fpt.edu.project.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fpt.edu.project.model.Account;
import fpt.edu.project.model.Product;
import fpt.edu.project.model.WishList;
import fpt.edu.project.service.AccountServiceImpl;
import fpt.edu.project.service.ProductServiceImpl;
import fpt.edu.project.service.WishListServiceImpl;

@Controller
public class WishListController {

	@Autowired
	private WishListServiceImpl wishListServiceImpl;
	@Autowired
	private AccountServiceImpl accountService;
	@Autowired
	private ProductServiceImpl ProductServiceImpl;

	@RequestMapping(value = "/wishlist")
	public String wishlist(ModelMap model, HttpSession session, Authentication authentication, Principal principal) {
		if (authentication != null && principal != null) {
			Account account = accountService.findById(principal.getName()).get();
			session.setAttribute("account", account);
			session.setAttribute("isAdmin", authentication.getAuthorities().toString().contains("ROLE_ADMIN"));
		}
		Account account = (Account) session.getAttribute("account");
		List<WishList> list = wishListServiceImpl.findByUserIdID(account.getUserId());
		model.addAttribute("listWishList", list);
		return "user/wishlist";
	}

	@RequestMapping(value = "/addtowishlist")
	public String addToWishList(ModelMap model, HttpServletRequest request, HttpSession session,
			@RequestParam("productId") String productId) {
		Account account = (Account) session.getAttribute("account");
		Product product = ProductServiceImpl.findById(productId).get();
		WishList wishList = new WishList();
		wishList.setAccount(account);
		wishList.setProduct(product);
		if (wishListServiceImpl.findByProductAndUserId(account.getUserId(), productId) == null) {
			wishListServiceImpl.save(wishList);
		}
		return "redirect:wishlist";
	}

	@RequestMapping(value = "/deletewishlist")
	public String deleteWishList(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		int wishlistId = Integer.parseInt(request.getParameter("wishlistId"));
		wishListServiceImpl.deleteById(wishlistId);
		model.addAttribute("listdeletewishlist", wishListServiceImpl.findAll());
		return "redirect:wishlist";
	}
}
