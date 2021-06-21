package com.majun.service;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/application-*.xml")
public class Dishs_detailServiceTest {
	@Autowired
	private Dishs_detailMajunService dishs_detailMajunService;

	@Test
	public void listDishs_detail() {
		System.out.println(dishs_detailMajunService.listDishs_detail());
	}

	@Test
	public void updateDishs_detail() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dishs_id", 99);
		map.put("introduce_detail", "海海天盛筵盛筵");
		int res = dishs_detailMajunService.updateDishs_detail(map);
		System.out.println(res);
	}
}
