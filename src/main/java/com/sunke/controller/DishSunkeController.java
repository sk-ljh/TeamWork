package com.sunke.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.our.pojo.Dishs;
import com.our.pojo.Order_history;
import com.our.pojo.Order_list;
import com.sunke.entity.Dish_DishDetail;
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

	@RequestMapping("/test")
	@CrossOrigin
	@ResponseBody
	public Object  Test(@RequestBody String object) {	
		Map<String, Object> map=dishSunkeService.getTableNum();
		map.put("data", dishSunkeService.getFinalCall());
		return map;
		
	}
	
	@RequestMapping("/getStatus")
	@CrossOrigin
	@ResponseBody
	public int  getStatus(@RequestBody HashMap<String,Integer> object) {	

		int number=object.get("site");
	
		return dishSunkeService.getStatus(number);
		
	}
	
	@RequestMapping("/getDetail")
	@CrossOrigin
	@ResponseBody
	public Dish_DishDetail  getDetail(@RequestBody HashMap<String,Integer> object) {	
		int number=object.get("id");
		return dishSunkeService.reMes(number);	
	}
	
	@RequestMapping("/getReadyDish")
	@CrossOrigin
	@ResponseBody
	public HashMap<String,List<Order_list>> getReadyDish() {	
		HashMap<String, List<Order_list>> map=new HashMap<String, List<Order_list>>();
		map.put("data", dishSunkeService.reReadyDish());
		return map;	
	}

}
