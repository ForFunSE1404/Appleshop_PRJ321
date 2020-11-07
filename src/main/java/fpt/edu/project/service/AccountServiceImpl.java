package fpt.edu.project.service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpt.edu.project.model.Account;
import fpt.edu.project.repository.AccountRepository;

@Service
public class AccountServiceImpl {
	@Autowired
	private EntityManager entityManager;
	@Autowired
	private AccountRepository accountRepository;

	public Account save(Account entity) {
		return accountRepository.save(entity);
	}

	public List<Account> findAll() {
		return accountRepository.findAll();
	}

	public Optional<Account> findById(String id) {
		return accountRepository.findById(id);
	}

	public void deleteById(String id) {
		accountRepository.deleteById(id);
	}

	public List<Account> findAccountByName(String name) {
		String sql = "From Account A where A.userID like :name";
		Query query = entityManager.createQuery(sql, Account.class);
		query.setParameter("name", '%' + name + '%');
		return query.getResultList();
	}

	public boolean findByEmail(String email) {
		return accountRepository.findByEmail(email).isEmpty();
	}

	public void update(int roleID, String userId) {
		accountRepository.updateAccount(roleID, userId);
	}
}
