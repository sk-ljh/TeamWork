package com.our.pojo;

public class Order_history {

	public int table_number;
	public float total_price;
	public String begin_time;
	public String end_time;
	public int payment_state;
	public int order_id;
	public int user_id;
	public int order_delete;
	
	public Order_history() {
		super();
	}
	

	public Order_history(int table_number, float total_price, String begin_time, String end_time, int payment_state,
			int order_id, int user_id, int order_delete) {
		super();
		this.table_number = table_number;
		this.total_price = total_price;
		this.begin_time = begin_time;
		this.end_time = end_time;
		this.payment_state = payment_state;
		this.order_id = order_id;
		this.user_id = user_id;
		this.order_delete = order_delete;
	}

	public int getTable_number() {
		return table_number;
	}

	public void setTable_number(int table_number) {
		this.table_number = table_number;
	}

	public float getTotal_price() {
		return total_price;
	}

	public void setTotal_price(float total_price) {
		this.total_price = total_price;
	}

	public String getBegin_time() {
		return begin_time;
	}

	public void setBegin_time(String begin_time) {
		this.begin_time = begin_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public int getPayment_state() {
		return payment_state;
	}

	public void setPayment_state(int payment_state) {
		this.payment_state = payment_state;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getOrder_delete() {
		return order_delete;
	}

	public void setOrder_delete(int order_delete) {
		this.order_delete = order_delete;
	}

	@Override
	public String toString() {
		return "Order_history [table_number=" + table_number + ", total_price=" + total_price + ", begin_time="
				+ begin_time + ", end_time=" + end_time + ", payment_state=" + payment_state + ", order_id=" + order_id
				+ ", user_id=" + user_id + ", order_delete=" + order_delete + "]";
	}
	
}
