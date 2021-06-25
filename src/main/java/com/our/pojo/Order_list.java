package com.our.pojo;

public class Order_list {

	public int dishs_id;
	public String dishs_name;
	public int number;
	public float price;
	public int cook_state;
	public int order_id;
	public int order_list_id;
	
	
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
	public void setPrice(float price) {
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
	public int getOrder_list_id() {
		return order_list_id;
	}
	public void setOrder_list_id(int order_list_id) {
		this.order_list_id = order_list_id;
	}
	public Order_list(int dishs_id, String dishs_name, int number, float price, int cook_state, int order_id,
			int order_list_id) {
		super();
		this.dishs_id = dishs_id;
		this.dishs_name = dishs_name;
		this.number = number;
		this.price = price;
		this.cook_state = cook_state;
		this.order_id = order_id;
		this.order_list_id = order_list_id;
	}
	
	public Order_list() {
		super();
	}
	
	
}
