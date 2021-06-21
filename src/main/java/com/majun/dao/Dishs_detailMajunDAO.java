package com.majun.dao;

import java.util.List;
import java.util.Map;

import com.our.pojo.Dishs_detail;

public interface Dishs_detailMajunDAO {

	// 查询所有菜品详情
	List<Dishs_detail> ListDishs_detail();

	// 修改菜品详情
	int UpdateDishs_detail(Map map);
}
