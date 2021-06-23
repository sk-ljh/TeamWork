package com.sunke.service.impl;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.our.pojo.Dishs;
import com.our.pojo.User;
import com.sunke.dao.DishSunkeDao;
import com.sunke.entity.QueryInfo;
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
	

}
