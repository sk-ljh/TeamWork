package com.youhao.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.our.pojo.User;
import com.our.pojo.User_details;
import com.youhao.service.UserYouhaoService;

@Controller
@RequestMapping("/user")
public class UserYouhaoController {

	@Autowired
	UserYouhaoService userService;

	/* 0、测试 */
	@RequestMapping("/dologin")
	public String index(HttpSession session) {

		/*
		 * List<User_details> userDetailsList = userService.getUserDetailsList();
		 * 
		 * for (User_details user_details : userDetailsList) {
		 * System.out.println(user_details); } session.setAttribute("userDetailsList",
		 * userDetailsList);
		 */

		return "login";
	}

	/* 1、得到user详情列表 */
	@RequestMapping("/getUserList")
	public String getUserList(HttpSession session) {
		List<User> rightUserList = userService.getUserList();

		int userIdList[] = new int[rightUserList.size()];
		for (int i = 0; i < rightUserList.size(); i++) {
			userIdList[i] = rightUserList.get(i).getUser_id();
		}

		ArrayList<User_details> userDetailsList = new ArrayList<User_details>();

		for (User user : rightUserList) {
			userDetailsList.add(userService.getUserDetails(user.getUser_id()));
		}

		session.setAttribute("userDetailsList", userDetailsList);
		

		return "userList";
	}

	/* 2、修改用户详情 */
	@RequestMapping("/alterUser")
	public void alterUser(HttpServletRequest request, HttpServletResponse response) {

		int user_id = Integer.parseInt(request.getParameter("userId"));
		int udid = user_id;
		
		String icon = "https://img2.baidu.com/it/u=3354066334,1529355902&fm=26&fmt=auto&gp=0.jpg";
		
		int role = Integer.parseInt(request.getParameter("identity"));
		String pwd = request.getParameter("newPwd");
		
		if(pwd != null && pwd != "") {
			/*修改user表*/
			HashMap<String,Object> hm1 = new HashMap<String,Object>();
			hm1.put("user_id", user_id);
			hm1.put("pwd", pwd);
			int isAlter1 = userService.updateUserPwd(hm1);
			
			if(isAlter1>0) {
				System.out.println("user表修改成功！");
			}else {
				System.out.println("user表修改失败！");
			}
		}else {
			System.out.println("密码为空或者为空串，不需要修改！");
		}
		
		/*修改user_details表*/
		HashMap<String,Object> hm2 = new HashMap<String,Object>();
		hm2.put("udid", udid);
		hm2.put("icon", icon);
		hm2.put("role", role);
		int isAlter2 = userService.updateUserDetails(hm2);
		if(isAlter2>0) {
			System.out.println("user_details表修改成功！");
		}else {
			System.out.println("user_details表修改失败！");
		}

		try {
			response.sendRedirect("/TeamWork/user/getUserList.do");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/* 3、添加用户 */
	@RequestMapping("/insertUser")
	public String insertUser(HttpServletRequest request, HttpServletResponse response) {
		String userName = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		int role = Integer.parseInt(request.getParameter("identity"));

		System.out.println(userName);
		User user = userService.getUserByName(userName);
		/*
		 * 1、判断是否重名 （1）、重名：返回错误信息 （2）、不重名:直接插入新记录
		 */
		if (user != null) {
			return "insertUser";
		} else {

			int userId = userService.getMaxUserId() + 1;

			/* user表 */
			HashMap<String, Object> hm1 = new HashMap<String, Object>();
			hm1.put("user_delete", 0);
			hm1.put("user_id", userId);
			hm1.put("user_name", userName);
			hm1.put("password", pwd);
			userService.insertUser(hm1);

			/* user_details表 */
			/* user_details_id,user_id,name,icon,role */
			HashMap<String, Object> hm2 = new HashMap<String, Object>();
			hm2.put("user_details_id", userId);
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

		return null;
	}

	/* 4、删除用户 */
	@ResponseBody
	@RequestMapping("/deleteUser")
	public Object deleteUser(HttpServletRequest request, HttpServletResponse response) {
		int user_id = Integer.parseInt(request.getParameter("userId"));

		System.out.println(user_id);
		
		HashMap<String, Object> hm = new HashMap<String,Object>();
		
		int isDelete = userService.deleteUserByid(user_id);
		
		if (isDelete > 0) {
			System.out.println("删除成功！");
			hm.put("status", "success");
			/*response.sendRedirect("/TeamWork/user/getUserList.do");*/
			
		} else {
			System.out.println("删除失败！");
			hm.put("status", "error");
		}
		return hm;
	}

	/* 5、得到某个用户的详情 */
	@RequestMapping("/getUserDetails")
	public String getUserDetails(HttpServletRequest request, HttpSession session) {
		int userId = Integer.parseInt(request.getParameter("userId"));
		User_details userDetails = userService.getUserDetails(userId);

		session.setAttribute("userDetails", userDetails);
		return "userDetail";
	}

}
