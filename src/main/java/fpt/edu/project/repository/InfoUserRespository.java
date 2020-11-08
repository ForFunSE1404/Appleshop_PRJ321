package fpt.edu.project.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.InfoUser;

@Repository
@Transactional
public interface InfoUserRespository extends JpaRepository<InfoUser, Integer> {

}
