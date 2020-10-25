package fpt.edu.project.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Account;

@Repository
public class AccountDao {
	@Autowired
	private EntityManager entityManager;
	@Autowired
	private PasswordEncoder passwordEncoder;

	public Account findUserAccount(String userId) {
		try {
			String sql = "Select A from " + Account.class.getName() + " A " + " Where A.userId = :userId ";
			Query aQuery = entityManager.createQuery(sql);
			aQuery.setParameter("userId", userId);
			return (Account) aQuery.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	public Account findUserAccountByEmail(String email) {
		try {
			String sql = "Select A from " + Account.class.getName() + " A " + " Where A.email = :email ";
			Query aQuery = entityManager.createQuery(sql);
			aQuery.setParameter("email", email);
			return (Account) aQuery.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	public List<Account> getListAccount() {
		try {
			String sql = "Select A from " + Account.class.getName();
			Query aQuery = entityManager.createQuery(sql);
			return aQuery.getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	public Account register(Account account) {
		try {
			String sql = "Insert into " + Account.class.getName()
					+ "values(:userID, :password, :email, :fullname, :isActived, :roleId) ";
			Query aQuery = entityManager.createQuery(sql);
			aQuery.setParameter("userID", account.getUserId());
			aQuery.setParameter("email", account.getEmail());
			aQuery.setParameter("password", account.getPassword());
			aQuery.setParameter("isActived", true);
			aQuery.setParameter("roleId", 3);
			return (Account) aQuery.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}
