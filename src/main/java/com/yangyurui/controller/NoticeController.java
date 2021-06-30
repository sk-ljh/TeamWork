package com.yangyurui.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.our.pojo.Message;
import com.our.pojo.User_details;
import com.yangyurui.service.impl.NoticeYangyuruiServiceImpl;


@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeYangyuruiServiceImpl noticeService;
	
	@RequestMapping("/listNotices")
	public String listNotices(HttpSession session) {
		User_details userDetails;
		userDetails=(User_details)session.getAttribute("Userdetails");
		List<Message> notices=noticeService.listMessage(userDetails.getRole());
		session.setAttribute("notices", notices);
		return userDetails.getRole()==1?"noticeCheckForWaiter":"noticeCheckForChef";
	}
	
	@ResponseBody
	@RequestMapping("/insertNotice")
	public Object insertNotice(HttpSession session,@RequestParam("target") String target,@RequestParam("content") String content) {
		User_details userDetails=(User_details)session.getAttribute("Userdetails");;
		int to_role;//用整数表示目标身份
		int from_id=userDetails.getUser_id();//获取发布公告管理员的id
		if(target.equals("entire"))
			to_role=3;
		else if(target.equals("chef"))
			to_role=2;
		else to_role=1;
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());//公告发布时间
		content=content.replace("\n", "<br>");//把换行符的形式转换一下
		noticeService.insertMessage(noticeService.getMessageNumber()+1, from_id, to_role, content, time, 0);
		Map<String, Object> msg = new HashMap<String, Object>();
		msg.put("res", "success");
		msg.put("target", target);
		msg.put("content", content);
		return msg;
	}
}
