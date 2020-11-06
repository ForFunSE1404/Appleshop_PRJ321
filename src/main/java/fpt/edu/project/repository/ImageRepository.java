package fpt.edu.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Image;
import fpt.edu.project.model.Product;

@Repository
public interface ImageRepository extends JpaRepository<Image, String>{
	
}
