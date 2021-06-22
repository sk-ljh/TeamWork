package com.youhao.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.our.pojo.User_details;
import com.youhao.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/test")
	public String index(HttpSession session) {
		/*System.out.println("userdsdada index...");*/
		
		List<User_details> userDetailsList =  userService.getUserDetailsList();
		
		for (User_details user_details : userDetailsList) {
			System.out.println(user_details);
		}
		session.setAttribute("userDetailsList", userDetailsList);
		
		return "do1";
	}



}
