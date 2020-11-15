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

	@RequestMapping("/getproductcategorycount")
	public List<CategoryProductCount> getProductCounts() {
		return statisticsServiceImpl.findCategoryCount();
	}

	@RequestMapping("/sellbymonth")
	public List<SellingMonth> getSellByMonth() {
		return statisticsServiceImpl.sellingMonths();
	}
}
