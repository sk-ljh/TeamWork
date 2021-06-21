package com.majun.service;

import java.util.List;
import java.util.Map;

import com.our.pojo.Dishs_detail;

public interface Dishs_detailMajunService {

	// 查询所有菜品详情
	List<Dishs_detail> listDishs_detail();

	// 修改菜品详情
	int updateDishs_detail(Map map);
}
