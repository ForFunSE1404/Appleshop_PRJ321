package fpt.edu.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fpt.edu.project.model.Account;
import fpt.edu.project.statisticsmodel.CategoryProductCount;
import fpt.edu.project.statisticsmodel.SellingMonth;

@Repository
public interface StatisticsRepository extends JpaRepository<Account, Integer> {

	@Query("SELECT new fpt.edu.project.statisticsmodel.CategoryProductCount(p.category.categoryName, COUNT(p.category.categoryName)) FROM Product p GROUP BY p.category.categoryName")
	public List<CategoryProductCount> findCategoryCount();

	@Query("SELECT new fpt.edu.project.statisticsmodel.SellingMonth(MONTH(c.createDate), ISNULL(SUM(c.totalprice), 0)) FROM Cart c GROUP BY MONTH(c.createDate)")
	public List<SellingMonth> sellingMonths();

	@Query("SELECT ISNULL(COUNT(a),0) FROM Account a WHERE a.role.roleId = 3 GROUP BY a.role.roleId")
	public List<Integer> totalCustomer();

	@Query("SELECT ISNULL(SUM(c.totalprice), 0) FROM Cart c WHERE c.status = true")
	public List<Integer> totalMoney();

	@Query("SELECT ISNULL(COUNT(c), 0) FROM Cart c WHERE c.status = true")
	public List<Integer> totalOrder();

	@Query("SELECT ISNULL(SUM(cd.quantity), 0) FROM CartDetail cd INNER JOIN Cart c ON cd.cart.cartId = c.cartId WHERE c.status = true")
	public List<Integer> totalProductSold();
}
