package fpt.edu.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fpt.edu.project.service.StatisticsServiceImpl;
import fpt.edu.project.statisticsmodel.CategoryProductCount;
import fpt.edu.project.statisticsmodel.SellingMonth;

@RestController
public class StatisticsRestController {
	@Autowired
	public StatisticsServiceImpl statisticsServiceImpl;

	@RequestMapping("/statistics/getproductcategorycount")
	public List<CategoryProductCount> getProductCounts() {
		return statisticsServiceImpl.findCategoryCount();
	}

	@RequestMapping("/statistics/sellbymonth")
	public List<SellingMonth> getSellByMonth() {
		return statisticsServiceImpl.sellingMonths();
	}

	@RequestMapping("/statistics/totalcustomer")
	public List<Integer> getTotalCustomer() {
		return statisticsServiceImpl.totalCustomer();
	}

	@RequestMapping("/statistics/totalorder")
	public List<Integer> getTotalOrder() {
		return statisticsServiceImpl.totalOrder();
	}

	@RequestMapping("/statistics/totalproductsold")
	public List<Integer> getTotalProductSold() {
		return statisticsServiceImpl.totalProductSold();
	}

	@RequestMapping("/statistics/totalmoney")
	public List<Integer> getTotalMoney() {
		return statisticsServiceImpl.totalMoney();
	}
}
