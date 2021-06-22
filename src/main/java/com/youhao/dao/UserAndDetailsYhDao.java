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
	/*3、根据user_id查询某一用户详细信息*/
	User_details getUserDetails(int user_id);
	/*4、更新用户详情表中的icon和role*/
	int updateUserDetails(HashMap<String,Object> hm);
	/*5、更新用户表中的密码*/
	int updateUserPwd(HashMap<String,Object> hm);
	/*6、通过user_id假删除用户*/
	int deleteUserByid(HashMap<String,Object> hm);
	/*7、在user表中查找user_id列的最大值*/
	int getMaxUserId();
	/*8、在user表中插入一条记录*/
	int insertUser(HashMap<String,Object> hm);
	/*9、在user_details表中插入一条数据*/
	int insertUserDetails(HashMap<String,Object> hm);
}
