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
	
	@RequestMapping("/listDishsAll")
	public String listDishs(HttpSession session,@RequestParam(value="currentDish_Page",defaultValue="1")String currentDish_Page) {
		List<Dishs> dishs=dishService.listDishs();
		session.setAttribute("DishQueriedNumber", dishs.size());//保存记录数
		session.setAttribute("currentDish_Page", currentDish_Page);//保存当前页数到session里
		if(dishs.size()>4)	
			if((Integer.valueOf(currentDish_Page)-1)*4+4<=dishs.size())
				dishs=dishs.subList((Integer.valueOf(currentDish_Page)-1)*4, (Integer.valueOf(currentDish_Page)-1)*4+4);
			else dishs=dishs.subList((Integer.valueOf(currentDish_Page)-1)*4, dishs.size());
		session.setAttribute("dishs", dishs);
		session.setAttribute("selectedCategory", "全部");
		session.removeAttribute("dishKey");//清除之前可能存放在sesson里的菜品关键字
		return "dishAdminList";
	}
	
	@RequestMapping("/listDishsByKey")
	public String listDishsByKey(HttpSession session,@RequestParam("dishKey")String key,@RequestParam(value="currentDish_Page",defaultValue="1")String currentDish_Page) {
		List<Dishs> dishs=dishService.listDishsByKey(key);
		session.setAttribute("DishQueriedNumber", dishs.size());//保存记录数
		session.setAttribute("currentDish_Page", currentDish_Page);//保存当前页数到session里
		if(dishs.size()>4)
			if((Integer.valueOf(currentDish_Page)-1)*4+4<=dishs.size())
				dishs=dishs.subList((Integer.valueOf(currentDish_Page)-1)*4, (Integer.valueOf(currentDish_Page)-1)*4+4);
			else dishs=dishs.subList((Integer.valueOf(currentDish_Page)-1)*4, dishs.size());
		session.setAttribute("dishs", dishs);
		session.setAttribute("dishKey", key);
		session.setAttribute("selectedCategory", "全部");
		return "dishAdminList";
	}
	
	@RequestMapping("/listDishsByCategory")
	public String listDishsByCategory(HttpSession session,@RequestParam("category")String category,@RequestParam(value="currentDish_Page",defaultValue="1")String currentDish_Page) {
		List<Dishs> dishs;
		if(category.equals("其它")) {
			System.out.println("菜类为其它！");
			dishs=dishService.listOtherDishs();
		}
		else dishs=dishService.listDishsByCategory(category);
		session.setAttribute("DishQueriedNumber", dishs.size());//保存记录数
		session.setAttribute("currentDish_Page", currentDish_Page);//保存当前页数到session里
		if(dishs.size()>4)
			if((Integer.valueOf(currentDish_Page)-1)*4+4<=dishs.size())
				dishs=dishs.subList((Integer.valueOf(currentDish_Page)-1)*4, (Integer.valueOf(currentDish_Page)-1)*4+4);
			else dishs=dishs.subList((Integer.valueOf(currentDish_Page)-1)*4, dishs.size());
		session.setAttribute("dishs", dishs);
		session.setAttribute("selectedCategory", category);
		session.removeAttribute("dishKey");//清除之前可能存放在sesson里的菜品关键字
		return "dishAdminList";
	}
	@RequestMapping("/removeDish")
	public String removeDish(HttpSession session,@RequestParam("dishId")String id) {
		List<Dishs> dishs;
		int currentDish_Page=Integer.valueOf((String) session.getAttribute("currentDish_Page"));
		dishService.removeDishs(Integer.valueOf(id));
		String key=(String) session.getAttribute("dishKey"),category=(String) session.getAttribute("selectedCategory");
		if(key!=null)
			dishs=dishService.listDishsByKey(key);
		else if(category.equals("全部"))
			dishs=dishService.listDishs();
		else dishs=dishService.listDishsByCategory(category);
		if(dishs.size()>4)
			if((Integer.valueOf(currentDish_Page)-1)*4+4<=dishs.size())
				dishs=dishs.subList((Integer.valueOf(currentDish_Page)-1)*4, (Integer.valueOf(currentDish_Page)-1)*4+4);
			else dishs=dishs.subList((Integer.valueOf(currentDish_Page)-1)*4, dishs.size());
		session.setAttribute("dishs", dishs);
		return "dishAdminList";
	}
	@RequestMapping("/restoreDish")
	public String restoreDish(HttpSession session,@RequestParam("dishId")String id) {
		List<Dishs> dishs;
		int currentDish_Page=Integer.valueOf((String) session.getAttribute("currentDish_Page"));
		dishService.restoreDishs(Integer.valueOf(id));
		String key=(String) session.getAttribute("dishKey"),category=(String) session.getAttribute("selectedCategory");
		if(key!=null)
			dishs=dishService.listDishsByKey(key);
		else if(category.equals("全部"))
			dishs=dishService.listDishs();
		else dishs=dishService.listDishsByCategory(category);
		if(dishs.size()>4)
			if((Integer.valueOf(currentDish_Page)-1)*4+4<=dishs.size())
				dishs=dishs.subList((Integer.valueOf(currentDish_Page)-1)*4, (Integer.valueOf(currentDish_Page)-1)*4+4);
			else dishs=dishs.subList((Integer.valueOf(currentDish_Page)-1)*4, dishs.size());
		session.setAttribute("dishs", dishs);
		return "dishAdminList";
	}
}
