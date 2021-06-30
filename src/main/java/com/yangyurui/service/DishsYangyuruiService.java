package com.yangyurui.service;

import java.util.List;
import java.util.Map;

import com.our.pojo.Dishs;

public interface DishsYangyuruiService {
	//查询当前菜品数量
	public int getCurrentDishNumber();
	
	//查询所有菜品
	public List<Dishs> listDishs();
	
	//按关键字查询菜品
	public List<Dishs> listDishsByKey(String key);
	
	//按菜类查询菜品
	public List<Dishs> listDishsByCategory(String category);
	
	//查询非招牌菜类的菜
	public List<Dishs> listOtherDishs();
	
	//按id查询菜品
	public Dishs getDishByDishId(int dishId);

	//增加新菜品
	public void insertDishs(String name,String category,String icon,float price,String introduction,int recom);
	
	//下架菜品
	public void removeDishs(int dish_id);
	
	//重新上架某菜品
	public void restoreDishs(int dish_id);

	// 修改菜品
	int updateDishs(Map map);
	
}
