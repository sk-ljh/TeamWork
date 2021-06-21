package com.youhao.dao;

import java.util.HashMap;
import java.util.List;

import com.our.pojo.User;
import com.our.pojo.User_details;

public interface UserAndDetailsYhDao {
	/*1、查询user表的所有信息*/ 
	List<User> getUserList();
	/*2、查询user_details表的所有信息*/
	List<User_details> getUserDetailsList();
	/*3、更新用户详情表中的icon和role*/
	int UpdateUserDetails(HashMap<String,Object> hm);
	/*4、更新用户表中的密码*/
	int UpdateUserPwd(HashMap<String,Object> hm);
	
}
