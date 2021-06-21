package com.majun.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majun.dao.DishsMajunDAO;
import com.majun.service.DishsMajunService;
import com.our.pojo.Dishs;

@Service
public class DishsMajunServiceImpl implements DishsMajunService {
	@Autowired
	private DishsMajunDAO dishsMajunDAO;

	// 查看菜品
	@Override
	public List<Dishs> listDishs() {
		// TODO 自动生成的方法存根
		return dishsMajunDAO.listDishs();
	}

	// 修改菜品
	@Override
	public int updateDishs(Map map) {
		// TODO 自动生成的方法存根
		return dishsMajunDAO.updateDishs(map);
	}

}
