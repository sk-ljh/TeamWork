package com.sunke.service;
import java.util.List;

import com.our.pojo.*;
import com.sunke.DAO.DishMapperDAO;
public class DishService {
	DishMapperDAO dishmapper;
	public List<Dishs>  getAllDish() {
		List<Dishs>  allDish=dishmapper.ListDishsAll();
		return allDish;
	}
}
