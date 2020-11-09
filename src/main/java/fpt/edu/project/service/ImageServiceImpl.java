package fpt.edu.project.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpt.edu.project.model.Image;
import fpt.edu.project.repository.ImageRepository;

@Service
@Transactional
public class ImageServiceImpl {

	@Autowired
	private ImageRepository imageRepository;

	public void saveImg(String imgUrl, String productId) {
		imageRepository.saveImg(imgUrl, productId);
	}

	public void deleteImg(String productId) {
		 imageRepository.deleteImg(productId);
	}
//	public void delete(Image entity) {
//		imageRepository.delete(entity);
//	}
}
