package com.majun.dao;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.our.pojo.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/application-*.xml")

public class UserDAOTest {
	/**
	 * 自动装配待测试接口DAO
	 */
	@Autowired
	private UserMajunDAO userMajunDAO;

	// 查询个人用户信息
	@Test
	public void getUser() {
		String user_name = "name";
		User user = userMajunDAO.getUser(user_name);
		System.out.println(user);
	}

	// 确认个人用户信息
	@Test
	public void confirmUser() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_name", "name");
		map.put("password", "passrd");
		int res = userMajunDAO.confirmUser(map);
//		if (res == 1)
//			validUser = true;
		System.out.println("confirm" + res);
	}

	//修改个人用户信息
	@Test
	public void updateUser() {
		// confirmUser==true
		if (true) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user_name", "name");
			map.put("password", "passworddddd");
			int res = userMajunDAO.updateUser(map);
			System.out.println("update" + res);
		}
	}
}
