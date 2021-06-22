package com.sunke.service;
import java.util.List;


import org.springframework.stereotype.Service;

import com.our.pojo.*;
import com.sunke.DAO.DishMapperDAO;
public interface DishService {
	
	public List<Dishs>  getAllDish();
	public List<String>  getCate(); 
}
