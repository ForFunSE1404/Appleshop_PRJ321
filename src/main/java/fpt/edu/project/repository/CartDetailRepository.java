package fpt.edu.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.CartDetail;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Integer> {

}
