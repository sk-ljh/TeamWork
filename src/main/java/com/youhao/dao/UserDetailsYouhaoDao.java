package com.youhao.dao;

import java.util.HashMap;
import java.util.List;
import com.our.pojo.User_details;

public interface UserDetailsYouhaoDao {
	List<User_details> getUserDetailsList();
	int UpdateUserDetails(HashMap<String,Object> hm);
}