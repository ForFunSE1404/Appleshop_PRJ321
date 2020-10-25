package fpt.edu.project.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class RoleDao {
	@Autowired
	private EntityManager entityManager;

	public String getRoleName(int roleId) {
		try {
			String sql = "Select R.roleName from Role R where R.roleId = :roleId";
			Query aQuery = entityManager.createQuery(sql);
			aQuery.setParameter("roleId", roleId);
			return (String) aQuery.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
}
