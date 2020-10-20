package fpt.edu.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import fpt.edu.project.dao.AccountDao;

@Controller
public class PageControl {
	@Autowired
	private AccountDao accountDao;

	@RequestMapping(value = "/index")
	public String index() {
		return "user/index";
	}

	@RequestMapping(value = "/product")
	public String product() {

		return "user/product";
	}

	@RequestMapping(value = "/cart")
	public String account() {
		return "user/cart";
	}

	@RequestMapping(value = "/product_details")
	public String product_details() {
		return "product_details";
	}
}
