package fpt.edu.project.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fpt.edu.project.bean.CategoryProductCount;
import fpt.edu.project.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, String> {
//	List<Product> findAllByNameLike(String name, Pageable pageable);

	@Query("SELECT P FROM Product P")
	Page<Product> findProducts(Pageable pageable);

	@Query("SELECT count(P) FROM Product P")
	long countAllProducts();

	// list all sản phẩm visibility = true ra trang user
	@Query("SELECT P FROM Product P WHERE P.visibility = true")
	Page<Product> findProductsVisibile(Pageable pageable);

	@Query("SELECT count(P) FROM Product P WHERE P.visibility = true")
	long countAllProductsVisibile();

	@Query("SELECT p FROM Product p WHERE p.productName LIKE %:productName%")
	Page<Product> findProductByName(@Param("productName") String productName, Pageable pageable);

	@Query("SELECT count(p) FROM Product p WHERE p.productName LIKE %:productName%")
	long countProductsByName(@Param("productName") String productName);

	// list all sản phẩm có tên search và visibility = true ra trang user
	@Query("SELECT p FROM Product p WHERE p.productName LIKE %:productName% AND p.visibility = true")
	Page<Product> findProductByNameVisible(@Param("productName") String productName, Pageable pageable);

	@Query("SELECT count(p) FROM Product p WHERE p.productName LIKE %:productName% AND p.visibility = true")
	long countProductsByNameVisible(@Param("productName") String productName);

	@Query("SELECT p FROM Product p WHERE p.category.categoryId = :categoryId")
	Page<Product> findProductByCategory(@Param("categoryId") String catId, Pageable pageable);

	@Query("SELECT count(p) FROM Product p WHERE p.category.categoryId = :categoryId")
	long countProductsByCategory(@Param("categoryId") String catId);

	// list all sản phẩm có category và visibility = true ra trang user
	@Query("SELECT p FROM Product p WHERE p.category.categoryId = :categoryId")
	Page<Product> findProductByCategoryVisible(@Param("categoryId") String catId, Pageable pageable);

	@Query("SELECT count(p) FROM Product p WHERE p.category.categoryId = :categoryId AND p.visibility = true")
	long countProductsByCategoryVisible(@Param("categoryId") String catId);

	@Modifying
	@Query(value = "Insert Into Product(productId, categoryId, productName, updateDate, quantity, price, thumbnail, description, visibility) "
			+ "Values (:productId, :categoryId, :productName, :updateDate, :quantity, :price, :thumbnail, :description, :visibility )", nativeQuery = true)
	void insertProduct(@Param("productId") String productId, @Param("categoryId") String categoryId,
			@Param("productName") String productName, @Param("updateDate") String updateDate,
			@Param("quantity") int quantity, @Param("price") double price, @Param("thumbnail") String thumbnail,
			@Param("description") String description, @Param("visibility") boolean visibility);

	@Modifying
	@Query(value = "UPDATE Product p SET p.categoryId = :categoryId, p.productName = :productName, p.date = :date, p.quantity = :quantity, p.price = :price, p.thumbnail = :thumbnail, p.description = :description, "
			+ "p.visibility = :visibility WHERE p.productId = :productId", nativeQuery = true)
	void updateProduct(@Param("productId") String productId, @Param("categoryId") String categoryId,
			@Param("productName") String productName, @Param("date") String date, @Param("quantity") int quantity,
			@Param("price") double price, @Param("thumbnail") String thumbnail,
			@Param("description") String description, @Param("visibility") boolean visibility);

	@Modifying
	@Query(value = "Delete from Product p where p.productId = :productId")
	void deleteProduct(@Param("productId") String productId);

	@Query("SELECT new fpt.edu.project.bean.CategoryProductCount(p.category.categoryName, COUNT(p.category.categoryName)) FROM Product p GROUP BY p.category.categoryName")
	public List<CategoryProductCount> findCategoryCount();

}
