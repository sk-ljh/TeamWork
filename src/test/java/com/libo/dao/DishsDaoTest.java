package com.libo.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.our.pojo.Dishs;
import com.our.pojo.User;
import com.our.pojo.User_details;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:config/application-*.xml")
public class DishsDaoTest {
	@Autowired
	private DishsDao dishsDao;
	@Autowired
	private UserLiboDao userLiboDao;
	@Autowired
	private UserDetailsLiboDao userDetailsLiboDao;
//	@Test
	public void test() {
		List<Dishs> allDish=dishsDao.getallDishs();
		for(Dishs dishs:allDish)
		{
			System.out.println(dishs);
		}
	}
//	@Test
	public void test2() {
		User getUser=userLiboDao.getUser(new User(0,0,"libo","11803990220"));
		System.out.print(getUser);
	}
	@Test
	public void test3() {
		User_details details=userDetailsLiboDao.getUser_details(1);
		System.out.print(details);
	}
}
