package com.sunke.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.our.pojo.Dishs;
import com.sunke.service.*;
import com.sunke.service.imp.DishServiceImp;

@Controller
@RequestMapping("/")
public class dishController {
	@Autowired
	private DishService dishService;
	@RequestMapping("/getdish")
	public String index() {
		System.out.println(1);
		List<Dishs> AllDish= dishService.getAllDish();
		System.out.println(2);
		for(Dishs item :AllDish) {
			System.out.println(item);
		}
		return "index";
	}
	@RequestMapping("/getCate")
	@CrossOrigin
	@ResponseBody
	public Object getCateGory() {
		
		List<String> Cate= dishService.getCate();
		for(String item :Cate) {
			System.out.println(item);
		}
		Map<String, Object> map=new HashMap();
		map.put("cate", Cate);
		return map;
	}
	
	
}
