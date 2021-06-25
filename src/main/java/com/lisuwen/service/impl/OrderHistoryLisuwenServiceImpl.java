package com.lisuwen.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lisuwen.dao.OrderHistoryLisuwenDao;
import com.lisuwen.service.OrderHistoryLisuwenService;
import com.our.pojo.Order_history;

@Service
public class OrderHistoryLisuwenServiceImpl implements OrderHistoryLisuwenService {
	@Autowired
	private OrderHistoryLisuwenDao orderHistoryLisuwenDao;

	@Override
	public List<Order_history> listOrderHistory() {
		// TODO 自动生成的方法存根
		return orderHistoryLisuwenDao.listOrderHistory();
	}

	@Override
	public int updateOrderHistory(Map map) {
		// TODO 自动生成的方法存根
		return orderHistoryLisuwenDao.updateOrderHistory(map);
	}

}
