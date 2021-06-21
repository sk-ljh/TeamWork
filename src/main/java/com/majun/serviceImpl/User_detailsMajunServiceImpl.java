package com.majun.serviceImpl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majun.dao.User_detailsMajunDAO;
import com.majun.service.User_detailsMajunService;
import com.our.pojo.User;
import com.our.pojo.User_details;

@Service
public class User_detailsMajunServiceImpl implements User_detailsMajunService {
	@Autowired
	private User_detailsMajunDAO user_detailsMajunDAO;

	@Override
	// 查询用户详情
	public User_details getUser_details(String name) {
		// TODO 自动生成的方法存根
		return user_detailsMajunDAO.getUser_details(name);
	}

	@Override
	// 修改用户详情
	public int updateUser_details(Map map) {
		// TODO 自动生成的方法存根

		return user_detailsMajunDAO.updateUser_details(map);
	}

}
