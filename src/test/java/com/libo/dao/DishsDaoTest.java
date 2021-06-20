package com.libo.dao;

import java.util.List;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.our.pojo.Dishs;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:config/application-*.xml")
public class DishsDaoTest {
	@Autowired
	private DishsDao dishsDao;
	@Test
	public void test() {
		List<Dishs> allDish=dishsDao.getallDishs();
		for(Dishs dishs:allDish)
		{
			System.out.println(dishs);
		}
	}
	
}
