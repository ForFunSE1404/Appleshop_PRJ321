package fpt.edu.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.WishList;

@Repository
public interface WishListRepository extends JpaRepository<WishList, Integer> {
	@Query(value = "Select * from WishList where userId = :userId", nativeQuery = true)
	List<WishList> findByUserId(@Param("userId") String userId);
	
	@Query(value = "SELECT w FROM WishList w WHERE w.account.userId = :userId AND w.product.productId = :productId")
	WishList findByProductAndUserId(@Param("userId") String userId,@Param("productId") String productId);
	
	@Modifying
	@Query(value = "DELETE FROM WishList where productId = :productId", nativeQuery = true)
	void deleteWishList(@Param("productId") String productId);
}