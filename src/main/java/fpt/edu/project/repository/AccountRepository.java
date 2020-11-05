package fpt.edu.project.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Account;

@Repository
public interface AccountRepository extends JpaRepository<Account, String> {
	@Query("SELECT A FROM Account A")
	Page<Account> findAccount(Pageable pageable);

	@Query("SELECT count(P) FROM Account P")
	long count();

	@Query(value ="SELECT A.email FROM Account A WHERE email = ?1", nativeQuery = true)
	List<String> findByEmail(String email);
}