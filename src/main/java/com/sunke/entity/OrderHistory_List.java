package com.sunke.entity;

public class OrderHistory_List {
	private int dishs_id;
	private String dishs_name;
	private int number;
	private float price;
	private int cook_state;
	private int order_id;
	private float total;
	private int user_id;
	private int tableNumber;
	public int getDishs_id() {
		return dishs_id;
	}
	public void setDishs_id(int dishs_id) {
		this.dishs_id = dishs_id;
	}
	public String getDishs_name() {
		return dishs_name;
	}
	public void setDishs_name(String dishs_name) {
		this.dishs_name = dishs_name;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCook_state() {
		return cook_state;
	}
	public void setCook_state(int cook_state) {
		this.cook_state = cook_state;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getTableNumber() {
		return tableNumber;
	}
	public void setTableNumber(int tableNumber) {
		this.tableNumber = tableNumber;
	}
	@Override
	public String toString() {
		return "OrderHistory_List [dishs_id=" + dishs_id + ", dishs_name=" + dishs_name + ", number=" + number
				+ ", price=" + price + ", cook_state=" + cook_state + ", order_id=" + order_id + ", total=" + total
				+ ", user_id=" + user_id + ", tableNumber=" + tableNumber + "]";
	}
	
	
}
