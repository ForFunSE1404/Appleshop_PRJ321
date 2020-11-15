package fpt.edu.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Product;
import fpt.edu.project.statisticsmodel.CategoryProductCount;
import fpt.edu.project.statisticsmodel.SellingMonth;

@Repository
public interface StatisticsRepository extends JpaRepository<Product, String> {

	@Query("SELECT new fpt.edu.project.statisticsmodel.CategoryProductCount(p.category.categoryName, COUNT(p.category.categoryName)) FROM Product p GROUP BY p.category.categoryName")
	public List<CategoryProductCount> findCategoryCount();

	@Query("SELECT new fpt.edu.project.statisticsmodel.SellingMonth(MONTH(c.createDate), ISNULL(SUM(c.totalprice), 0)) FROM Cart c GROUP BY MONTH(c.createDate)")
	public List<SellingMonth> sellingMonths();

}
