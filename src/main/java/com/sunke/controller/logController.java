package com.sunke.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user1")
public class logController {

	@RequestMapping("/index1")
	public String index() {
		System.out.println("user index...");
		return "index";
	}
}
