package com.sk.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.our.pojo.Dishs;
import com.sunke.DAO.DishMapperDAO;
import com.sunke.service.DishService;
import com.sunke.service.imp.DishServiceImp;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= "classpath:config/application-*.xml")
public class DishServiceTest {
	@Autowired
	private DishServiceImp dishService;
	@Test
	public void testGetAllDish(){
		List<Dishs> di=dishService.getAllDish()	;
		for (Dishs d:di) {
			System.out.println(d);
		}
		
		
	}
	

}
