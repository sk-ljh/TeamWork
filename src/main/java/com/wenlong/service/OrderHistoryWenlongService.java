package com.wenlong.service;

import java.util.List;

import com.our.pojo.Order_history;

public interface OrderHistoryWenlongService {
		
		//查询历史订单
		List<Order_history> listOrderHistory();
		
		//添加历史订单
		void insertOrderHistory(Order_history order_history);
		
}
