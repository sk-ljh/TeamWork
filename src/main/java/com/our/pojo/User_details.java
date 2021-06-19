package com.our.pojo;

public class User_details {
	
	public int user_details_id;
	public int user_id;
	public String name;
	public String sex;
	public String phone;
	public String icon;
	public String education;
	public String work_date;
	public int role;
	
	public User_details() {
		super();
	}

	public User_details(int user_details_id, int user_id, String name, String sex, String phone, String icon,
			String education, String work_date, int role) {
		super();
		this.user_details_id = user_details_id;
		this.user_id = user_id;
		this.name = name;
		this.sex = sex;
		this.phone = phone;
		this.icon = icon;
		this.education = education;
		this.work_date = work_date;
		this.role = role;
	}

	public int getUser_details_id() {
		return user_details_id;
	}

	public void setUser_details_id(int user_details_id) {
		this.user_details_id = user_details_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getWork_date() {
		return work_date;
	}

	public void setWork_date(String work_date) {
		this.work_date = work_date;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User_details [user_details_id=" + user_details_id + ", user_id=" + user_id + ", name=" + name + ", sex="
				+ sex + ", phone=" + phone + ", icon=" + icon + ", education=" + education + ", work_date=" + work_date
				+ ", role=" + role + "]";
	}
	
}
