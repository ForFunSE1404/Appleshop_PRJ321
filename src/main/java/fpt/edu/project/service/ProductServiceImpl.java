package fpt.edu.project.service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fpt.edu.project.model.Product;
import fpt.edu.project.repository.ProductRepository;

@Service
@Transactional
public class ProductServiceImpl {

	@Autowired
	private ProductRepository productRepository;

	public Product save(Product entity) {
		return productRepository.save(entity);
	}

	public List<Product> findAll() {
		return productRepository.findAll();
	}

	public Optional<Product> findById(String id) {
		return productRepository.findById(id);
	}

	public void deleteById(String id) {
		productRepository.deleteById(id);
	}

	public void insertProduct(String id, String cateId, String name, String date, int quantity, double price,
			String thumbnail, String description, boolean visibility) {
		productRepository.insertProduct(id, cateId, name, date, quantity, price, thumbnail, description, visibility);
	}
	
	public void insertImage(String productId, String imgUrl) {
		productRepository.insertImage(productId, imgUrl);
	}
	public void updateProduct(String name, int quantity, double price, String description, boolean visibility) {
		productRepository.updateProduct(name, quantity, price, description, visibility);
	}
	
	public void deleteProduct(String id) {
		productRepository.deleteProduct(id);
	}
	public Page<Product> searchproduct(Pageable page, String name) {
		System.out.print(name);
		return productRepository.findByName(page, name);
	}

	public Page<Product> findProducts(Pageable pageable) {
		return productRepository.findProducts(pageable);
	}

	public long count() {
		return productRepository.count();
	}
}
