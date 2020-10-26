package fpt.edu.project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import fpt.edu.project.model.ProductColor;
import fpt.edu.project.repository.ProductColorRepository;

public class ProductColorServiceImpl {
	@Autowired
	private ProductColorRepository productColorRepository;

	public List<ProductColor> findAll() {
		return productColorRepository.findAll();
	}

	public Optional<ProductColor> findById(String id) {
		return productColorRepository.findById(id);
	}
	
	
	
	
}
