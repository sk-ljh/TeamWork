package com.wenlong.dao;

import java.util.List;

import com.our.pojo.Order_list;;

public interface Order_listWenlongDAO {
	
	//查询订单详情
	Order_list getOrder_list(int order_list_id);
	
	//单笔订单查询
	List<Order_list> listOrder_list();
	
	//删除订单
	void deleteOrder_list(int order_list_id);
	
}
