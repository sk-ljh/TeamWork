package com.wenlong.dao;

import java.util.List;

import com.our.pojo.Order_list;;

public interface OrderListWenlongDao {
	
	//查询订单详情
	List<Order_list> listOrderList();
	
	//单笔订单查询
	Order_list getOrderList(int order_list_id);
	
	//删除订单
	void deleteOrderList(int order_list_id);
	
}
