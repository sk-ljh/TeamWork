package com.majun.dao;

import java.util.Map;

import com.our.pojo.User;

public interface UserMajunDao {
	// 查询个人用户信息
	User getUser(String user_name);

	// 修改个人用户信息
	int updateUser(Map map);

	// 确认用户合法
	int confirmUser(Map map);
}
