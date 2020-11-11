package fpt.edu.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart, Integer> {
	@Query(value = "SELECT * FROM Cart WHERE userId = :userId", nativeQuery = true)
	List<Cart> getCartById(@Param("userId") String userId);
}
