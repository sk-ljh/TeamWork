package com.sunke.entity;

public class TableStatus {
	private int table_status;
	private int table_number;
	public TableStatus(){
		
	}
	public TableStatus(int table_status, int table_number) {
		
		this.table_status = table_status;
		this.table_number = table_number;
	}
	public int getTable_status() {
		return table_status;
	}
	public void setTable_status(int table_status) {
		this.table_status = table_status;
	}
	public int getTable_number() {
		return table_number;
	}
	public void setTable_number(int table_number) {
		this.table_number = table_number;
	}
	@Override
	public String toString() {
		return "TableStatus {table_status=" + table_status + ", table_number=" + table_number + "}";
	}
	
}
