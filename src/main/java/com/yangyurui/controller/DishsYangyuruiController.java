package com.yangyurui.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.our.pojo.Dishs;
import com.yangyurui.service.impl.DishsDetailYangyuruiServiceImpl;
import com.yangyurui.service.impl.DishsYangyuruiServiceImpl;

@Controller
@RequestMapping("/Dish")
public class DishsYangyuruiController {
	@Autowired
	private DishsYangyuruiServiceImpl dishService;
	
	@Autowired
	private DishsDetailYangyuruiServiceImpl dish_detailService;
	
	@RequestMapping("/listDishsAll")
	public String listDishs(HttpSession session) {
		List<Dishs> dishs=dishService.listDishs();
		session.setAttribute("dishs", dishs);
		return "dishAdminList";
	}
	
	@RequestMapping("/listDishsByKey")
	public String listDishsByKey(HttpSession session,@RequestParam("dishKey")String key) {
		List<Dishs> dishs=dishService.listDishsByKey(key);
		session.setAttribute("dishs", dishs);
		return "dishAdminList";
	}
}
