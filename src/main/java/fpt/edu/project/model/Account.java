package fpt.edu.project.model;
// Generated Oct 26, 2020 1:06:17 PM by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Account generated by hbm2java
 */
@Entity
@Table(name = "Account", schema = "dbo", catalog = "YourAnswer")
public class Account implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userId;
	private InfoUser infoUser;
	private Role role;
	private String password;
	private String email;
	private String fullname;
	private boolean isActived;
	private String token;
	private String avartar;
	private Set<Cart> carts = new HashSet<Cart>(0);
	private Set<WishList> wishLists = new HashSet<WishList>(0);
	private Set<Rating> ratings = new HashSet<Rating>(0);

	public Account() {
	}

	public Account(String userId, Role role, String password, String email, String fullname, boolean isActived) {
		this.userId = userId;
		this.role = role;
		this.password = password;
		this.email = email;
		this.fullname = fullname;
		this.isActived = isActived;
	}

	public Account(String userId, InfoUser infoUser, Role role, String password, String email, String fullname,
			boolean isActived, String token, String avartar, Set<Cart> carts, Set<WishList> wishLists,
			Set<Rating> ratings) {
		this.userId = userId;
		this.infoUser = infoUser;
		this.role = role;
		this.password = password;
		this.email = email;
		this.fullname = fullname;
		this.isActived = isActived;
		this.token = token;
		this.avartar = avartar;
		this.carts = carts;
		this.wishLists = wishLists;
		this.ratings = ratings;
	}

	@Id
	@Column(name = "userID", unique = true, nullable = false)
	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "infoId")
	public InfoUser getInfoUser() {
		return this.infoUser;
	}

	public void setInfoUser(InfoUser infoUser) {
		this.infoUser = infoUser;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "roleId", nullable = false)
	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Column(name = "password", nullable = false)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "email", nullable = false)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "fullname", nullable = false)
	public String getFullname() {
		return this.fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	@Column(name = "isActived", nullable = false)
	public boolean isIsActived() {
		return this.isActived;
	}

	public void setIsActived(boolean isActived) {
		this.isActived = isActived;
	}

	@Column(name = "token")
	public String getToken() {
		return this.token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	@Column(name = "avartar")
	public String getAvartar() {
		return this.avartar;
	}

	public void setAvartar(String avartar) {
		this.avartar = avartar;
	}

	@OneToMany(cascade=CascadeType.ALL, mappedBy = "account")
	public Set<Cart> getCarts() {
		return this.carts;
	}

	public void setCarts(Set<Cart> carts) {
		this.carts = carts;
	}

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "account")
	public Set<WishList> getWishLists() {
		return this.wishLists;
	}

	public void setWishLists(Set<WishList> wishLists) {
		this.wishLists = wishLists;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Rating> getRatings() {
		return this.ratings;
	}

	public void setRatings(Set<Rating> ratings) {
		this.ratings = ratings;
	}

}
