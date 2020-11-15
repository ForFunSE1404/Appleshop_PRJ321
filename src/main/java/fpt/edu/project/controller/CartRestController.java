package fpt.edu.project.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import fpt.edu.project.model.Product;
import fpt.edu.project.model.QuantityCart;
import fpt.edu.project.service.ProductServiceImpl;

@RestController
public class CartRestController {
	@Autowired
	private ProductServiceImpl productService;

	@RequestMapping(value = "addtocart", method = RequestMethod.GET)
	public String buy(HttpServletRequest request, HttpSession session) {
		String productId = request.getParameter("id");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		Product product = productService.findById(productId).get();
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		int totalquantity = 0;
		if (product != null) {
			if (session.getAttribute("cart") == null) {
				HashMap<Product, Integer> cart = new HashMap<>();
				cart.put(product, 1);
				totalquantity += 1;
				session.setAttribute("totalquantity", totalquantity);
				session.setAttribute("cart", cart);
			} else {
				HashMap<Product, Integer> cart = (HashMap<Product, Integer>) session.getAttribute("cart");
				if (!cart.containsKey(product)) {
					cart.put(product, 1);
				} else {
					if (cart.get(product) < product.getQuantity() && cart.get(product) > 0) {
						cart.replace(product, cart.get(product) + quantity);
					}
				}
				for (Product product2 : cart.keySet()) {
					totalquantity += cart.get(product2);
				}
				session.setAttribute("totalquantity", totalquantity);
				session.setAttribute("cart", cart);
			}
		}
		try {
			ajaxResponse = mapper.writeValueAsString(new QuantityCart(totalquantity));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping(value = "updatecart", method = RequestMethod.GET)
	public String update(HttpServletRequest request, HttpSession session) {
		String productId = request.getParameter("id");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		Product product = productService.findById(productId).get();
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		int totalquantity = 0;
		if (product != null) {
			HashMap<Product, Integer> cart = (HashMap<Product, Integer>) session.getAttribute("cart");
			if (product.getQuantity() >= quantity && quantity > 0) {
				cart.replace(product, quantity);
				session.setAttribute("cart", cart);
			} else {
				return ajaxResponse;
			}
			for (Product product2 : cart.keySet()) {
				totalquantity += cart.get(product2);
			}
		}
		session.setAttribute("totalquantity", totalquantity);
		try {
			ajaxResponse = mapper.writeValueAsString(new QuantityCart(totalquantity));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		System.out.print(ajaxResponse);
		return ajaxResponse;
	}

}
