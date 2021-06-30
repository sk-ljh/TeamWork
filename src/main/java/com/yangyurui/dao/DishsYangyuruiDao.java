package com.yangyurui.dao;

import java.util.List;
import java.util.Map;

import com.our.pojo.Dishs;


public interface DishsYangyuruiDao {
	//查询当前菜品数量
	int getCurrentDishNumber();
	
	//查询全部菜品
	List<Dishs> listDishs();
	
	//根据关键字查询菜品
	List<Dishs> listDishsByKey(String key);
	
	//根据菜类查询菜品
	List<Dishs> listDishsByCategory(String category);
	
	//查询非招牌菜类的菜
	List<Dishs> listOtherDishs();
	
	//按id查询菜品
	List<Dishs> getDishByDishId(int dishId);
	
	//增加新菜品
	int insertDishs(Dishs dish);
	
	//删除菜品（使菜品下架）
	int removeDishs(int dish_id);
	
	//重新上架菜品
	int restoreDishs(int dish_id);

	// 修改菜品
	int updateDishs(Map map);
}
