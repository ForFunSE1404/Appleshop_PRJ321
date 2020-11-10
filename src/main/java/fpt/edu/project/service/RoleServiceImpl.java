package fpt.edu.project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpt.edu.project.model.Role;
import fpt.edu.project.repository.RoleRepository;

@Service
public class RoleServiceImpl {
	@Autowired
	private RoleRepository roleRepository;

	public List<Role> findAll() {
		return roleRepository.findAll();
	}

	public Role save(Role entity) {
		return roleRepository.save(entity);
	}

	public Optional<Role> findById(int roleId) {
		return roleRepository.findById(roleId);
	}
}
