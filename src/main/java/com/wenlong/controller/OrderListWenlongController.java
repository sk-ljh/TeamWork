package com.wenlong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.libo.service.UserLiboService;
import com.our.pojo.Dishs;
import com.our.pojo.Order_history;
import com.our.pojo.Order_list;
import com.wenlong.service.DishsWenlongService;
import com.wenlong.service.OrderHistoryWenlongService;
import com.wenlong.service.OrderListWenlongService;

@Controller
@RequestMapping("/") 
public class OrderListWenlongController {
	@Autowired 
	private OrderListWenlongService orderListWenlongService;
	
	@Autowired 
	private OrderHistoryWenlongService orderHistoryWenlongService;
	
	@Autowired
	private DishsWenlongService dishsWenlongService;
	
	@Autowired
	private UserLiboService userLiboService;
	
	//后厨主页
	@RequestMapping("/chefHomepage")
	public String orderList(HttpSession session,HttpServletRequest request){
		List<Order_list> order_list=orderListWenlongService.listOrderList();
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		for(Order_list order:order_list) {
			map.put(order.getOrder_id(), orderHistoryWenlongService.getTableNumber(order.getOrder_id()));
		}
		session.setAttribute("order_list", order_list);
		session.setAttribute("table_number_map", map);
		session.setAttribute("is_update", false);
		return "chefHomepage";
	}
	
	//修改烹饪状态
	@RequestMapping("/updateOrder")
	public String updateOrder(HttpSession session,@RequestParam("order_list_id")String order_list_id) {
		int id = Integer.parseInt(order_list_id);
		Order_list order_list = orderListWenlongService.getOrderList(id);
		order_list.setCook_state(order_list.getCook_state()+1);
		orderListWenlongService.updateOrderList(order_list);
		session.setAttribute("is_update", true);
		return "chefHomepage";
	}
	
	//随机添加订单
	@RequestMapping("/insertOrder")
	public String insertOrder(HttpSession session) {
		List<Dishs> dishsList=dishsWenlongService.listDishs();
		for(int i=1; i<30; i++) {
			Random random = new Random();
			int dishs_id=random.nextInt(dishsList.size())+1;
			Dishs dishs=dishsList.get(dishs_id);
			String dishs_name=dishs.getDishs_name();
			int number=random.nextInt(10)+1;
			float price = number * dishs.getPrice();
			int order_id = random.nextInt(5)+1;
			int cook_state = random.nextInt(2)+1;
			Order_list order_list = new Order_list(dishs_id, dishs_name, number, price, cook_state, order_id, i);
			System.out.println(order_list.toString());
			orderListWenlongService.insertOrderList(order_list);
		}
		session.setAttribute("is_update", false);
		return "chefHomepage";
	}
	
	@RequestMapping("/orderHistory")
	public String orderHistory(HttpSession session,HttpServletRequest request) {
		List<Order_history> order_history = orderHistoryWenlongService.listOrderHistory();
		Map<Integer, String> user_idToName = new HashMap<Integer, String>();
		for(Order_history order:order_history) {
			user_idToName.put(order.getUser_id(), userLiboService.getUserDetails(order.getUser_id()).getName());
		}
		session.setAttribute("user_idToName", user_idToName);
		session.setAttribute("order_history", order_history);
		session.setAttribute("is_update", false);
		return "orderFormList";
	}
	
	@RequestMapping("/changePaymentState")
	public String change(HttpSession session,HttpServletRequest request, @RequestParam("order_id")String order_id) {
		int id = Integer.parseInt(order_id);
		orderHistoryWenlongService.updatePaymentState(id);
		session.setAttribute("is_update", true);
		return "orderFormList";
	}
	
	@RequestMapping("/getOrderDetail")
	public String getOrderDetail(HttpSession session,HttpServletRequest request, @RequestParam("order_id")String order_id) {
		int id = Integer.parseInt(order_id);
		List<Order_list> listOrderList = orderListWenlongService.listOrderListByOrderId(id);
		Order_history order_history = orderHistoryWenlongService.getOrderHistory(id);
		String user_name=userLiboService.getUserDetails(order_history.getUser_id()).getName();
		request.setAttribute("user_name", user_name);
		request.setAttribute("table_number", order_history.getTable_number());
		request.setAttribute("order_id", order_id);
		session.setAttribute("listOrder_list", listOrderList);
		return "orderDetail";
	}
	
	@RequestMapping("/getOrderDetailAdmin")
	public String getOrderDetailAdmin(HttpSession session,HttpServletRequest request, @RequestParam("order_id")String order_id) {
		int id = Integer.parseInt(order_id);
		List<Order_list> listOrderList = orderListWenlongService.listOrderListByOrderId(id);
		Order_history order_history = orderHistoryWenlongService.getOrderHistoryAdmin(id);
		String user_name=userLiboService.getUserDetails (order_history.getUser_id()).getName();
		request.setAttribute("user_name", user_name);
		request.setAttribute("table_number", order_history.getTable_number());
		request.setAttribute("order_id", order_id);
		session.setAttribute("listOrder_list", listOrderList);
		return "orderDetail";
	}
	
}


