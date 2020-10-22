package fpt.edu.project.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Rating")
public class Rating {
	@Id
	@Column(name = "ratingId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ratingId;

	@ManyToOne
	@JoinColumn(name = "userId")
	private Account account;
	@ManyToOne
	@JoinColumn(name = "productId")
	private Product product;

	public Rating() {
		// TODO Auto-generated constructor stub
	}

	public int getRatingId() {
		return ratingId;
	}

	public void setRatingId(int ratingId) {
		this.ratingId = ratingId;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}
