package com.yangyurui.dao;

import java.util.List;


import com.our.pojo.Message;

public interface NoticeYangyuruiDao {
	
	//查询公告总数
	int getMessageNumber();
	
	//查询公告,role为角色身份
	List<Message> listMessage(int role);
	
	//插入公告
	int insertMessage(Message message);
}
