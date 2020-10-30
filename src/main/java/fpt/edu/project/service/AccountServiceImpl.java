package fpt.edu.project.service;

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
	public Optional<Account> findById(String id) {
		return accountRepository.findById(id);
	}
	
	public boolean findByEmail(String email) {
		return accountRepository.findByEmail(email).isEmpty();
	}
}
