package fpt.edu.project.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, String> {
	@Query("SELECT c FROM Category c")
	Page<Category> findAllCategory(Pageable pageable);

	@Query("SELECT count(c) FROM Category c")
	long countAllCategory();
}
