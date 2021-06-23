package com.yangyurui.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.our.pojo.Dishs;
import com.yangyurui.dao.DishsYangyuruiDao;
import com.yangyurui.service.DishsYangyuruiService;

@Service
public class DishsYangyuruiServiceImpl implements DishsYangyuruiService{
	@Autowired
	private DishsYangyuruiDao dishDao;
	
	//查询当前菜品数量
	@Override
	public int getCurrentDishNumber() {
		return dishDao.getCurrentDishNumber();
	}
	
	//查询所有菜品
	@Override
	public List<Dishs> listDishs() {
		return dishDao.listDishs();
	}
	
	//按关键字查询菜品
	@Override
	public List<Dishs> listDishsByKey(String key) {
		key="%"+key+"%"; //在关键字前后添加'%'来进行模糊查询
		return dishDao.listDishsByKey(key);
	}
	
	//按菜类查询菜品
	@Override
	public List<Dishs> listDishsByCategory(String category) {
		return dishDao.listDishsByCategory(category);
	}
	
	//增加新菜品
	@Override
	public void insertDishs(String name,String category,String icon,float price,String introduction,int recom) {
		int res=dishDao.insertDishs(new Dishs(0,dishDao.getCurrentDishNumber()+1,name,category,icon,price,introduction,recom));
		System.out.println(res);
	}
	
	//下架菜品
	@Override
	public void removeDishs(int dish_id) {
		int res=dishDao.removeDishs(dish_id);
		System.out.println(res);
	}
	
	//重新上架某菜品
	@Override
	public void restoreDishs(int dish_id) {
		int res=dishDao.restoreDishs(dish_id);
		System.out.println(res);
	}
}
