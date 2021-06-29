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
import org.springframework.web.bind.annotation.RequestParam;

import com.lisuwen.service.OrderHistoryLisuwenService;
import com.our.pojo.Order_history;

@Controller
@RequestMapping("/")
public class OrderHistoryLisuwenController {
	private static DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	@Autowired
	private OrderHistoryLisuwenService orderHistoryLisuwenService;

	@RequestMapping("/listOrderHistory")
	public String listOrderHistory(HttpSession session,
			@RequestParam(value = "currentDish_Page", defaultValue = "1") String currentDish_Page) {
		List<Order_history> list = orderHistoryLisuwenService.listOrderHistory();
		session.setAttribute("DishQueriedNumber", list.size());// 保存记录数
		session.setAttribute("currentDish_Page", currentDish_Page);// 保存当前页数到session里
		if (list.size() > 4)
			if ((Integer.valueOf(currentDish_Page) - 1) * 4 + 4 <= list.size())
				list = list.subList((Integer.valueOf(currentDish_Page) - 1) * 4,
						(Integer.valueOf(currentDish_Page) - 1) * 4 + 4);
			else
				list = list.subList((Integer.valueOf(currentDish_Page) - 1) * 4, list.size());
		session.setAttribute("listOrderHistory", list);
		return "operateOrderForm";
	}

	@RequestMapping("/updateOrderHistory")
	public String updateOrderHistory(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "currentDish_Page", defaultValue = "1") String currentDish_Page) {
		System.out.println("update");
		int id = Integer.parseInt(request.getParameter("order_id"));
		int payment_state = Integer.parseInt(request.getParameter("payment_state"));
		String current = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		Timestamp end_time = Timestamp.valueOf(current);
		List<Order_history> list = orderHistoryLisuwenService.listOrderHistory();
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
		System.out.println("newlist:" + list);
//		session.setAttribute("DishQueriedNumber", list.size());// 保存记录数
//		session.setAttribute("currentDish_Page", currentDish_Page);// 保存当前页数到session里
		if (list.size() > 4)
			if ((Integer.valueOf(currentDish_Page) - 1) * 4 + 4 <= list.size())
				list = list.subList((Integer.valueOf(currentDish_Page) - 1) * 4,
						(Integer.valueOf(currentDish_Page) - 1) * 4 + 4);
			else
				list = list.subList((Integer.valueOf(currentDish_Page) - 1) * 4, list.size());
		session.setAttribute("listOrderHistory", list);
		orderHistoryLisuwenService.updateCookState(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("order_id", id);
		map.put("payment_state", payment_state);
		map.put("end_time", end_time);
		orderHistoryLisuwenService.updateOrderHistory(map);
		// 修改桌号
		orderHistoryLisuwenService.updateTableNum(id);
		return "operateOrderForm";
	}
}
