package com.majun.dao;

import java.util.Map;

import com.our.pojo.User;

public interface UserMajunDAO {
	// 查询个人用户信息
	User getUser(String name);

	// 修改个人用户信息
	int updateUser(Map map);

	int confirmUser(Map map);
}
