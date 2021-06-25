package com.lisuwen.service;

import java.util.List;
import java.util.Map;

import com.our.pojo.Order_history;

public interface OrderHistoryLisuwenService {
	List<Order_history> listOrderHistory();

	int updateOrderHistory(Map map);
}
