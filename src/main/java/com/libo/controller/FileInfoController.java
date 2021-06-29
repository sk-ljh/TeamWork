package com.libo.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.libo.service.FileInfoService;
import com.libo.service.UserLiboService;
import com.our.pojo.User;
import com.our.pojo.User_details;
import com.our.util.FileUtil;


@Controller
@RequestMapping("/file")
public class FileInfoController {
	@Autowired
	private UserLiboService userLiboService;
	@Autowired
	private FileInfoService fileInfoService;
	
	@ResponseBody
	@RequestMapping("/doupload")
	public Object doUpload(@RequestParam(required=false) MultipartFile mulFile,HttpSession session,HttpServletRequest request){
		int user_id=Integer.parseInt(request.getParameter("user_id"));
//		System.out.print(mulFile);
		System.out.print(user_id);
		//创建保存到硬盘中的地址
		
		StringBuffer sb = new StringBuffer();//保存到硬盘中的地址 a.jpg ---------------> d://aaaa/01200120012_a.jpg
//		FileUtil.createRandomFileName();
//		mulFile.getOriginalFilename();
		sb.append(FileUtil.createRandomFileName()).append("_").append(mulFile.getOriginalFilename());
		System.out.println("sb = " + sb);
		String storeFileUrl = sb.toString();// /upload/xxxxxxxxx_01.jpg 保存到硬盘中的地址
		String realFileName = mulFile.getOriginalFilename();//真实文件名
		System.out.println("realFileName="+realFileName);
//		storeFileUrl = request.getServletContext().getRealPath(storeFileUrl);// /upload/xxxx_01.jpg --> d://xxx/upload/xxx_01.jpg
		System.out.println("storeFileName = " + storeFileUrl);
		
		
		Map<String,Object> hashmap=new HashMap<String,Object>();
		hashmap.put("user_id", user_id);
		hashmap.put("icon",storeFileUrl);
		hashmap.put("code",-2);
		String pathPort=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+"/";
		hashmap.put("iconUrl", pathPort+"file/"+storeFileUrl);
		fileInfoService.uploadFileInfo(mulFile, hashmap);//保存文件
		
		
		int user_id2=((User)session.getAttribute("loginUser")).getUser_id();
		if(user_id==user_id2)
		{
			User_details details=userLiboService.getUserDetails(user_id);
			session.setAttribute("Userdetails", details);
		}
		
		return hashmap;
	}
	
}
