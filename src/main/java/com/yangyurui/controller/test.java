package com.yangyurui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class test {
	@RequestMapping("/dishAdminList")
	public String dishAdminList() {
		System.out.println("dispatchSuccess!");
		return "dishAdminList";
	}
}
