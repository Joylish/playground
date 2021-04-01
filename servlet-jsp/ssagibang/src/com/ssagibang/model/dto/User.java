package com.ssagibang.model.dto;

//Model : VO, DTO
//회원관련 서비스로직
public class User {
	private String userId, userName, userPwd, email, address, joinDate;

	public User(String userId, String userName, String userPwd, String email, String address, String joinDate) {
		this(userId, userName, userPwd, email, address);
		this.joinDate = joinDate;
	}

	public User(String userId, String userName, String userPwd, String email, String address) {
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.email = email;
		this.address = address;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
}
