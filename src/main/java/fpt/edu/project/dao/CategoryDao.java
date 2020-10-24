package fpt.edu.project.dao;

import java.util.List;

import javax.persistence.EntityManagerFactory;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Category;

@Repository
public class CategoryDao {
	@Autowired
	private EntityManagerFactory entityManagerFactory;

	public List<Category> getAllCategories() {
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		String hql = "From Category";
		Query<Category> aQuery = session.createQuery(hql);
		return aQuery.getResultList();
	}
	
	public boolean newCategory(Category category) {
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		Transaction trans = session.getTransaction();
		trans.begin();
		try {
			String hql = "Insert into Category(categoryId, categoryName) values ( :categoryId, :categoryName)";
			Query<Category> query = session.createQuery(hql);
			query.setString("categoryId",category.getCategoryId());
			query.setString("categoryName", category.getCategoryName());
			query.executeUpdate();
			trans.commit();
			return true;
		}catch(Exception e) {
			trans.rollback();
			e.printStackTrace();
		}
		return false;
	}
	public boolean update(String cateId, String cateName) {
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		Transaction trans = session.getTransaction();
		trans.begin();
		try {
			String hql = "update Category set categoryName=:categoryName where categoryId=:categoryId";
			Query query = session.createQuery(hql);
			query.setParameter("categoryName",cateName);
			query.setParameter("categoryId",cateId);
			query.executeUpdate();
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
}
