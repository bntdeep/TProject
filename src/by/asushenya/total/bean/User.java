package by.asushenya.total.bean;

import by.asushenya.total.bean.util.UserRole;

public class User {
	private int id;
	private String login;
	private String password;
	private String email;
	private UserRole role;
	private float cash;
	
	public User(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
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

	public UserRole getRole() {
		return role;
	}

	public void setRole(UserRole role) {
		this.role = role;
	}

	public float getCash() {
		return cash;
	}

	public void setCash(float cash) {
		this.cash = cash;
	}
	
	
}
