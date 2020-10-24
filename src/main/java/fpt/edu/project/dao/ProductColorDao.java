package fpt.edu.project.dao;

import java.util.List;

import javax.persistence.EntityManagerFactory;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.ProductColor;

@Repository
public class ProductColorDao {
	@Autowired
	private EntityManagerFactory entityManagerFactory;
	
	public List<ProductColor> getAllProductColor(){
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		String hql = "From ProductColor";
		Query<ProductColor> aQuery = session.createQuery(hql);
		return aQuery.getResultList();
	}
	

}
