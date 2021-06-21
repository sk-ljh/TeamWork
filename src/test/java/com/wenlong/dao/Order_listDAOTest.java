package com.wenlong.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.our.pojo.Order_list;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/application-*.xml")
public class Order_listDAOTest {

	/**
	 * 自动装配待测试接口DAO
	 */
	@Autowired
	private Order_listWenlongDAO order_listWenlongDAO;

	// 查询订单详情
	@Test
	public void listOrder_list() {
		List<Order_list> listOrder = order_listWenlongDAO.listOrder_list();
		for (Order_list order : listOrder) {
			System.out.println(order);
		}
	}
	
	// 单笔订单查询
	@Test
	public void getOrder_list() {
		Order_list order = order_listWenlongDAO.getOrder_list(2);
			System.out.println(order);

	}
	
	// 删除订单
	@Test
	public void deleteOrder_list() {
		Order_list order = order_listWenlongDAO.getOrder_list(3);
		order_listWenlongDAO.deleteOrder_list(3);
			System.out.println(order);
	}

}
