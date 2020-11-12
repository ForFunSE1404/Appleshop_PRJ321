package fpt.edu.project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpt.edu.project.model.Account;
import fpt.edu.project.model.Product;
import fpt.edu.project.model.WishList;
import fpt.edu.project.repository.WishListRepository;

@Service
public class WishListServiceImpl {
	@Autowired
	private WishListRepository wishlistRepository;
	
	public Optional<WishList> findById(int wishListId) {
		return wishlistRepository.findById(wishListId);
	}
	public WishList save(WishList wishList) {
		return wishlistRepository.save(wishList);
	}
	public List<WishList> findByUserIdID(String userId){
		return wishlistRepository.findByUserId(userId);
	}
	public WishList findByProductAndUserId(String userId, String productId) {
		return wishlistRepository.findByProductAndUserId(userId, productId);
	}
	public void deleteWishList(String productId) {
		wishlistRepository.deleteWishList(productId);
	}
	public List<WishList> findAll() {
		return wishlistRepository.findAll();
	}
	public void deleteById(int wishList) {
		wishlistRepository.deleteById(wishList);
	}
}
