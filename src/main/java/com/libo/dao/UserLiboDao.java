package com.libo.dao;

import java.util.Map;

import com.our.pojo.User;

public interface UserLiboDao {
	User getUser(User usr);
	User getUserFromName(String user_name);
	void updateFace(Map<String,Object> map);
}
