package com.yangyurui.dao;

import org.junit.Test;
import org.junit.runner.RunWith;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.our.pojo.Dishs;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/application-*.xml")
public class DishsDAOTest {
	@Autowired
	private DishsYangyuruiDAO dishDAO;
	
	//查询所有菜品
	//@Test
	public void listDishs() {
		List<Dishs> dishs=dishDAO.listDishs();
		for(Dishs dish:dishs) {
			System.out.println(dish);
		}
	}
	
	//按关键字查询菜品
	//@Test
	public void listDishsByKey() {
		String key="微辣";
		key="%"+key+"%"; //在关键字前后添加'%'来进行模糊查询
		List<Dishs> dishs=dishDAO.listDishsByKey(key);
		for(Dishs dish:dishs) {
			System.out.println(dish);
		}
	}
	
	//按菜类查询菜品
	//@Test
	public void listDishsByCategory() {
		String category1="美味焖锅",category2="热乎炒菜",category3="经典水煮",category4="湘菜系谱";
		List<Dishs> dishs=dishDAO.listDishsByCategory(category2);
		for(Dishs dish:dishs) {
			System.out.println(dish);
		}
	}
	
	//增加新菜品
	@Test
	public void insertDishs() {
		Dishs newDish=new Dishs(0,100,"芝士焗玉米","其它",
				"http://picn58.huitu.com/pic/20160505/20160505231925005903_0.jpg",(float) 16.5,"香浓芝士配上进口香甜玉米",1);
		int res=dishDAO.insertDishs(newDish);
		System.out.println(res);

	}
	
	//下架菜品
	//@Test
	public void removeDishs() {
		int dish_id=5;
		int res=dishDAO.removeDishs(dish_id);
		System.out.println(res);
	}
	
	//重新上架某菜品
	//@Test
	public void restoreDishs() {
		int dish_id=5;
		int res=dishDAO.restoreDishs(dish_id);
		System.out.println(res);
	}
}
