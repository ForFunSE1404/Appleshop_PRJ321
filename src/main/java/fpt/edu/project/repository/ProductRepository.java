package fpt.edu.project.repository;

import java.util.Collection;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, String> {
//	List<Product> findAllByNameLike(String name, Pageable pageable);
	
	@Query("SELECT P FROM Product P")
	Page<Product> findProducts(Pageable pageable);

	@Query("SELECT count(P) FROM Product P")
	long count();
	
	@Query(value ="SELECT P FROM Product P WHERE P.productName LIKE ?1", nativeQuery = true)
	List<Product> findByName(String productName);

}
