package fpt.edu.project.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, String> {
	@Query("SELECT P FROM Product P")
	Page<Product> findProducts(Pageable pageable);

	@Query("SELECT count(P) FROM Product P")
	long count();

}
