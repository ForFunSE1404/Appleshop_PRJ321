package fpt.edu.project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpt.edu.project.model.Category;
import fpt.edu.project.repository.CategoryRepository;

@Service
public class CategoryServiceImpl {
	
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	public List<Category> findAll() {
		return categoryRepository.findAll();
	}
	
	public Category save(Category entity) {
		return  categoryRepository.save(entity);
	}

	public Optional<Category> findById(String id) {
		return categoryRepository.findById(id);
	}

	public void deleteById(String id) {
		categoryRepository.deleteById(id);
	}

	//còn update chưa làm
	
	
	
	
	
}
