package com.may.entity;

public class UserResponse {
	private Boolean status;
	private String message;
	private Account user;

	public UserResponse() {
	}

	public UserResponse(Boolean status, String message, Account user) {
		super();
		this.status = status;
		this.message = message;
		this.user = user;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Account getUser() {
		return user;
	}

	public void setUser(Account user) {
		this.user = user;
	}
}
