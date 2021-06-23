package com.sunke.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.our.pojo.*;

public interface DishSunkeDao {
			public List<Dishs> listDishsAll(@Param("cateName")String cateName,@Param("pageStart") int PageStart,@Param("pageSize")int PageSize);
			public List<String> reCate();
			public int getDishCount(String dishCate);
}
