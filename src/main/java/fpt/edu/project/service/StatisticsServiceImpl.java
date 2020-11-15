package fpt.edu.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpt.edu.project.repository.StatisticsRepository;
import fpt.edu.project.statisticsmodel.CategoryProductCount;
import fpt.edu.project.statisticsmodel.SellingMonth;

@Service
public class StatisticsServiceImpl {
	@Autowired
	private StatisticsRepository statisticsRepository;

	public List<CategoryProductCount> findCategoryCount() {
		return statisticsRepository.findCategoryCount();
	}

	public List<SellingMonth> sellingMonths() {
		return statisticsRepository.sellingMonths();
	}

	public List<Integer> totalCustomer() {
		return statisticsRepository.totalCustomer();
	}

	public List<Integer> totalOrder() {
		return statisticsRepository.totalOrder();
	}

	public List<Integer> totalProductSold() {
		return statisticsRepository.totalProductSold();
	}

	public List<Integer> totalMoney() {
		return statisticsRepository.totalMoney();
	}
}
