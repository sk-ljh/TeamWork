package com.our.pojo;

public class Dishs_detail {
	
	public int dishs_detail_id;
	public int dishs_id;
	public String supplier;
	public String introduce_detail;
	public String size;
	public String taste;
	public Dishs_detail() {
		super();
	}
	public Dishs_detail(int dishs_detail_id, int dishs_id, String supplier, String introduce_detail, String size,
			String taste) {
		super();
		this.dishs_detail_id = dishs_detail_id;
		this.dishs_id = dishs_id;
		this.supplier = supplier;
		this.introduce_detail = introduce_detail;
		this.size = size;
		this.taste = taste;
	}
	public int getDishs_detail_id() {
		return dishs_detail_id;
	}
	public void setDishs_detail_id(int dishs_detail_id) {
		this.dishs_detail_id = dishs_detail_id;
	}
	public int getDishs_id() {
		return dishs_id;
	}
	public void setDishs_id(int dishs_id) {
		this.dishs_id = dishs_id;
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
		return "dishs_detail [dishs_detail_id=" + dishs_detail_id + ", dishs_id=" + dishs_id + ", supplier=" + supplier
				+ ", introduce_detail=" + introduce_detail + ", size=" + size + ", taste=" + taste + "]";
	}
	
}
