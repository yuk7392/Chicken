package com.chicken.user;

public class UserDto {
	//private 변수
	private String id;
	private String password;
	private String name;
	private String phone;
	private String addr;
	private String nickname;
	
	public void setUser(UserDto u) {
		this.id = u.getId();
		this.password = u.getPw();
		this.name = u.getName();
		this.phone = u.getPhone();
		this.addr = u.getAddr();
		this.nickname = u.getNickname();
	}
	
	//public get, set 함수
	public String getId() {
		return id;
	}
	public void setId(String id){
		this.id = id;
	}

	public String getPw() {
		return password;
	}
	public void setPw(String password){
		this.password = password;
	}

	public String getName() {
		return name;
	}
	public void setName(String name){
		this.name = name;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone){
		this.phone = phone;
	}
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr){
		this.addr = addr;
	}

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname){
		this.nickname = nickname;
	}
}
