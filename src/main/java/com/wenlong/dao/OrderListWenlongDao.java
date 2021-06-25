package com.wenlong.dao;

import java.util.List;

import com.our.pojo.Order_list;;

public interface OrderListWenlongDao {
	
	//查询订单详情
	List<Order_list> listOrderList();
	
	//查询单笔订单详情
	Order_list getOrderList(int order_list_id);
	
	//删除订单
	void deleteOrderList(int order_list_id);
	
	//更新订单状态
	void updateOrderList(Order_list order_list);
	
	//添加订单
	void insertOrderList(Order_list order_list);

}
