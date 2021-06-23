package com.wenlong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wenlong.dao.OrderListWenlongDao;
import com.wenlong.service.OrderListWenlongService;
import com.our.pojo.*;


@Service("OrderListWenlongService")
public class OrderListWenlongServiceImpl implements OrderListWenlongService{
	
	@Autowired 
	private OrderListWenlongDao orderListWenlongDao;
	
	@Override
	public List<Order_list> listOrderList() {
		// TODO Auto-generated method stub
		return orderListWenlongDao.listOrderList();
	}
	
	@Override
	public Order_list getOrderList(int order_list_id) {
		// TODO Auto-generated method stub
		return orderListWenlongDao.getOrderList(order_list_id);
	}

	@Override
	public void deleteOrderList(int order_list_id) {
		// TODO Auto-generated method stub
		orderListWenlongDao.deleteOrderList(order_list_id);
	}

}
