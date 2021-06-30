package com.wenlong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.our.pojo.Order_history;
import com.wenlong.dao.OrderHistoryWenlongDao;
import com.wenlong.service.OrderHistoryWenlongService;

@Service("OrderHistoryWenlongService")
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

	@Override
	public Integer getTableNumber(int order_id) {
		// TODO Auto-generated method stub
		return orderHistoryWenlongDao.getTableNumber(order_id);
	}

	@Override
	public void updatePaymentState(int order_id) {
		// TODO Auto-generated method stub
		orderHistoryWenlongDao.updatePaymentState(order_id);
	}

	@Override
	public Order_history getOrderHistory(int order_id) {
		// TODO Auto-generated method stub
		return orderHistoryWenlongDao.getOrderHistory(order_id);
	}

	@Override
	public Order_history getOrderHistoryAdmin(int order_id) {
		// TODO Auto-generated method stub
		return orderHistoryWenlongDao.getOrderHistoryAdmin(order_id);
	}

}
