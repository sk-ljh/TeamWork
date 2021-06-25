package com.lisuwen.dao;

import java.util.List;
import java.util.Map;

import com.our.pojo.Order_history;

public interface OrderHistoryLisuwenDao {
	List<Order_history> listOrderHistory();

	int updateOrderHistory(Map map);

}
