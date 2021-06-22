package com.libo.service;

import com.our.pojo.User;
import com.our.pojo.User_details;

public interface UserLiboService {
	public User getUser(User user);
	public User_details getUserDetails(int user_id);
}
