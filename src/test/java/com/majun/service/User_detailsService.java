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
public class User_detailsService {
	@Autowired

	private User_detailsMajunService user_detailsMajunService;

	@Test
	public void getUser() {
		String name = "name";
		System.out.println(user_detailsMajunService.getUser_details(name));
	}

	@Test
	public void updateUser() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "name");
		map.put("icon", "www.pass.co");
		int res = user_detailsMajunService.updateUser_details(map);
		System.out.println("update" + res);
	}
}
