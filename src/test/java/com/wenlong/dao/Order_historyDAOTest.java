package com.wenlong.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.our.pojo.Order_history;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/application-*.xml")
public class Order_historyDAOTest {

	/**
	 * 自动装配待测试接口DAO
	 */
	@Autowired
	private Order_historyWenlongDAO order_historyWenlongDAO;

	// 查询历史订单
	@Test
	public void listOrder_list() {
		List<Order_history> listOrder_history = order_historyWenlongDAO.listOrder_history();
		for (Order_history order_history : listOrder_history) {
			System.out.println(order_history);
		}
	}
	
	// 添加历史订单
	@Test
	public void insertOrder_history() {
		Order_history order_history = new Order_history(6,
														666, 
														"2021-6-21 16:27:00", 
														"2021-6-21 16:36:00",
														0,
														6666,
														7,
														0);
		order_historyWenlongDAO.insertOrder_history(order_history);
		System.out.println(order_history.toString());
	}
	
}
