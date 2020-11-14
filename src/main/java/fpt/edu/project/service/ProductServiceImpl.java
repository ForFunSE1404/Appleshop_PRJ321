package fpt.edu.project.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fpt.edu.project.bean.CategoryProductCount;
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

	public void updateProduct(String id, String cateId, String name, String date, int quantity, double price,
			String thumbnail, String description, boolean visibility) {
		productRepository.updateProduct(id, cateId, name, date, quantity, price, thumbnail, description, visibility);
	}

	public Page<Product> searchproduct(Pageable page, String name) {
		System.out.print(name);
		return productRepository.findByName(page, name);
	}

	public Page<Product> findProducts(Pageable pageable) {
		return productRepository.findProducts(pageable);
	}


	public Page<Product> findProductByName(String productName, Pageable pageable) {
		return productRepository.findProductByName(productName, pageable);
	}

	public Page<Product> findProductByCategory(String catId, Pageable pageable) {
		return productRepository.findProductByCategory(catId, pageable);
	}

	public long countProductsByCategory(String catId) {
		return productRepository.countProductsByCategory(catId);
	}

	public long countProductsByName(String productName) {
		return productRepository.countProductsByName(productName);
	}

	public long countAllProducts() {
		return productRepository.countAllProducts();
	}

	public List<CategoryProductCount> findCategoryCount() {
		return productRepository.findCategoryCount();
	}
}
