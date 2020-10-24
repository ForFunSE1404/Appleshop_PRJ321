package fpt.edu.project.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManagerFactory;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Account;

@Repository
public class AccountDao {
	@Autowired
	private EntityManagerFactory entityManagerFactory;

	public List<Account> getAllAccount() {
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		String hql = "From Account";
		Query<Account> aQuery = session.createQuery(hql);
		return aQuery.getResultList();
	}
	
	public boolean register(Account account){
		try{
			Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
			String hql = "Insert into Account(userID, password, email, fullname,roleId) "+
						"values(:userId,:password,:email,:fullname,Customer)";
			Query<Account> query = session.createQuery(hql);
			query.setParameter("userId", account.getUserId());
			query.setParameter("password", account.getPassword());
			query.setParameter("email", account.getEmail());
			query.setParameter("fullname", account.getFullname());
			int res = query.executeUpdate();
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean update(String userId,String password) {
		try {
			Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
			String hql = "update Account set password=:password where userId=:userId";
			Query query = session.createQuery(hql);
			query.setParameter("password", password);
			query.setParameter("userId", userId);
			int res = query.executeUpdate();
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean delete(String userId) {
		try {
			Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
			String hql = "delete from Account where userId=:userId";
			Query query = session.createQuery(hql);
			query.setParameter("userId", userId);
			int res = query.executeUpdate();
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
