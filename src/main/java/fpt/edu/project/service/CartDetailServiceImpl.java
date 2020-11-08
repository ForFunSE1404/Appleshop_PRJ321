package fpt.edu.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpt.edu.project.model.CartDetail;
import fpt.edu.project.repository.CartDetailRepository;

@Service
public class CartDetailServiceImpl {

	@Autowired
	private CartDetailRepository cartDetailRepository;

	public CartDetail save(CartDetail cartDetail) {
		return cartDetailRepository.save(cartDetail);
	}
}
