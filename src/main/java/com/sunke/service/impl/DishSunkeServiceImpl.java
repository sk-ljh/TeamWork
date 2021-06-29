package com.sunke.service.impl;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.our.pojo.Dishs;
import com.our.pojo.Order_history;
import com.our.pojo.Order_list;
import com.our.pojo.User;
import com.sunke.dao.DishSunkeDao;
import com.sunke.entity.Dish_DishDetail;
import com.sunke.entity.OrderHistory_List;
import com.sunke.entity.QueryInfo;
import com.sunke.entity.TableStatus;
import com.sunke.service.*;

@Service
public class DishSunkeServiceImpl implements DishSunkeService{
	@Autowired
	private  DishSunkeDao dishSunkeDao;
	
	@Override
	public HashMap<String,Object> getOneTypeDish(@RequestBody QueryInfo qinfo) {
		
		int numbers= dishSunkeDao.getDishCount(qinfo.getQuery());
		int pageStart=(qinfo.getPageNum()-1)*qinfo.getPageSize();//游标起始位置
		 List<Dishs> oneTypeDish=dishSunkeDao.listDishsAll(qinfo.getQuery(),pageStart,qinfo.getPageSize());
		 HashMap<String,Object> res=new HashMap<>();
		 res.put("numbers",numbers);
		 res.put("data",oneTypeDish);
		 return res;
	}
	@Override
	public List<String> getCate() {
		// TODO Auto-generated method stub
		return dishSunkeDao.reCate();
	}
	@Override
	public HashMap<String, Object> getTableNum() {
		// TODO Auto-generated method stub
		HashMap<String, Object> reObj=new HashMap<String, Object>();
		      List<String> places=dishSunkeDao.rePlace();
		      for(String item:places) {
		    	  List<Integer> numbers=dishSunkeDao.reNum(item);
		    	      reObj.put(item, numbers);
		      }
		      List<TableStatus> state=dishSunkeDao.reStatus();
		      HashMap<String, Object> data=new HashMap<String, Object>();  
		      System.out.println(state);
		           data.put("data", reObj);
		           data.put("state", state);
		      return data;
	}
	@Override
	public int InsertHistory(@RequestBody List<OrderHistory_List> buyBody) {
		// TODO Auto-generated method stub
		OrderHistory_List firstBody=buyBody.get(0);
		
		Date date=new Date(); 
		 DateFormat simpleDateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //创建一个格式化日期对象
		 String  beginTime = simpleDateFormat.format(date); 
		System.out.println(beginTime);
		
		dishSunkeDao.updateTableStatus(firstBody.getTableNumber());
		
		//获取一个Date对象
		
		 String punchTime = simpleDateFormat.format(date); 
		 
		
		int maxId=dishSunkeDao.getMaxId()+1;
		Order_history orderHis=new Order_history(firstBody.getTableNumber(), firstBody.getPrice(), beginTime, "", 0,
				 maxId, firstBody.getUser_id(), 0);
		
		dishSunkeDao.insertHistory(orderHis);
		for(int i=0;i<buyBody.size();i++) {
			OrderHistory_List Body=buyBody.get(i);
			System.out.println(Body);
			Order_list one=new Order_list(Body.getDishs_id(), Body.getDishs_name(), Body.getNumber(), Body.getPrice(), 0, maxId,
					0);
			dishSunkeDao.insertDishList(one);
		}
		return maxId;
		
	}
	@Override
	public String getFinalCall() {
		// TODO Auto-generated method stub
		return dishSunkeDao.getFinalCall();
	}
	@Override
	public int getStatus(int number) {
		// TODO Auto-generated method stub
		return dishSunkeDao.getStatus(number);
	}
	@Override
	public Dish_DishDetail reMes(int dishId) {
		// TODO Auto-generated method stub
		return dishSunkeDao.getAllMes(dishId);
	}
	@Override
	public List<Order_list> reReadyDish() {
		// TODO Auto-generated method stub
		return dishSunkeDao.reReadyDish();
	}
	
	
	
	
	
}
