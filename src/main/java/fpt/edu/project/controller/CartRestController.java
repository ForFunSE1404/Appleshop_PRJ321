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
import fpt.edu.project.service.ProductServiceImpl;

@RestController
public class CartRestController {
	@Autowired
	private ProductServiceImpl productService;

	@RequestMapping(value = "addtocart", method = RequestMethod.GET)
	public String buy(HttpServletRequest request, HttpSession session) {
		String productId = request.getParameter("id");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		System.out.print(productId);
		Product product = productService.findById(productId).get();
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";

		if (product != null) {
			if (session.getAttribute("cart") == null) {
				HashMap<Product, Integer> cart = new HashMap<>();
				cart.put(product, 1);
				session.setAttribute("cart", cart);
			} else {
				HashMap<Product, Integer> cart = (HashMap<Product, Integer>) session.getAttribute("cart");
				if (!cart.containsKey(product)) {
					cart.put(product, 1);
				} else {
					cart.replace(product, cart.get(product) + quantity);
				}
				session.setAttribute("cart", cart);
			}
		}
		try {
			ajaxResponse = mapper.writeValueAsString(product);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping(value = "updatecart", method = RequestMethod.GET)
	public String update(HttpServletRequest request, HttpSession session) {
		String productId = request.getParameter("id");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		System.out.print(productId);
		Product product = productService.findById(productId).get();
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		if (product != null) {
			HashMap<Product, Integer> cart = (HashMap<Product, Integer>) session.getAttribute("cart");
			cart.replace(product, cart.get(product) + quantity);
			session.setAttribute("cart", cart);

		}
		try {
			ajaxResponse = mapper.writeValueAsString(product);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}

}
