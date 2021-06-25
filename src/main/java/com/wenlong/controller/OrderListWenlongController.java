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

import com.our.pojo.Dishs;
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
	
	@RequestMapping("/deleteOrder")
	public String deleteOrder(HttpSession session,@RequestParam("order_list_id")String order_list_id) {
		int id = Integer.parseInt(order_list_id);
		Order_list order_list = orderListWenlongService.getOrderList(id);
		order_list.setCook_state(3);
		//session.setAttribute(order_list_id, order_list);
		orderListWenlongService.updateOrderList(order_list);
		//orderListWenlongService.deleteOrderList(id);
		session.setAttribute("is_update", true);
		return "chefHomepage";
	}
	
	@RequestMapping("/updateOrder")
	public String updateOrder(HttpSession session,@RequestParam("order_list_id")String order_list_id) {
		int id = Integer.parseInt(order_list_id);
		Order_list order_list = orderListWenlongService.getOrderList(id);
		order_list.setCook_state(2);
		orderListWenlongService.updateOrderList(order_list);
		session.setAttribute("is_update", true);
		return "chefHomepage";
	}
	
	//随机添加订单
	@RequestMapping("/insertOrder")
	public String insertOrder(HttpSession session) {
		List<Dishs> dishsList=dishsWenlongService.listDishs();
		for(int i=59; i<109; i++) {
			Random random = new Random();
			int dishs_id=random.nextInt(dishsList.size())+1;
			Dishs dishs=dishsList.get(dishs_id);
			String dishs_name=dishs.getDishs_name();
			int number=random.nextInt(10)+1;
			float price = number * dishs.getPrice();
			int order_id = random.nextInt(2)+1;
			int cook_state = random.nextInt(2)+1;
			Order_list order_list = new Order_list(dishs_id, dishs_name, number, price, cook_state, order_id, i);
			orderListWenlongService.insertOrderList(order_list);
		}
		session.setAttribute("is_update", true);
		return "chefHomepage";
	}
	
}


