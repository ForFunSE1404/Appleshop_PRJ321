package fpt.edu.project.repository;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Account;
import fpt.edu.project.model.Product;


@Repository
public interface AccountRepository  extends JpaRepository<Account, String>{
}
