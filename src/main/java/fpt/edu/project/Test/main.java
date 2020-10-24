package fpt.edu.project.Test;

import javax.management.relation.Role;

import org.springframework.beans.factory.annotation.Autowired;

import fpt.edu.project.dao.AccountDao;
import fpt.edu.project.dao.CategoryDao;
import fpt.edu.project.model.Account;
import fpt.edu.project.model.Category;

public class main {
	@Autowired
	private static AccountDao accDao;
	@Autowired
	private static CategoryDao cateDao;
	public static void main(String[] args) {
		cateDao.newCategory(new Category("C0001","a1"));
		cateDao.newCategory(new Category("C0002","a2"));
//		cateDao.delete("C0001");
//		cateDao.update("C0004","Nokia");
		for(Category cate : cateDao.getAllCategories()) {
			System.out.println("Category ID "+cate.getCategoryId()+"|| Category name "+cate.getCategoryName());
		}
	}
}
