package com.youhao.service;

import java.util.HashMap;
import java.util.List;

import com.our.pojo.User;
import com.our.pojo.User_details;

public interface UserYouhaoService {
	
	/*2、得到用户详情列表*/
	public List<User_details> getUserDetailsList();
	
	/*7、在user表中查找user_id列的最大值*/
	public int getMaxUserId();
	/*8、向user表中插入一条记录*/
	public int insertUser(HashMap<String,Object> hm);
	/*9、在user_details表中插入一条数据*/
	public int insertUserDetails(HashMap<String,Object> hm);
	/*10、通过user_name查找用户的删除状态*/
	public User getUserByName(String name);
}
