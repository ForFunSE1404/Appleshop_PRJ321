package fpt.edu.project.service;

import org.springframework.data.repository.CrudRepository;

import fpt.edu.project.model.Product;

public interface ProductService extends CrudRepository<Product, String> {

}
