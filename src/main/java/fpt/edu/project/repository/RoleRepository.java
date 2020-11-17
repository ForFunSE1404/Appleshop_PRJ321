package fpt.edu.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer> {
	@Query("Select roleName from Role where roleId = :roleId")
	String getRoleName(@Param("roleId") int roleId);
}
