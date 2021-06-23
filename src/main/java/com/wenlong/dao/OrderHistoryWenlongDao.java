package com.wenlong.dao;

import java.util.List;

import com.our.pojo.Order_history;;

public interface OrderHistoryWenlongDao {
	
	//查询历史订单
	List<Order_history> listOrderHistory();
	
	//添加历史订单
	void insertOrderHistory(Order_history order_history);
	
}
