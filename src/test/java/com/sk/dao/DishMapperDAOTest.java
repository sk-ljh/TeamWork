package com.sk.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.our.pojo.Dishs;
import com.sunke.DAO.DishMapperDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= "classpath:config/application-*.xml")
public class DishMapperDAOTest {
	@Autowired
	private DishMapperDAO dishMapperDAO;
	@Test
	public void testListDepartmentInfo(){
		List<Dishs> depts = dishMapperDAO.ListDishsAll();
		for(Dishs dept : depts){
			System.out.println(dept);
		}
	}
	

}
