package com.sunke.entity;

public class Dish_DishDetail {
	public int dishs_delete;
	public int dishs_id;
	public String dishs_name;
	public String dishs_cate;
	public String dishs_icon;
	public float price;
	public String introduction;
	public int recommend;
	public int dishs_detail_id;
	public String supplier;
	public String introduce_detail;
	public String size;
	public String taste;
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
	public int getDishs_detail_id() {
		return dishs_detail_id;
	}
	public void setDishs_detail_id(int dishs_detail_id) {
		this.dishs_detail_id = dishs_detail_id;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public String getIntroduce_detail() {
		return introduce_detail;
	}
	public void setIntroduce_detail(String introduce_detail) {
		this.introduce_detail = introduce_detail;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getTaste() {
		return taste;
	}
	public void setTaste(String taste) {
		this.taste = taste;
	}
	@Override
	public String toString() {
		return "Dish_DishDetail [dishs_delete=" + dishs_delete + ", dishs_id=" + dishs_id + ", dishs_name=" + dishs_name
				+ ", dishs_cate=" + dishs_cate + ", dishs_icon=" + dishs_icon + ", price=" + price + ", introduction="
				+ introduction + ", recommend=" + recommend + ", dishs_detail_id=" + dishs_detail_id + ", supplier="
				+ supplier + ", introduce_detail=" + introduce_detail + ", size=" + size + ", taste=" + taste + "]";
	}
	
}
