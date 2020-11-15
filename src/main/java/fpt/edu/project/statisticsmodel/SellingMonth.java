package fpt.edu.project.statisticsmodel;

import java.io.Serializable;

public class SellingMonth implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int month;
	private double totalPrice;

	public SellingMonth() {
		// TODO Auto-generated constructor stub
	}

	public SellingMonth(int month, double totalPrice) {
		super();
		this.month = month;
		this.totalPrice = totalPrice;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

}
