package com.sunke.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.our.pojo.Dishs;
import com.sunke.service.DishService;

@Controller

public class dishController {
	@Autowired
	DishService dishservice;
	@RequestMapping("/getdish")
	public String index() {
		List<Dishs> AllDish= dishservice.getAllDish();
		for(Dishs item :AllDish) {
			System.out.println(item);
		}
		return "index";
	}
}
