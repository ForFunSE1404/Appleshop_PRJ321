package fpt.edu.project.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManagerFactory;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Account;

@Repository
public class AccountDao {
	@Autowired
	private EntityManagerFactory entityManagerFactory;

	public List<Account> showAll() {
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		String hql = "From Account";
		Query<Account> aQuery = session.createQuery(hql);
		return aQuery.getResultList();
	}
	
	public boolean register(Account account){
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		Transaction trans = session.getTransaction();
		trans.begin();
		try {
			session.save(account);
			trans.commit();
			return true;
		}catch(Exception e) {
			trans.rollback();
			e.printStackTrace();
		}
		return false;
	}
	public boolean update(Account acc) {
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		Transaction trans = session.getTransaction();
		trans.begin();
		try {
			session.update(acc);
			trans.commit();
			return true;
		}catch(Exception e) {
			trans.rollback();
			e.printStackTrace();
		}
		return false;
	}
	public boolean delete(String userId) {
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		Transaction trans = session.getTransaction();
		trans.begin();
		try {
			String hql = "delete from Account where userId=:userId";
			Query query = session.createQuery(hql);
			query.setParameter("userId", userId);
			query.executeUpdate();
			trans.commit();
			return true;
		}catch(Exception e) {
			trans.rollback();
			e.printStackTrace();
		}
		return false;
	}
}
