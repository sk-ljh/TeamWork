package com.majun.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majun.dao.DishsdetailMajunDao;
import com.majun.service.DishsdetailMajunService;
import com.our.pojo.Dishs_detail;

@Service
public class DishsdetailMajunServiceImpl implements DishsdetailMajunService {

	@Autowired
	private DishsdetailMajunDao dishsdetailMajunDao;

	// 查看菜品详情
	@Override
	public List<Dishs_detail> listDishsdetail() {
		// TODO 自动生成的方法存根
		return dishsdetailMajunDao.listDishsdetail();
	}

	// 修改菜品详情
	@Override
	public int updateDishsdetail(Map map) {
		// TODO 自动生成的方法存根
		return dishsdetailMajunDao.updateDishsdetail(map);
	}

}
