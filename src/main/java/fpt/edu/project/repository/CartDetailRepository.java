package fpt.edu.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import fpt.edu.project.model.CartDetail;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Integer> {
	@Query(value = "SELECT * FROM CartDetail WHERE cartId = :cartId", nativeQuery = true)
	List<CartDetail> getByCartId(@Param("cartId") int cartId);

	@Query(value = "SELECT TOP(5) productId FROM CartDetail GROUP BY productId ORDER BY count(productId) DESC", nativeQuery = true)
	List<String> getLastestProduct();
}
