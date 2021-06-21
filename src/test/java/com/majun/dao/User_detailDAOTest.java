package com.majun.dao;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.our.pojo.User_details;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/application-*.xml")
public class User_detailDAOTest {
	/**
	 * 自动装配待测试接口DAO
	 */
	@Autowired
	private User_detailsMajunDAO user_detailsMajunDAO;

	// 查询个人用户详细信息
	@Test
	public void getUser_details() {

		String name = "name";
		User_details getUser = user_detailsMajunDAO.getUser_details(name);
		System.out.println(getUser);
	}

	// 修改个人用户详细信息
	@Test
	public void updateUser() {
		// confirmUser==true
		if (true) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("name", "name");
			map.put("icon", "www.iconon.com");
			int res = user_detailsMajunDAO.updateUser_details(map);
			System.out.println(res);
		}
	}
}
