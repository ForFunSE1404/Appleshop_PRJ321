package fpt.edu.project.dao;

import java.util.List;

import javax.persistence.EntityManagerFactory;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Product;

@Repository
public class ProductDao {
	@Autowired
	private EntityManagerFactory entityManagerFactory;
	
	public List<Product> getAllProduct(){
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		String hql = "From Product where visibility = true";
		Query<Product> aQuery = session.createQuery(hql);
		return aQuery.getResultList();
	}
	
	public List<Product> findProductByName(String name){
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		String hql = "From Product P where P.productName like :name";
		Query<Product> aQuery = session.createQuery(hql);
		aQuery.setParameter("name",'%'+name+'%');
		return aQuery.getResultList();
	}
	
	public Product findProductByID(String id){
		Session session = entityManagerFactory.createEntityManager().unwrap(Session.class);
		String hql = "From Product P where P.productId = :id";
		Query<Product> aQuery =session.createQuery(hql);
		aQuery.setParameter("id", id);
		return aQuery.getResultList().get(0);
	}
	
}
