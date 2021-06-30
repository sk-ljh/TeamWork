package com.yangyurui.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.our.pojo.Message;
import com.yangyurui.dao.NoticeYangyuruiDao;
import com.yangyurui.service.NoticeYangyuruiService;

@Service
public class NoticeYangyuruiServiceImpl implements NoticeYangyuruiService{
	@Autowired
	private NoticeYangyuruiDao notice;
	
	//查询公告总数
	@Override
	public int getMessageNumber() {
		return notice.getMessageNumber();
	}
	
	//查询公告,role为角色身份
	@Override
	public List<Message> listMessage(int role){
		return notice.listMessage(role);
	}
	
	//插入公告
	@Override
	public void insertMessage(int message_id,int from_id,int to_role,String content,String time,int delete_status) {
		int res=notice.insertMessage(new Message(message_id,from_id,to_role,content,time,delete_status));
	}
}
