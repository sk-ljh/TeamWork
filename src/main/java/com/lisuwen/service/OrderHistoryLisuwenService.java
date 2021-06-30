package com.lisuwen.service;

import java.util.List;
import java.util.Map;

import com.our.pojo.Order_history;

public interface OrderHistoryLisuwenService {
	List<Order_history> listOrderHistory();
	
	List<Order_history> listOrderByKey(String key);

	int updateOrderHistory(Map map);
	
	int updateCookState(int id);
	
	int updateTableNum(int id);
}
