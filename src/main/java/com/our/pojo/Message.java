package com.our.pojo;

public class Message {
	public int message_id;
	public int from_id;
	public int to_role;
	public String content;
	public String time;
	public int delete_status;
	public Message() {
		super();
	}
	
	public Message(int message_id, int from_id, int to_role, String content, String time,
			int delete_status) {
		super();
		this.message_id = message_id;
		this.from_id = from_id;
		this.to_role = to_role;
		this.content = content;
		this.time = time;
		this.delete_status = delete_status;
	}
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	public int getFrom_id() {
		return from_id;
	}
	public void setFrom_id(int from_id) {
		this.from_id = from_id;
	}
	public int getTo_role() {
		return to_role;
	}
	public void setTo_role(int to_role) {
		this.to_role = to_role;
	}
	public String getContent() {
		return content;
	}
	public void setIntroduce_detail(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getDelete_status() {
		return delete_status;
	}
	public void setTaste(int delete_status) {
		this.delete_status = delete_status;
	}
	@Override
	public String toString() {
		return "message_id [message_id=" + message_id + ", from_id=" + from_id + ", to_role=" + to_role
				+ ", content=" + content + ", time=" + time + ", delete_status=" + delete_status + "]";
	}
}
