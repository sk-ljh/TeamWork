package com.wenlong.controller;

import java.util.List;

import javax.management.loading.PrivateClassLoader;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.our.pojo.Order_list;
import com.wenlong.service.OrderListWenlongService;

@Controller
@RequestMapping("/") 
public class OrderListWenlongController {
	@Autowired 
	private OrderListWenlongService orderListWenlongService;
	
	@RequestMapping("/chefHomepage")
	public String orderList(HttpSession session,HttpServletRequest request){
		System.out.println("hi");
		List<Order_list> order_list=orderListWenlongService.listOrderList();
		session.setAttribute("order_list", order_list);
		return "chefHomepage";
	}
	
}


