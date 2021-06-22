package com.libo.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.libo.dao.UserDetailsLiboDao;
import com.libo.dao.UserLiboDao;
import com.libo.service.UserLiboService;
import com.our.pojo.User;
import com.our.pojo.User_details;
@Service("userLiboService")
public class UserLiboServiceImpl implements UserLiboService{
	@Autowired
	private UserLiboDao userLiboDao;
	@Autowired
	private UserDetailsLiboDao userDetailsLibo;
	@Override
	public User getUser(User user) {
		return userLiboDao.getUser(user);
	}
	@Override
	public User_details getUserDetails(int user_id) {
		return userDetailsLibo.getUser_details(user_id);
	}
	
}
