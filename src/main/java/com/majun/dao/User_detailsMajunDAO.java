package com.majun.dao;

import java.util.Map;

import com.our.pojo.User_details;

public interface User_detailsMajunDAO {
	// 查询个人用户详细信息
	User_details getUser_details(String name);

	// 修改个人用户详细信息
	int updateUser_details(Map map);

	int confirmUser_details(Map map);
}
