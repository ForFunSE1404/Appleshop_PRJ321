package fpt.edu.project.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import fpt.edu.project.model.Product;

@Repository
@Transactional
public class ProductDao {

	@Autowired
	private EntityManager entityManager;

	public List<Product> getList() {
		try {
			String sql = "Select p from " + Product.class.getName() + " p ";
			Query query = entityManager.createQuery(sql, Product.class);
			return query.getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	public List<Product> findProductByName(String name) {
		String sql = "From Product P where P.productName like :name";
		Query query = entityManager.createQuery(sql, Product.class);
		query.setParameter("name", '%' + name + '%');
		return query.getResultList();
	}

	public Product findProductByID(String id) {
		String sql = "From Product P where P.productId = :id";
		Query query = entityManager.createQuery(sql, Product.class);
		query.setParameter("id", id);
		return (Product) query.getSingleResult();
	}

}
