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
import com.our.pojo.Order_history;
import com.sunke.entity.OrderHistory_List;
import com.sunke.entity.QueryInfo;
import com.sunke.service.*;
import com.sunke.service.impl.DishSunkeServiceImpl;

@Controller
@RequestMapping("/")
public class DishSunkeController {
	@Autowired
	private DishSunkeService dishSunkeService;
	
	@RequestMapping("/getOneTypeDish")
	@CrossOrigin
	@ResponseBody
	public Object getOneTypeDish(@RequestBody QueryInfo qinfo) {
		Map<String, Object> map= dishSunkeService.getOneTypeDish(qinfo);
		return map;
	}
	
	@RequestMapping("/getCate")
	@CrossOrigin
	@ResponseBody
	public Object getCateGory() {
		
		List<String> Cate= dishSunkeService.getCate();
		Map<String, Object> map=new HashMap();
		map.put("cate", Cate);
		return map;
	}
	
	@RequestMapping("/getTableNumber")
	@CrossOrigin
	@ResponseBody
	public Object getTableNumber() {		
		Map<String, Object> map=dishSunkeService.getTableNum();
		return map;
	}
	
	@RequestMapping("/Buy")
	@CrossOrigin
	@ResponseBody
	public int  Buy(@RequestBody List<OrderHistory_List> buyBody) {		
		int newOrderId=dishSunkeService.InsertHistory(buyBody);
		return newOrderId;
	}

}
