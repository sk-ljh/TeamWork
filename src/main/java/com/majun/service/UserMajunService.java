package com.majun.service;

import java.util.Map;

import com.our.pojo.User;

public interface UserMajunService {
	// 查询用户信息
	User getUser(String user_name);

	// 修改用户信息
	public int updateUser(Map map);

	// 确认用户合法
	public int confirmUser(Map map);
}
