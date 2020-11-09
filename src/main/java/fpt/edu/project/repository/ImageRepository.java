package fpt.edu.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Image;

@Repository
public interface ImageRepository extends JpaRepository<Image, String> {

	@Modifying
	@Query(value = "INSERT INTO [Image](imgUrl,productId) VALUES (:imgUrl, :productId)", nativeQuery = true)
	void saveImg(@Param("imgUrl") String imgUrl, @Param("productId") String productId);

	@Modifying
	@Query(value = "DELETE FROM Image where productId = :productId", nativeQuery = true)
	void deleteImg(@Param("productId") String productId);
}
