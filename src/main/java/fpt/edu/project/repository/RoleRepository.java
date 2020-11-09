package fpt.edu.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Role;
@Repository
public interface RoleRepository extends JpaRepository<Role, Integer> {

}
