package fpt.edu.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpt.edu.project.model.CartDetail;
import fpt.edu.project.model.Product;
import fpt.edu.project.repository.CartDetailRepository;
import fpt.edu.project.repository.ProductRepository;

@Service
public class CartDetailServiceImpl {

	@Autowired
	private CartDetailRepository cartDetailRepository;
	@Autowired
	private ProductRepository productRepository;

	public CartDetail save(CartDetail cartDetail) {
		return cartDetailRepository.save(cartDetail);
	}

	public List<CartDetail> getByCartId(int cartId) {
		return cartDetailRepository.getByCartId(cartId);
	}

	public List<Product> getLastestProduct() {
		List<String> list = cartDetailRepository.getLastestProduct();
		List<Product> listProduct = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			Product product = productRepository.findById(list.get(i)).get();
			listProduct.add(product);
		}
		return listProduct;
	}

}
