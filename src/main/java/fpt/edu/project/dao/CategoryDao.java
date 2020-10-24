package fpt.edu.project.dao;

import java.lang.module.Configuration;
import java.util.List;

import javax.persistence.EntityManagerFactory;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.provider.HibernateUtils;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Category;

@Repository
public class CategoryDao {
	@Autowired
	private EntityManagerFactory entityManagerFactory;

	public List<Category> getAllCategories() {
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		String hql = "From Category";
		Query<Category> query = session.createQuery(hql);
		return query.getResultList();
	}
	
	public boolean newCategory(Category category) {
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		Transaction trans = session.getTransaction();
		trans.begin();
		try {
			session.save(category);
			trans.commit();
			return true;
		}catch(Exception e) {
			trans.rollback();
			e.printStackTrace();
		}
		return false;
	}

	
	public boolean update(Category cate) {
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		Transaction trans = session.getTransaction();
		trans.begin();
		try {
			session.update(cate);
			trans.commit();
			return true;
		}catch(Exception e) {
			trans.rollback();
			e.printStackTrace();
		}
		return false;
	}
	public boolean delete(String cateId) {
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		Transaction trans = session.getTransaction();
		trans.begin();
		try {
			String hql = "delete from Category where categoryId = :categoryId";
			Query query = session.createQuery(hql);
			query.setParameter("categoryId", cateId);
			query.executeUpdate();
			trans.commit();
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
		return false;
	}
	public Category search(String cateId)  {
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		String hql = "From Category c where c.categoryId = :categoryId";
		Query<Category> query = session.createQuery(hql);
		query.setParameter("categoryId",cateId);
		List<Category> list = query.getResultList();
		if(!list.isEmpty()) {
		return list.get(0);
		}
		session.close();
		return null;
	}
}
