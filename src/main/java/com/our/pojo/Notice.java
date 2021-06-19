package com.our.pojo;

public class Notice {

	public int notice_id;
	public int user_id;
	public String notice_person;
	public String notice_date;
	public String notice_message;
	public Notice() {
		super();
	}
	public Notice(int notice_id, int user_id, String notice_person, String notice_date, String notice_message) {
		super();
		this.notice_id = notice_id;
		this.user_id = user_id;
		this.notice_person = notice_person;
		this.notice_date = notice_date;
		this.notice_message = notice_message;
	}
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getNotice_person() {
		return notice_person;
	}
	public void setNotice_person(String notice_person) {
		this.notice_person = notice_person;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_message() {
		return notice_message;
	}
	public void setNotice_message(String notice_message) {
		this.notice_message = notice_message;
	}
	@Override
	public String toString() {
		return "notice [notice_id=" + notice_id + ", user_id=" + user_id + ", notice_person=" + notice_person
				+ ", notice_date=" + notice_date + ", notice_message=" + notice_message + "]";
	}
}
