package fpt.edu.project.service;

import java.util.Optional;

import javax.persistence.EntityManager;

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
	
}
