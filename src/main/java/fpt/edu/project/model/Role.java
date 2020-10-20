package fpt.edu.project.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Role")
public class Role implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	@Column(name = "roleId")
	private int roleId;
	@Column(name = "roleName", length = 20)
	private String roleName;
	@OneToMany(mappedBy = "role", cascade = CascadeType.ALL)
	private Set<Account> accounts;

	public Role() {
		// TODO Auto-generated constructor stub
	}

	public Role(int roleId, String roleName, Set<Account> accounts) {
		super();
		this.roleId = roleId;
		this.accounts = accounts;
		this.roleName = roleName;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Set<Account> getAccounts() {
		return accounts;
	}

	public void setAccounts(Set<Account> accounts) {
		this.accounts = accounts;
	}

}
