package fpt.edu.project.service;

import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

	public Account findAccountEmail(String email) {
		return accountRepository.findAccountEmail(email);
	}

	public Optional<Account> findById(String id) {
		return accountRepository.findById(id);
	}

	public void deleteById(String id) {
		accountRepository.deleteById(id);
	}

	public boolean findByEmail(String email) {
		return accountRepository.findByEmail(email).isEmpty();
	}

	public void update(int roleID, String userId) {
		accountRepository.updateAccount(roleID, userId);
	}

	public Page<Account> findAccount(Pageable pageable) {
		return accountRepository.findAccount(pageable);
	}

	public long countAllAccount() {
		return accountRepository.countAllAccount();
	}

	public Page<Account> findAccountByName(String fullName, Pageable pageable) {
		return accountRepository.findAccountByName(fullName, pageable);
	}

	public long countAccountByName(String fullName) {
		return accountRepository.countAccountByName(fullName);
	}

}
