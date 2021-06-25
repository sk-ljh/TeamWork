package com.yangyurui.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.our.pojo.Dishs_detail;
import com.yangyurui.dao.DishsDetailYangyuruiDao;
import com.yangyurui.service.DishsDetailYangyuruiService;

@Service
public class DishsDetailYangyuruiServiceImpl implements DishsDetailYangyuruiService{
	@Autowired
	private DishsDetailYangyuruiDao dishDetailDao;
	
	//查询菜品详情
	@Override
	public Dishs_detail getDishDetail(int dish_id) {
		return dishDetailDao.getDishDetail(dish_id).get(0);
	}
	
	//添加菜品详情
	@Override
	public void insertDishsDetail(String supplier,String introduction_detail,String size,String flavor) {
		int theId=dishDetailDao.getCurrentDishDetailNumber()+1;
		int res=dishDetailDao.insertDishsDetail(new Dishs_detail(theId,theId,supplier,introduction_detail,size,flavor));
	}
	
	// 修改菜品详情
	@Override
	public int updateDishsdetail(Map map) {
		// TODO 自动生成的方法存根
		return dishDetailDao.updateDishsdetail(map);
	}
}
