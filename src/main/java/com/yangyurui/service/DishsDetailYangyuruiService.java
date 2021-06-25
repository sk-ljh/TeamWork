package com.yangyurui.service;

import java.util.Map;

import com.our.pojo.Dishs_detail;

public interface DishsDetailYangyuruiService {
	//查询菜品详情
	public Dishs_detail getDishDetail(int dish_id) ;
	
	//添加菜品详情
	public void insertDishsDetail(String supplier,String introduction_detail,String size,String flavor) ;
	
	// 修改菜品详情
	int updateDishsdetail(Map map);
}
