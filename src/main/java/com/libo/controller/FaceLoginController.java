package com.libo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.libo.service.FaceLoginService;
import com.libo.service.UserLiboService;
import com.our.pojo.ReMessage;
import com.our.pojo.User;
import com.our.pojo.User_details;

@Controller
@RequestMapping("/") 
public class FaceLoginController {
	@Autowired
	private FaceLoginService faceLoginService;
	@Autowired
	private UserLiboService userLiboService;
	@RequestMapping("/dofacelogin")
	public @ResponseBody ReMessage doFaceLogin(String base,HttpSession session){
		User loginUser = faceLoginService.doFaceLogin(base);
		ReMessage message = new ReMessage();
		message.setMessage("login");
		if(loginUser != null){
			//登录成功
			User_details details=userLiboService.getUserDetails(loginUser.getUser_id());
			//存储用户信息表
			session.setAttribute("loginUser", loginUser);
			//存储用户详细信息表
			session.setAttribute("Userdetails", details);
			String role=String.valueOf(details.getRole());
			message.setMessage(role);
			return message;
		}
		return message;
	}
	
	@RequestMapping("/user/dofacereg")
	public @ResponseBody ReMessage doFaceReg(String base,HttpServletRequest request){
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		//把用户照片保存到本地
		String path = "D:/tomcat_upload/faceimg/";
		String urlPath = "D:/tomcat_upload/faceimg/" + loginUser.getUser_id() + ".jpg";		
		faceLoginService.writeImgToDisc(base,path,urlPath, loginUser);		
		//更新人脸信息
		
		Map<String,Object> hashmap=new HashMap<String,Object>();
		hashmap.put("user_id", loginUser.getUser_id());
		hashmap.put("face_path", urlPath);
		faceLoginService.updateUserFace(hashmap);
		//生成返回信息
		ReMessage message = new ReMessage();
		message.setMessage("注册成功");
		return message;
	}
	
}
