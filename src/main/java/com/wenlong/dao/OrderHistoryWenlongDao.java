package com.wenlong.dao;

import java.util.List;

import com.our.pojo.Order_history;;

public interface OrderHistoryWenlongDao {
	
	//查询历史订单
	List<Order_history> listOrderHistory();
	
	//查询历史订单
	Order_history getOrderHistoryAdmin(int order_id);
	
	//单笔订单查询
	Order_history getOrderHistory(int order_id);
	
	//添加历史订单
	void insertOrderHistory(Order_history order_history);
	
	//查询订单桌号
	int getTableNumber(int order_id);
	
	//修改订单状态
	void updatePaymentState(int order_id);
	
}
