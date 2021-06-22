package com.majun.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majun.dao.UserMajunDAO;
import com.majun.service.UserMajunService;
import com.our.pojo.User;

@Service
public class UserMajunServiceImpl implements UserMajunService {

	@Autowired
	private UserMajunDAO userMajunDAO;

	@Override
	// 查询用户
	public User getUser(String user_name) {
		// TODO 自动生成的方法存根
		return userMajunDAO.getUser(user_name);
	}

	@Override
	// 修改用户
	public int updateUser(Map map) {
		// TODO 自动生成的方法存根
		return userMajunDAO.updateUser(map);
	}

	@Override
	// 确认用户合法
	public int confirmUser(Map map) {
		// TODO 自动生成的方法存根
		return userMajunDAO.confirmUser(map);
	}

}
