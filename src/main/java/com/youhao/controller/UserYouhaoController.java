package com.youhao.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.our.pojo.User;
import com.our.pojo.User_details;
import com.youhao.service.UserYouhaoService;

@Controller
@RequestMapping("/user")
public class UserYouhaoController {
	
	@Autowired
	UserYouhaoService userService;
	
	/*0、测试*/
	@RequestMapping("/test")
	public String index(HttpSession session) {
		
		List<User_details> userDetailsList =  userService.getUserDetailsList();
		
		for (User_details user_details : userDetailsList) {
			System.out.println(user_details);
		}
		session.setAttribute("userDetailsList", userDetailsList);
		
		return "userList";
	}
	/*1、得到user详情列表*/
	@RequestMapping("/getUserList")
	public String getUserList(HttpSession session) {

		List<User_details> userDetailsList =  userService.getUserDetailsList();

		session.setAttribute("userDetailsList", userDetailsList);

		return "userList";
	}
	/*2、修改用户详情*/
	@RequestMapping("/alterUser")
	public String alterUser() {
		
		
		return null;
	}
	/*添加用户*/
	@RequestMapping("/insertUser")
	public String insertUser(HttpServletRequest request,HttpServletResponse response) {
		String userName = request.getParameter("username");
		String pwd =  request.getParameter("pwd");
		int role = Integer.parseInt(request.getParameter("identity"));
		
		System.out.println(userName);
		User user = userService.getUserByName(userName);
		/*判断是否重名*/
		if(user!=null) {
			return "insertUser";
		}else {
			
			int userId = userService.getMaxUserId()+1;
			
			/*user表*/
			HashMap<String,Object> hm1 = new HashMap<String,Object>();
			hm1.put("user_delete", 0);
			hm1.put("user_id", userId);
			hm1.put("user_name", userName);
			hm1.put("password", pwd);
			userService.insertUser(hm1);
			
			/*user_details表*/
			/*user_details_id,user_id,name,icon,role*/
			HashMap<String,Object> hm2 = new HashMap<String,Object>();
			hm2.put("user_details_id", 0);
			hm2.put("user_id", userId);
			hm2.put("name", userName);
			hm2.put("icon", "cdvdvsdv");
			hm2.put("role", role);
			userService.insertUserDetails(hm2);
			try {
				response.sendRedirect("/TeamWork/user/getUserList.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		/*
		 *	（1）、重名：返回错误信息
		 * 	（2）、不重名:直接插入新记录
		 * */
		
		
		/*userService.*/
		return null;
	}
	
}
