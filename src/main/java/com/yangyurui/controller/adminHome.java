package com.yangyurui.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lisuwen.service.impl.OrderHistoryLisuwenServiceImpl;
import com.our.pojo.*;
import com.yangyurui.service.impl.DishsDetailYangyuruiServiceImpl;
import com.yangyurui.service.impl.DishsYangyuruiServiceImpl;
import com.youhao.service.impl.UserYouhaoServicelmpl;

@Controller
@RequestMapping("/adminHome")
public class adminHome {
	@Autowired
	private DishsYangyuruiServiceImpl dishService;
	
	@Autowired
	private OrderHistoryLisuwenServiceImpl orderHistoryService;
	
	@Autowired
	private UserYouhaoServicelmpl userDetailsService;
	
	@RequestMapping("/getParts")
	public String dishAdminList(HttpSession session) {
		List<User_details> userDetails;
		List<Dishs> dishs;
		List<Order_history> orderHistories;
		dishs=dishService.listDishs();
		userDetails=userDetailsService.getUserDetailsList();
		orderHistories=orderHistoryService.listOrderHistory();
		//从各个List中截取一部分
		dishs=dishs.size()>10?dishs.subList(0, 10):dishs;
		userDetails=userDetails.size()>12?userDetails.subList(0, 10):userDetails;
		orderHistories=orderHistories.size()>12?orderHistories.subList(0, 10):orderHistories;
		
		session.setAttribute("dishs_Pa",dishs);
		session.setAttribute("userDetails_Pa",userDetails);
		session.setAttribute("orderHistories_Pa",orderHistories);
		
		return "adminHomepage";
	}
}
