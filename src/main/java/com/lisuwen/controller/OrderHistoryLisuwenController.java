package com.lisuwen.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lisuwen.service.OrderHistoryLisuwenService;
import com.our.pojo.Order_history;

@Controller
@RequestMapping("/")
public class OrderHistoryLisuwenController {
	private static DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	@Autowired
	private OrderHistoryLisuwenService orderHistoryLisuwenService;

	@RequestMapping("/listOrderHistory")
	public String listOrderHistory(HttpSession session) {
		List<Order_history> list = orderHistoryLisuwenService.listOrderHistory();

//		for (Order_history orderHistory : list) {
//			System.out.println(orderHistory);
//		}
		session.setAttribute("listOrderHistory", list);
		return "operateOrderForm";
	}

	@RequestMapping("/updateOrderHistory")
	public String updateOrderHistory(HttpSession session, HttpServletRequest request) {
		System.out.println("update");
		int id = Integer.parseInt(request.getParameter("order_id"));
		int payment_state = Integer.parseInt(request.getParameter("payment_state"));
		String current = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		Timestamp end_time = Timestamp.valueOf(current);
		@SuppressWarnings("unchecked")
		List<Order_history> list = (List<Order_history>) session.getAttribute("listOrderHistory");
		Order_history temp = null;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getOrder_id() == id) {
				list.get(i).setEnd_time(end_time.toString().substring(0, 19));
				list.get(i).setPayment_state(payment_state);
				temp = list.get(i);
				list.remove(i);
				break;
			}
		}
		list.add(temp);
//		Iterator<Order_history> it = list.iterator();
//		while (it.hasNext()) {
//			Order_history x = it.next();
//			if (x.getOrder_id() == id) {
//				it.remove();
//			}
//		}
		System.out.println("newlist:" + list);
		session.setAttribute("listOrderHistory", list);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("order_id", id);
		map.put("payment_state", payment_state);
		map.put("end_time", end_time);
		orderHistoryLisuwenService.updateOrderHistory(map);
		return "operateOrderForm";
	}
}
