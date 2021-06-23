package com.majun.dao;

import java.util.Map;

import com.our.pojo.User_details;

public interface UserdetailsMajunDao {
	// 查询个人用户详细信息
	User_details getUserdetails(String name);

	// 修改个人用户详细信息
	int updateUserdetails(Map map);

}
