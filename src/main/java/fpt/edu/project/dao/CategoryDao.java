package fpt.edu.project.dao;

import java.util.List;

import javax.persistence.EntityManagerFactory;

import org.hibernate.Session;
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
}
