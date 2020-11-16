package fpt.edu.project.service;

import org.springframework.data.domain.Pageable;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import fpt.edu.project.model.Cart;
import fpt.edu.project.repository.CartRepository;

@Service
public class CartServiceImpl {
	@Autowired
	private CartRepository cartRepository;

	public long countCart(String userId) {
		return cartRepository.countCart(userId);
	}

	public Cart findById(int cartId) {
		return cartRepository.findById(cartId).get();
	}

	public void refuse(int cartId) {
		cartRepository.deleteById(cartId);
	}

	public long count() {
		return cartRepository.count();
	}

	public Cart save(Cart cart) {
		return cartRepository.save(cart);
	}

	public Page<Cart> getByUserId(String userId, Pageable pageable) {
		return cartRepository.getByUserId(userId, pageable);
	}

	public Page<Cart> getAllCart(Pageable pageable) {
		return cartRepository.getAllCart(pageable);
	}

	public void unconfirmCart(int cartId) {
		cartRepository.unconfirmCart(cartId);
		;
	}

	public void confirmCart(int cartId) {
		cartRepository.confirmCart(cartId);
		;
	}
}
