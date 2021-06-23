package com.youhao.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.our.pojo.User;
import com.our.pojo.User_details;
import com.youhao.dao.UserAndDetailsYhDao;
import com.youhao.service.UserYouhaoService;

@Service
public class UserYouhaoServicelmpl implements UserYouhaoService {

	@Autowired
	private UserAndDetailsYhDao userADDao;
	
	@Override
	public List<User_details> getUserDetailsList() {
		return userADDao.getUserDetailsList();
	}
	
	/*7、在user表中查找user_id列的最大值*/
	@Override
	public int getMaxUserId() {
		return userADDao.getMaxUserId();
	}
	
	/*8、向user表中插入一条记录*/
	@Override
	public int insertUser(HashMap<String,Object> hm) {
		return userADDao.insertUser(hm);
	}
	
	/*9、在user_details表中插入一条数据*/
	public int insertUserDetails(HashMap<String,Object> hm) {
		return userADDao.insertUserDetails(hm);
	}
	/*10、通过user_name查找用户的删除状态*/
	public User getUserByName(String name) {
		return userADDao.getUserByName(name);
	}
	
	
	
	
	
	
	
	
	
}
