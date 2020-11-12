package fpt.edu.project.service;

import org.springframework.data.domain.Pageable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import fpt.edu.project.model.Cart;
import fpt.edu.project.repository.CartRepository;

@Service
public class CartServiceImpl {
	@Autowired
	private CartRepository cartRepository;

	public long count() {
		return cartRepository.count();
	}
	public Cart save(Cart cart) {
		return cartRepository.save(cart);
	}
	public List<Cart> getById(String userId) {
		return cartRepository.getCartById(userId);
	}
	public Page<Cart> getAllCart(Pageable pageable ){
		return cartRepository.getAllCart(pageable);
	}
}
