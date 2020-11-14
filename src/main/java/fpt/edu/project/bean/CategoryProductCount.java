package fpt.edu.project.bean;

import java.io.Serializable;

public class CategoryProductCount implements Serializable {
	private String categoryName;
	private Long count;

	public CategoryProductCount(String categoryName, Long count) {
		super();
		this.categoryName = categoryName;
		this.count = count;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

}
