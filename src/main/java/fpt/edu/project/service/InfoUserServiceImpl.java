package fpt.edu.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpt.edu.project.model.InfoUser;
import fpt.edu.project.repository.InfoUserRespository;

@Service
public class InfoUserServiceImpl {

	@Autowired
	private InfoUserRespository infoUserRespository;

	public InfoUser save(InfoUser infoUser) {
		return infoUserRespository.save(infoUser);
	}

	public InfoUser saveAndFlush(InfoUser infoUser) {
		return infoUserRespository.saveAndFlush(infoUser);
	}
}
