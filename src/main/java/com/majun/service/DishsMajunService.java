package com.majun.service;

import java.util.List;
import java.util.Map;

import com.our.pojo.Dishs;


public interface DishsMajunService {

	// 查询所有菜品
	List<Dishs> listDishs();

	// 修改菜品
	int updateDishs(Map map);
}
