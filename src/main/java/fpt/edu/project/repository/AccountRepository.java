package fpt.edu.project.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Account;

@Repository
public interface AccountRepository extends JpaRepository<Account, String> {
	@Query("SELECT A FROM Account A")
	Page<Account> findAccount(Pageable pageable);

	@Query("SELECT count(A) FROM Account A")
	long countAllAccount();

	@Query("SELECT A FROM Account A WHERE A.fullname LIKE %:fullname%")
	Page<Account> findAccountByName(@Param("fullname") String fullname, Pageable pageable);

	@Query("SELECT count(a) FROM Account a WHERE a.fullname LIKE %:fullname%")
	long countAccountByName(@Param("fullname") String fullname);

	@Query(value = "SELECT A.email FROM Account A WHERE email = ?1", nativeQuery = true)
	List<String> findByEmail(String email);

	@Modifying
	@Query(value = "UPDATE Account a SET a.roleId = :roleId WHERE a.userId = :userId", nativeQuery = true)
	void updateAccount(@Param("roleId") int roleId, @Param("userId") String userId);

	@Query("SELECT a FROM Account a WHERE a.email = ?1")
	Account findAccountEmail(String email);
}
