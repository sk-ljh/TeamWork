package com.libo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.libo.service.UserLiboService;
import com.our.pojo.User;
import com.our.pojo.User_details;

@Controller
@RequestMapping("/") 
public class UserLiboController {
	@Autowired
	private UserLiboService userLiboService;
	
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	//用户登录
	@RequestMapping("/dologin")
	public String Login(User user,HttpSession session,HttpServletRequest request){
		System.out.println(user);
		int role=user.getUser_id();
		User loginUser = userLiboService.getUser(user);
		if(loginUser != null){
			User_details details=userLiboService.getUserDetails(loginUser.getUser_id());
			if(role==details.getRole())
			{	
				//存储用户信息表
				session.setAttribute("loginUser", loginUser);
				//存储用户详细信息表
				session.setAttribute("Userdetails", details);
				if(details.getRole()==1)
					return "waiterHomePage";
				else if(details.getRole()==2)
					return "chefHomepage";
				else if(details.getRole()==3)
					return "adminHomepage";
				else
					return "login";
			}
			else
				return "login";
		}
		return "login"; 
	}
}
