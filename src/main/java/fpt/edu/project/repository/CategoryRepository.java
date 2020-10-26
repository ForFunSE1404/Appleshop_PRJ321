package fpt.edu.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Category;
@Repository
public interface CategoryRepository extends JpaRepository<Category, String> {
 
	
}
