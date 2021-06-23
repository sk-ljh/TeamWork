package com.majun.service;

import java.util.Map;

import com.our.pojo.User_details;

public interface UserdetailsMajunService {
	// 查询用户详情
	User_details getUserdetails(String name);

	// 更新用户详情
	public int updateUserdetails(Map map);

}
