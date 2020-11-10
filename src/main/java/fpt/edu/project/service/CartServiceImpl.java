package fpt.edu.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpt.edu.project.model.Cart;
import fpt.edu.project.repository.CartRepository;

@Service
public class CartServiceImpl {
	@Autowired
	private CartRepository cartRepository;

	public Cart save(Cart cart) {
		return cartRepository.save(cart);
	}
}
