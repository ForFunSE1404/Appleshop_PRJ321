package fpt.edu.project.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Account;

@Repository
public class AccountDao {
	@Autowired
	private EntityManager entityManager;

	public Account findUserAccount(String userId) {
		try {
			String hql = "Select A from " + Account.class.getName() + " A " //
					+ " Where A.userId = :userId ";
			Query aQuery = entityManager.createQuery(hql);
			aQuery.setParameter("userId", userId);
			return (Account) aQuery.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}
