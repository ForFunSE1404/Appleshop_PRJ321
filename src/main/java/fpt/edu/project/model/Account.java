package fpt.edu.project.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Account")
public class Account implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "userID", length = 20)
	private String userID;
	@Column(name = "password", length = 20)
	private String password;
	@Column(name = "email", length = 50)
	private String email;
	@Column(name = "fullname", length = 50)
	private String fullname;
	@Column(name = "isActived")
	private boolean isActived;
	@Column(name = "token", length = 50)
	private String token;
	@Column(name = "infoId")
	private int infoId;
	@ManyToOne
	@JoinColumn(name = "roleId")
	private Role role;
	@Column(name = "avartar", length = 255)
	private String avartar;

	@OneToMany(mappedBy = "account")
	private Set<Rating> ratings = new HashSet<>();

	public Account() {
		// TODO Auto-generated constructor stub
	}

	public Account(String userID, String password, String email, String fullname, boolean isActived, String token,
			int infoId, Role role, String avartar) {
		super();
		this.userID = userID;
		this.password = password;
		this.email = email;
		this.fullname = fullname;
		this.isActived = isActived;
		this.token = token;
		this.infoId = infoId;
		this.role = role;
		this.avartar = avartar;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public boolean isActived() {
		return isActived;
	}

	public void setActived(boolean isActived) {
		this.isActived = isActived;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public int getInfoId() {
		return infoId;
	}

	public void setInfoId(int infoId) {
		this.infoId = infoId;
	}

	public Role getRoleId() {
		return role;
	}

	public void setRoleId(Role role) {
		this.role = role;
	}

	public String getAvartar() {
		return avartar;
	}

	public void setAvartar(String avartar) {
		this.avartar = avartar;
	}

}