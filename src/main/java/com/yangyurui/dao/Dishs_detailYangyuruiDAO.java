package com.yangyurui.dao;

import com.our.pojo.Dishs_detail;

public interface Dishs_detailYangyuruiDAO {
	//查询特定菜品的详情
	Dishs_detail getDishDetail(int dish_id);
	
	//增加菜品详情（增加新菜品时一并增加其详情信息）
	int insertDishs_detail(Dishs_detail dish_detail);
}
