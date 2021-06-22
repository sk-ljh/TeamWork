package com.libo.service;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.our.pojo.User;
import com.our.pojo.User_details;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:config/application-*.xml")
public class UserLiboServiceTest {
	@Autowired
	private UserLiboService userLiboService;
	@Test
	public void testLogin(){
		User user=userLiboService.getUser(new User(0,0,"libo","11803990220"));
		System.out.println(user);
	}
	@Test
	public void testgetDetails(){
		User_details user=userLiboService.getUserDetails(1);
		System.out.println(user);
	}
}
