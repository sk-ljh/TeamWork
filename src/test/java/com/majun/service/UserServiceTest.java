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
public class UserServiceTest {

	@Autowired
	private UserMajunService userMajunService;

	@Test
	public void getUser() {
		String user_name = "name";
		System.out.println(userMajunService.getUser(user_name));
	}

	@Test
	public void confirmUser() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_name", "name");
		map.put("password", "passrd");
		int res = userMajunService.confirmUser(map);
		System.out.println("confirm" + res);
	}

	@Test
	public void updateUser() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_name", "name");
		map.put("password", "pass");
		int res = userMajunService.updateUser(map);
		System.out.println("update" + res);
	}
}
