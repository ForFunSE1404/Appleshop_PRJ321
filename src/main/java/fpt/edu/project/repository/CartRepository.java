package fpt.edu.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart, Integer> {

}
