package com.majun.dao;

import java.util.List;
import java.util.Map;

import com.our.pojo.Dishs;

public interface DishsMajunDAO {

	// 查询所有菜品
	List<Dishs> ListDishs();

	// 修改菜品
	int UpdateDishs(Map map);
}
