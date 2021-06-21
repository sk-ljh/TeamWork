package com.majun.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.our.pojo.Dishs;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/application-*.xml")

public class DishsDAOTest {
	/**
	 * 自动装配待测试接口DAO
	 */
	@Autowired
	private DishsMajunDAO dishsMajunDAO;

	// 查询菜品
	@Test
	public void ListDishs() {
		List<Dishs> ListDishs = dishsMajunDAO.ListDishs();
		for (Dishs dish : ListDishs) {
			System.out.println(dish);
		}
	}

	// 修改菜品
	@Test
	public void UpdateDishs() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dishs_id", 99);
		map.put("dishs_name", "海天盛筵");
		map.put("dishs_icon", "www.999.999.www");
		map.put("price", 999);
		map.put("introduction", "好hao吃");
		int res = dishsMajunDAO.UpdateDishs(map);
		System.out.println(res);
	}
}
