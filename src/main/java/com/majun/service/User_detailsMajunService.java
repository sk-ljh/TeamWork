package com.majun.service;

import java.util.Map;

import com.our.pojo.User_details;

public interface User_detailsMajunService {
	// 查询用户详情
	User_details getUser_details(String name);

	// 更新用户详情
	public int updateUser_details(Map map);

}
