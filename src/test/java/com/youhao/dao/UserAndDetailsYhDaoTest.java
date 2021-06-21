package com.youhao.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.our.pojo.User_details;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:config/application-*.xml")
public class UserAndDetailsYhDaoTest {

	/**
	 * 自动装配待测试接口DAO
	 */
	@Autowired
	private UserAndDetailsYhDao uADDao;
	@Test
	public void getUserDetailsList() {
		List<User_details> userDetailsList = uADDao.getUserDetailsList();
		
		for (User_details user_details : userDetailsList) {
			System.out.println(user_details);
		}
		
	}

}
