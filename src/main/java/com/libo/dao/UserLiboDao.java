package com.libo.dao;

import com.our.pojo.User;

public interface UserLiboDao {
	User getUser(User usr);
	User getUserFromName(String user_name);
}
