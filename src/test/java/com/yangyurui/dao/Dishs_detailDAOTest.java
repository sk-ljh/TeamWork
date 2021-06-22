package com.yangyurui.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.our.pojo.Dishs_detail;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/application-*.xml")
public class Dishs_detailDAOTest {
	@Autowired
	private Dishs_detailYangyuruiDAO dish_detailDAO;
	
	//查询菜品详情
	@Test
	public void getDishDetail() {
		int dish_id=3;//菜品的dishs_id
		Dishs_detail dish_detail = dish_detailDAO.getDishDetail(dish_id);
		System.out.println(dish_detail);
	}
	
	//添加菜品详情
	//@Test
	public void insertDish_detail() {
		Dishs_detail dish_detail=new Dishs_detail(100,100,"必胜客","300g的芝士焗玉米，又甜又咸的烤芝士搭配香甜玉米","300g","甜咸");
		int res=dish_detailDAO.insertDishs_detail(dish_detail);
		System.out.println(res);
	}
}
