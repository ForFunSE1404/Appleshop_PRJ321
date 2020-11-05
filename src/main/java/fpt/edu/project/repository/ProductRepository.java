package fpt.edu.project.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, String> {
	@Query("SELECT P FROM Product P")
	Page<Product> findProducts(Pageable pageable);

	@Query("SELECT count(P) FROM Product P")
	long count();

	@Modifying
	@Query(value = "Insert Into Product(productId, categoryId, productName, updateDate, quantity, price, thumbnail, description, visibility) "
			+ "Values (:productId, :categoryId, :productName, :updateDate, :quantity, :price, :thumbnail, :description, :visibility )", nativeQuery = true)
	void insertProduct(@Param("productId") String productId, @Param("categoryId") String categoryId,
			@Param("productName") String productName, @Param("updateDate") String updateDate,
			@Param("quantity") int quantity, @Param("price") double price, @Param("thumbnail") String thumbnail,
			@Param("description") String description, @Param("visibility") boolean visibility);
	
	@Modifying
	@Query(value = "Insert Into Image(productId, imgUrl) Values (:productId, :imgUrl)", nativeQuery = true)
	void insertImage(@Param("productId") String productId, @Param("imgUrl") String imgUrl);
	
	@Modifying
	@Query(value = "Update Product p set p.productName = :productName, p.quantity = :quantity, p.price = :price, p.description = :description, "
			+ "p.visibility = :visibility where p.productId = :productId", nativeQuery = true)
	void updateProduct(@Param("productName") String productName, @Param("quantity") int quantity,
			@Param("price") double price, @Param("description") String description,
			@Param("visibility") boolean visibility);

	@Modifying
	@Query(value = "Delete from Product p where p.productId = :productId")
	void deleteProduct(@Param("productId") String productId);
}
