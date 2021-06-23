package com.wenlong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.our.pojo.Order_history;
import com.wenlong.dao.OrderHistoryWenlongDao;
import com.wenlong.service.OrderHistoryWenlongService;

public class OrderHistoryWenlongServiceImpl implements OrderHistoryWenlongService{

	@Autowired OrderHistoryWenlongDao orderHistoryWenlongDao;
	
	@Override
	public List<Order_history> listOrderHistory() {
		// TODO Auto-generated method stub
		return orderHistoryWenlongDao.listOrderHistory();
	}

	@Override
	public void insertOrderHistory(Order_history order_history) {
		// TODO Auto-generated method stub
		orderHistoryWenlongDao.insertOrderHistory(order_history);
	}

}