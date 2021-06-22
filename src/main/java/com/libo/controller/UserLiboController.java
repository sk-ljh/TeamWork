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
	
	@RequestMapping("/dologin")
	public String Login(User user,HttpSession session,HttpServletRequest request){           
		User loginUser = userLiboService.getUser(user);
		if(loginUser != null){
			session.setAttribute("loginUser", loginUser);
			User_details details=userLiboService.getUserDetails(loginUser.getUser_id());
			if(details.getRole()==1)
				return "waiterHomepage";
			else if(details.getRole()==2)
				return "chefHomepage";
			else if(details.getRole()==3)
				return "adminHomepage";
			else
				return "login";
		}
		return "login"; 
	}
}
