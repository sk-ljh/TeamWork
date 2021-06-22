package com.youhao.servicelmpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.our.pojo.User_details;
import com.youhao.dao.UserAndDetailsYhDao;
import com.youhao.service.UserService;

@Service
public class UserServicelmpl implements UserService {

	@Autowired
	private UserAndDetailsYhDao userADDao;
	
	@Override
	public List<User_details> getUserDetailsList() {
		return userADDao.getUserDetailsList();
	}

}
