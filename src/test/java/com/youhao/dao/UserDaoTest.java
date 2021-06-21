package com.youhao.dao;

import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.our.pojo.User;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:config/application-*.xml")
public class UserDaoTest {
	
	/**
	 * 自动装配待测试接口DAO
	 */
	@Autowired
	private UserYouhaoDao userYouhaoDao;
	@Test
	public void getUserList(){
		
		List<User> userList = userYouhaoDao.getUserList();
		
		for (User user : userList) {
			System.out.println(user);
		}
		
	}
}
