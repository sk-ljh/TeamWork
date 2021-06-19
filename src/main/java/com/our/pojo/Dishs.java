package com.our.pojo;

public class Dishs {
	public int dishs_delete;
	public int dishs_id;
	public String dishs_name;
	public String dishs_cate;
	public String dishs_icon;
	public float price;
	public String introduction;
	public int recommend;
	
	public Dishs() {
		super();
	}
	public Dishs(int dishs_delete, int dishs_id, String dishs_name, String dishs_cate, String dishs_icon, float price,
			String introduction, int recommend) {
		super();
		this.dishs_delete = dishs_delete;
		this.dishs_id = dishs_id;
		this.dishs_name = dishs_name;
		this.dishs_cate = dishs_cate;
		this.dishs_icon = dishs_icon;
		this.price = price;
		this.introduction = introduction;
		this.recommend = recommend;
	}
	
	
	public int getDishs_delete() {
		return dishs_delete;
	}
	public void setDishs_delete(int dishs_delete) {
		this.dishs_delete = dishs_delete;
	}
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
	public String getDishs_cate() {
		return dishs_cate;
	}
	public void setDishs_cate(String dishs_cate) {
		this.dishs_cate = dishs_cate;
	}
	public String getDishs_icon() {
		return dishs_icon;
	}
	public void setDishs_icon(String dishs_icon) {
		this.dishs_icon = dishs_icon;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	@Override
	public String toString() {
		return "dishs [dishs_delete=" + dishs_delete + ", dishs_id=" + dishs_id + ", dishs_name=" + dishs_name
				+ ", dishs_cate=" + dishs_cate + ", dishs_icon=" + dishs_icon + ", price=" + price + ", introduction="
				+ introduction + ", recommend=" + recommend + "]";
	}
	
}
