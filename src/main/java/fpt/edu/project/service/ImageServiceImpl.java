package fpt.edu.project.service;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpt.edu.project.repository.AccountRepository;

@Service
public class ImageServiceImpl {
	@Autowired
	private EntityManager entityManager;
	@Autowired
	private AccountRepository accountRepository;
}
