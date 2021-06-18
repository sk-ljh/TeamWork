package com.youhao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserInfoController {

	@RequestMapping("/index")
	public String index() {
		System.out.println("user index...");
		return "index";
	}
}
