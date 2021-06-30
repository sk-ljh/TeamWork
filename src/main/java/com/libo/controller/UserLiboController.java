package com.libo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
	@RequestMapping("/dologin")
	public Object Login(@RequestBody User user,HttpSession session,HttpServletRequest request){
		System.out.println(user);
		int role=user.getUser_id();
		
		Map<String,Object> hashmap=new HashMap<String,Object>();
		if(userLiboService.getUserFromName(user.getUser_name())==null)
		{
			hashmap.put("Message", "用户不存在");
			return hashmap;
		}
		User loginUser = userLiboService.getUser(user);
		if(loginUser != null){
			User_details details=userLiboService.getUserDetails(loginUser.getUser_id());
			if(role==details.getRole())
			{	
				//存储用户信息表
				session.setAttribute("loginUser", loginUser);
				//存储用户详细信息表
				session.setAttribute("Userdetails", details);
				hashmap.put("id",loginUser.getUser_name());
				if(details.getRole()==1)
					hashmap.put("role", 1);
				else if(details.getRole()==2)
					hashmap.put("role", 2);
				else if(details.getRole()==3)
					hashmap.put("role", 3);
			}
			else
				hashmap.put("Message", "该用户存在,但用户角色选择错误");
		}
		else
			hashmap.put("Message", "用户密码错误");
		return hashmap; 
	}
	
	@ResponseBody
	@RequestMapping("/checkuser")
	public Object checkUser(@RequestBody User user,HttpSession session,HttpServletRequest request) {
		System.out.println(user);
		User checkUser=userLiboService.getUser(user);
		Map<String,String> hashmap=new HashMap<String,String>();
		if(checkUser==null)
		{
			hashmap.put("Message", "用户不存在");
		}
		else
			hashmap.put("Message", "用户存在");
		return hashmap;
	}
}
