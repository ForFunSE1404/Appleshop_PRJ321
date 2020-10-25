package fpt.edu.project.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import fpt.edu.project.model.Category;

@Repository
@Transactional
public class CategoryDao {
	@Autowired
	private EntityManager entityManager;

	public List<Category> getAllCategories() {
		String sql = "Select c from " + Category.class.getName() + " c ";
		Query query = entityManager.createQuery(sql, Category.class);
		return query.getResultList();
	}

//	public boolean newCategory(Category category) {
//		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
//		Transaction trans = session.getTransaction();
//		trans.begin();
//		try {
//			session.save(category);
//			trans.commit();
//			return true;
//		} catch (Exception e) {
//			trans.rollback();
//			e.printStackTrace();
//		}
//		return false;
//	}
//
//	public boolean update(Category cate) {
//		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
//		Transaction trans = session.getTransaction();
//		trans.begin();
//		try {
//			session.update(cate);
//			trans.commit();
//			return true;
//		} catch (Exception e) {
//			trans.rollback();
//			e.printStackTrace();
//		}
//		return false;
//	}
//
//	public boolean delete(String cateId) {
//		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
//		Transaction trans = session.getTransaction();
//		trans.begin();
//		try {
//			String hql = "delete from Category where categoryId = :categoryId";
//			Query query = session.createQuery(hql);
//			query.setParameter("categoryId", cateId);
//			query.executeUpdate();
//			trans.commit();
//			return true;
//		} catch (Exception e) {
//			e.printStackTrace();
//			trans.rollback();
//		}
//		return false;
//	}
//
	public Category search(String cateId) {
		try {
			String sql = "Select c From Category c where c.categoryId = :categoryId";
			Query query = entityManager.createQuery(sql, Category.class);
			query.setParameter("categoryId", cateId);
			return (Category) query.getSingleResult();
		} catch (NoResultException n) {
			return null;
		}
	}
	
	public Category delete(String cateId) {
		try {
			String sql = "Delete c From Category c where c.categoryId = :categoryId";
			Query query = entityManager.createQuery(sql, Category.class);
			query.setParameter("categoryId", cateId);
			return (Category) query.getSingleResult();
		} catch (NoResultException n) {
			return null;
		}
	}
	
//	public Category update(String cateId) {
//		try {
//			String sql = "Update c From Category c set c.categoryName = :categoryName where c.categoryId = :categoryId";
//			Query query = entityManager.createQuery(sql, Category.class);
//			query.setParameter("categoryId", cateId);
//			return (Category) query.getSingleResult();
//		} catch (NoResultException n) {
//			return null;
//		}
//	}
	
	//Còn Update và New chưa làm
}
