package com.majun.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.our.pojo.Dishs_detail;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/application-*.xml")
public class Dishs_detailDAOTest {

	/**
	 * 自动装配待测试接口DAO
	 */
	@Autowired
	private Dishs_detailMajunDAO dishs_detailMajunDAO;

	// 查询菜品详情
	@Test
	public void ListDishs_detail() {
		List<Dishs_detail> listDishs = dishs_detailMajunDAO.ListDishs_detail();
		for (Dishs_detail dish : listDishs) {
			System.out.println(dish);
		}
	}

	// 修改菜品详情
	@Test
	public void UpdateDishs() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dishs_id", 99);
		map.put("introduce_detail", "海盛筵盛筵天海天盛筵盛筵");
		int res = dishs_detailMajunDAO.UpdateDishs_detail(map);
		System.out.println(res);
	}

}
