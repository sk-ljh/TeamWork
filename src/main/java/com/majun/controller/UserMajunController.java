package com.majun.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.majun.service.UserMajunService;
import com.majun.service.UserdetailsMajunService;
import com.our.pojo.User;
import com.our.pojo.User_details;

@Controller
@RequestMapping("/")
public class UserMajunController {
	@Autowired
	private UserMajunService userMajunService;

	@Autowired
	private UserdetailsMajunService userdetailsMajunService;

	@RequestMapping("/alterSelfInf")
	public String alterSelfInf(HttpSession session, HttpServletRequest request) {
		User user = (User) session.getAttribute("loginUser");
		int id = user.getUser_id();
		String pwd = user.getPassword();
		String sex = request.getParameter("sex");
		String oldPwd = request.getParameter("oldPwd");
		String newPwd = request.getParameter("new-password");
		String phone = request.getParameter("phone");
		if (!pwd.equals(oldPwd)) {
			System.out.println("confirm:FALSE!");

			return "alterSelfInf";
		} else {
			if (!newPwd.equals("")) {
				Map<String, Object> userMap = new HashMap<String, Object>();
				userMap.put("user_id", id);
				userMap.put("password", newPwd);
				userMajunService.updateUser(userMap);
			}
			Map<String, Object> userdetailMap = new HashMap<String, Object>();
			userdetailMap.put("user_id", id);
			userdetailMap.put("sex", sex);
			userdetailMap.put("phone", phone);
//			userdetailMap.put("icon", icon);
			userdetailsMajunService.updateUserdetails(userdetailMap);
		}
		return "login";
	}

	@RequestMapping("/alterSelfInfJump")
	public String alterSelfInf2(HttpSession session, HttpServletRequest request) {
		System.out.println("JumpHomePage");
		int role = ((User_details) session.getAttribute("Userdetails")).getRole();
		String site = "";
		switch (role) {
		case 1:
			site = "waiterHomePage";
			break;
		case 2:
			site = "chefHomepage";
			break;
		case 3:
			site = "adminHomepage";
			break;
		}
		return site;
	}
}
