package com.majun.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majun.dao.UserdetailsMajunDao;
import com.majun.service.UserdetailsMajunService;
import com.our.pojo.User_details;

@Service
public class UserdetailsMajunServiceImpl implements UserdetailsMajunService {
	@Autowired
	private UserdetailsMajunDao userdetailsMajunDao;

	@Override
	// 查询用户详情
	public User_details getUserdetails(String name) {
		// TODO 自动生成的方法存根
		return userdetailsMajunDao.getUserdetails(name);
	}

	@Override
	// 修改用户详情
	public int updateUserdetails(Map map) {
		// TODO 自动生成的方法存根

		return userdetailsMajunDao.updateUserdetails(map);
	}

}
