package fpt.edu.project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fpt.edu.project.model.Product;
import fpt.edu.project.repository.ProductRepository;

@Service
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
