package com.sunke.service.imp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.our.pojo.Dishs;
import com.sunke.DAO.DishMapperDAO;
import com.sunke.service.*;

@Service
public class DishServiceImp implements DishService{
	@Autowired
	private  DishMapperDAO dishMapperDAO;
	
	@Override
	public List<Dishs> getAllDish() {
		return dishMapperDAO.ListDishsAll();
	}

	@Override
	public List<String> getCate() {
		// TODO Auto-generated method stub
		return dishMapperDAO.reCate();
	}
	

}
