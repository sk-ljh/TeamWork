package com.lisuwen.dao;

import java.util.List;
import java.util.Map;

import com.our.pojo.Order_history;

public interface OrderHistoryLisuwenDao {
	List<Order_history> listOrderHistory();
	
	List<Order_history> listOrderByKey(String key);

	int updateOrderHistory(Map map);
	
	int updateCookState(int id);

	int updateTableNum(int id);
	
}
