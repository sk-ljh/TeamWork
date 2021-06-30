package com.yangyurui.service;

import java.util.List;

import com.our.pojo.Message;

public interface NoticeYangyuruiService {
	
	//查询公告总数
	public int getMessageNumber();
	
	//查询公告
	public List<Message> listMessage(int role);
	
	//插入公告
	public void insertMessage(int message_id,int from_id,int to_role,String content,String time,int delete_status);
}
