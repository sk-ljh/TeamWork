package com.sunke.dao;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.our.pojo.*;
import com.sunke.entity.Dish_DishDetail;
import com.sunke.entity.TableStatus;

public interface DishSunkeDao {
			public List<Dishs> listDishsAll(@Param("cateName")String cateName,@Param("pageStart") int PageStart,@Param("pageSize")int PageSize);
			public List<String> reCate();
			public int getDishCount(String dishCate);
			public List<String> rePlace();
			public List<Integer> reNum(@Param("placeName") String placeName);
			public List<TableStatus> reStatus();
			
			public void insertHistory(@Param("body") Order_history body);
			public void insertDishList(@Param("body") Order_list body);
			public String getOrderId(@Param("placeName") String placeName);
			public int getMaxId();
			public String getFinalCall();
			public void updateTableStatus(@Param("number") int number);
			public int getStatus(@Param("number") int number);
			public Dish_DishDetail getAllMes(@Param("id") int id);
			public List<Order_list> reReadyDish();
			public List<Dishs> getBestDish();
}