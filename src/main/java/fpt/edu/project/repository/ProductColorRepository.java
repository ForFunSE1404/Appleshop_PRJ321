package fpt.edu.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.ProductColor;

@Repository
public interface ProductColorRepository extends JpaRepository<ProductColor, String> {

}
