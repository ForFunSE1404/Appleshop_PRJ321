package fpt.edu.project.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fpt.edu.project.model.Account;
import fpt.edu.project.model.Cart;
import fpt.edu.project.model.CartDetail;
import fpt.edu.project.model.InfoUser;
import fpt.edu.project.model.Product;
import fpt.edu.project.service.AccountServiceImpl;
import fpt.edu.project.service.CartDetailServiceImpl;
import fpt.edu.project.service.CartServiceImpl;
import fpt.edu.project.service.InfoUserServiceImpl;
import fpt.edu.project.service.ProductServiceImpl;

@Controller
public class CartController {
	@Autowired
	private ProductServiceImpl productService;
	@Autowired
	private AccountServiceImpl accountService;
	@Autowired
	private InfoUserServiceImpl infoUserService;
	@Autowired
	private CartServiceImpl cartService;
	@Autowired
	private CartDetailServiceImpl cartDetailService;

	@RequestMapping(value = "/cart")
	public String cart() {
		return "user/cart";
	}

	@RequestMapping(value = "/checkout")
	public String inputaddress() {
		return "user/information";
	}

	@RequestMapping(value = "deletecart", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, HttpSession session) {
		String productId = request.getParameter("productId");
		int totalquantity = 0;
		if (productId != null) {
			HashMap<Product, Integer> cart = (HashMap<Product, Integer>) session.getAttribute("cart");
			for (Product product : cart.keySet()) {
				if (product.getProductId().equalsIgnoreCase(productId)) {
					cart.remove(product);
					break;
				}
			}
			for (Product product2 : cart.keySet()) {
				totalquantity += cart.get(product2);
			}
			session.setAttribute("totalquantity", totalquantity);
			session.setAttribute("cart", cart);
		}
		return "user/cart";
	}

	@RequestMapping(value = "updateinfo", method = RequestMethod.POST)
	public String checkout(HttpServletRequest request, HttpSession session) {
		String fullname = request.getParameter("fullname");
		String city = request.getParameter("city");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		Account account = (Account) session.getAttribute("account");
		InfoUser infoUser = new InfoUser();
		Set<Account> accounts = new HashSet<Account>();
		accounts.add(account);
		infoUser.setCity(city);
		infoUser.setAccounts(accounts);
		infoUser.setPhone(phone);
		infoUser.setAddress(address);
		if (account.getInfoUser() == null) {
			infoUser = infoUserService.save(infoUser);
			account.setInfoUser(infoUser);
			account = accountService.save(account);
			session.setAttribute("account", account);
		} else {
			infoUser.setInfoId(account.getInfoUser().getInfoId());
			infoUser = infoUserService.save(infoUser);
			account.setInfoUser(infoUser);
			session.setAttribute("account", account);
		}
		HashMap<Product, Integer> cart = (HashMap<Product, Integer>) session.getAttribute("cart");
		session.setAttribute("cart", cart);
		return "redirect:finalcheckout";
	}

	@RequestMapping(value = "finalcheckout")
	private String finalcheckout(HttpSession session) {
		HashMap<Product, Integer> cartCheckout = (HashMap<Product, Integer>) session.getAttribute("cart");
		Account account = (Account) session.getAttribute("account");
		Cart cart = new Cart();
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		cart.setAccount(account);
		cart.setCreateDate(date);
		cart.setStatus(false);
		cart.setNote("");
		Set<CartDetail> cartDetails = new HashSet<>();
		cart.setCartDetails(cartDetails);
		cart = cartService.save(cart);
		double totalPrice = 0;
		for (Product product : cartCheckout.keySet()) {
			CartDetail cartDetail = new CartDetail();
			cartDetail.setCart(cart);
			cartDetail.setProduct(product);
			cartDetail.setPrice(cartCheckout.get(product) * product.getPrice());
			totalPrice += cartCheckout.get(product) * product.getPrice();
			cartDetail.setQuantity(cartCheckout.get(product));
			cartDetail.setCart(cart);
			cartDetail = cartDetailService.save(cartDetail);
			cartDetails.add(cartDetail);
		}
		cart.setCartDetails(cartDetails);
		cart.setTotalprice(totalPrice);
		cartService.save(cart);
		session.setAttribute("cart", new HashMap<Product, Integer>());
		return "redirect:cart";
	}
}
