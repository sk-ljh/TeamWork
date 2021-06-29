package com.yangyurui.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.our.pojo.Dishs;
import com.our.pojo.Dishs_detail;
import com.yangyurui.service.impl.DishsDetailYangyuruiServiceImpl;
import com.yangyurui.service.impl.DishsYangyuruiServiceImpl;

@Controller
@RequestMapping("/dishDetail")
public class DishsDetailYangyuruiController {
	@Autowired
	private DishsYangyuruiServiceImpl dishService;

	@Autowired
	private DishsDetailYangyuruiServiceImpl dish_detailService;

	// 展示菜品详情（alter为true的话跳转到修改详情的页面，否则跳转到菜品详情页）
	@RequestMapping("/showDishInf")
	public String showDishInf(HttpSession session, @RequestParam("dishId") String id,
			@RequestParam(value = "alter", defaultValue = "false") String alter) {
		Dishs theDish = dishService.getDishByDishId(Integer.valueOf(id));
		Dishs_detail theDetail = dish_detailService.getDishDetail(Integer.valueOf(id));
		session.setAttribute("selectedDish", theDish);
		session.setAttribute("selectedDishDetail", theDetail);
		return alter.equals("true") ? "alterDishInf" : "dishDetail";
	}

	// 添加新菜品，对dishs和dishs_detail两张表更新
	@ResponseBody
	@RequestMapping("/insertDish")
	public Object insertDish(HttpSession session, @RequestParam("name") String name,
			@RequestParam("category") String category, @RequestParam("price") String price,
			@RequestParam("introduction") String introduction, @RequestParam("recom") String recom,
			@RequestParam("supplier") String supplier, @RequestParam("detail") String detail,
			@RequestParam("size") String size, @RequestParam("flavor") String flavor) {

		// 获取是否为推荐菜品，并用整数0或1存放该信息
		int recommend = recom.equals("是") ? 1 : 0;
		String icon = (String) session.getAttribute("dishIcon");
		if (icon == null)
			icon = "<%=path %>/OrderSystem/img/茄汁培根意面.jpg";// 对应默认图片（暂时保留引入图片时需要的前缀）
		// 向dishs表和dishs_detail插入记录
		dishService.insertDishs(name, category, icon, Float.valueOf(price), introduction, recommend);
		dish_detailService.insertDishsDetail(supplier, detail, size, flavor);
		Map<String, Object> msg = new HashMap<String, Object>();
		msg.put("res", "success");
		return msg;
	}

	@ResponseBody
	@RequestMapping("/dishManage")
	public Object dishManage(HttpSession session, HttpServletRequest request, @RequestParam("id") String id) {
		// @SuppressWarnings("unchecked")
//		List<Dishs> dishs = (List<Dishs>) session.getAttribute("dishs");
//		System.out.println(dishs);
		String name = request.getParameter("dishName");
		String sprice = request.getParameter("price");
		float price = -1;
		if (!sprice.equals(""))
			price = Float.parseFloat(sprice);
		String cate = request.getParameter("classification");
//		String icon = request.getParameter("");
		String introduction = request.getParameter("dishIntro");
		String introductionDetail = request.getParameter("dishDetail");
		System.out.println(id);
		System.out.println(name);
		System.out.println(price);
		System.out.println(cate);
		System.out.println(introduction);
		if (!(name.equals("") && price == -1 && cate.equals("-1") && introduction.equals(""))) {
			Map<String, Object> dishMap = new HashMap<String, Object>();
			dishMap.put("dishs_id", Integer.valueOf(id));
			dishMap.put("dishs_name", name);
			dishMap.put("price", price);
			dishMap.put("dishs_cate", cate);
//		dishMap.put("dishs_icon", icon);
			dishMap.put("introduction", introduction);
			dishService.updateDishs(dishMap);
		}
		if (!introductionDetail.equals("")) {
			Map<String, Object> dishDetailMap = new HashMap<String, Object>();
			dishDetailMap.put("dishs_id", id);
			dishDetailMap.put("introduce_detail", introductionDetail);
			dish_detailService.updateDishsdetail(dishDetailMap);
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("Message", "ok");
		return result;
	}
}
