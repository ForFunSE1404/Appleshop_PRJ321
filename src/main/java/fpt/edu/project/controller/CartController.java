package fpt.edu.project.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fpt.edu.project.model.Product;
import fpt.edu.project.service.ProductServiceImpl;

@Controller
public class CartController {
	@Autowired
	private ProductServiceImpl productService;

	@RequestMapping(value = "deletecart", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, HttpSession session) {
		String productId = request.getParameter("productId");
		if (productId != null) {
			HashMap<Product, Integer> cart = (HashMap<Product, Integer>) session.getAttribute("cart");
			for (Product product : cart.keySet()) {
				if (product.getProductId().equalsIgnoreCase(productId)) {
					cart.remove(product);
					break;
				}
			}
			session.setAttribute("cart", cart);
		}
		return "user/cart";
	}
}
