package com.yangyurui.dao;

import java.util.List;
import java.util.Map;

import com.our.pojo.Dishs_detail;

public interface DishsDetailYangyuruiDao {
	//查询当前菜品详情数量
	int getCurrentDishDetailNumber();
	
	//查询特定菜品的详情
	List<Dishs_detail> getDishDetail(int dish_id);
	
	//增加菜品详情（增加新菜品时一并增加其详情信息）
	int insertDishsDetail(Dishs_detail dish_detail);
	
	// 修改菜品详情
	int updateDishsdetail(Map map);
}
