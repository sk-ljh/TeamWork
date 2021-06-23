package com.majun.service;

import java.util.List;
import java.util.Map;

import com.our.pojo.Dishs_detail;

public interface DishsdetailMajunService {

	// 查询所有菜品详情
	List<Dishs_detail> listDishsdetail();

	// 修改菜品详情
	int updateDishsdetail(Map map);
}
