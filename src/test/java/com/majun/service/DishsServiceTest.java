package com.majun.service;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/application-*.xml")
public class DishsServiceTest {

	@Autowired
	private DishsMajunService dishsMajunService;

	@Test
	public void listDishs() {
		System.out.println(dishsMajunService.listDishs());
	}

	@Test
	public void updateDishs() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dishs_id", 99);
		map.put("dishs_name", "海天盛筵");
		map.put("dishs_icon", "www.999.888999.www");
		map.put("price", 777999);
		map.put("introduction", "好hao吃");
		int res = dishsMajunService.updateDishs(map);
		System.out.println(res);
	}
}
