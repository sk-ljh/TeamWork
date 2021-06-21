package com.wenlong.dao;

import java.util.List;

import com.our.pojo.Order_history;;

public interface Order_historyWenlongDAO {
	
	//查询订单详情
	List<Order_history> listOrder_history();
	
	//添加历史订单
	void insertOrder_history(Order_history order_history);
	
}
