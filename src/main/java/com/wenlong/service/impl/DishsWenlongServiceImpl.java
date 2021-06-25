package com.wenlong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.our.pojo.Dishs;
import com.wenlong.dao.DishsWenlongDao;
import com.wenlong.service.DishsWenlongService;

@Service("DishsWenlongService")
public class DishsWenlongServiceImpl implements DishsWenlongService{
	
	@Autowired 
	DishsWenlongDao dishsWenlongDao;
	
	@Override
	public List<Dishs> listDishs(){
		return dishsWenlongDao.listDishs();  
	}
}
