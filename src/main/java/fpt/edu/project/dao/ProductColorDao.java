package fpt.edu.project.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import fpt.edu.project.model.ProductColor;

@Repository
@Transactional
public class ProductColorDao {
	@Autowired
	private EntityManager entityManager;

	public List<ProductColor> getAllProductColor() {
		try {
			String sql = "Select p from " + ProductColor.class.getName() + " p ";
			Query query = entityManager.createQuery(sql, ProductColor.class);
			return query.getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}
}
