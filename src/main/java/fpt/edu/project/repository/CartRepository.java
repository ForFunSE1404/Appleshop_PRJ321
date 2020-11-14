package fpt.edu.project.repository;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart, Integer> {
	@Query(value = "SELECT * FROM Cart WHERE userId LIKE %:userId%", nativeQuery = true)
	Page<Cart> getByUserId(@Param("userId") String userId, Pageable pageable);

	@Query(value = "SELECT * FROM Cart WHERE userId :userId", nativeQuery = true)
	Cart getCartByUserId(@Param("userId") String userId);

	@Query("SELECT C FROM Cart C")
	Page<Cart> getAllCart(Pageable pageable);

	@Transactional
	@Modifying
	@Query("UPDATE Cart c SET c.status = 0 where c.cartId = :cartId")
	void unconfirmCart(@Param("cartId") int cartId);

	@Transactional
	@Modifying
	@Query("UPDATE Cart c SET c.status = 1 where c.cartId = :cartId")
	void confirmCart(@Param("cartId") int cartId);
}
