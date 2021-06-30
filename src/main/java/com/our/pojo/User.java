package com.our.pojo;

public class User {

	public int user_delete;
	public int user_id;
	public String user_name;
	public String password;
	public String face_path;
	public String getFace_path() {
		return face_path;
	}
	public void setFace_path(String face_path) {
		this.face_path = face_path;
	}
	public User() {
		super();
	}
	public User(int user_delete, int user_id, String user_name, String password, String face_path) {
		super();
		this.user_delete = user_delete;
		this.user_id = user_id;
		this.user_name = user_name;
		this.password = password;
		this.face_path = face_path;
	}
	public int getUser_delete() {
		return user_delete;
	}
	public void setUser_delete(int user_delete) {
		this.user_delete = user_delete;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "User [user_delete=" + user_delete + ", user_id=" + user_id + ", user_name=" + user_name + ", password="
				+ password + ", face_path=" + face_path + "]";
	}
	
	
}
