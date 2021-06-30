package com.youhao.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.libo.service.FileInfoService;
import com.our.pojo.User;
import com.our.pojo.User_details;
import com.our.util.FileUtil;
import com.youhao.service.UserYouhaoService;

@Controller
@RequestMapping("/user")
public class UserYouhaoController {
	@Autowired
	private FileInfoService fileInfoService;
	@Autowired
	UserYouhaoService userService;

	/* 0、测试 */
	@RequestMapping("/dologin")
	public String index(HttpSession session) {

		/*
		 * List<User_details> userDetailsList = userService.getUserDetailsList();
		 * 
		 * for (User_details user_details : userDetailsList) {
		 * System.out.println(user_details); } session.setAttribute("userDetailsList",
		 * userDetailsList);
		 */

		return "login";
	}

	/* 1、得到user详情列表 */
	@RequestMapping("/getUserList")
	public String getUserList(@RequestParam(value="pageno",defaultValue="1")Integer pageno,HttpSession session) {
		
		List<User_details> userDetailsList = userService.getUserDetailslist3();
		session.setAttribute("DishQueriedNumber", userDetailsList.size());// 保存记录数
		session.setAttribute("pageno", pageno);// 保存当前页数到session里
		if (userDetailsList.size() > 5) {
			if ((Integer.valueOf(pageno) - 1) * 5 + 5 <= userDetailsList.size()) {
				userDetailsList = userDetailsList.subList((Integer.valueOf(pageno) - 1) * 5,
						(Integer.valueOf(pageno) - 1) * 5 + 5);
			}
			else {
				userDetailsList = userDetailsList.subList((Integer.valueOf(pageno) - 1) * 5, userDetailsList.size());
			}
		}
		
		session.setAttribute("userDetailsList", userDetailsList);
		
		List<User> userList = userService.getUserList();
		session.setAttribute("userList", userList);
		
		return "userList";
	}
	/*2_1跳转到修改页面之前的数据储备*/
	@RequestMapping("/toAlter")
	public String toAlter(HttpServletRequest request,HttpSession session) {
		int user_id = Integer.parseInt(request.getParameter("userId"));
		session.setAttribute("userId", user_id);
		
		String userName = userService.getUsernameById(user_id);
		System.out.println("用户名为："+userName);
		session.setAttribute("userName", userName);
		
		User_details userDetails = userService.getUserDetails(user_id);
		session.setAttribute("userDetails", userDetails);
		
		return "alterUserInf";
	}
	
	/* 2_2、修改用户详情 */
	@RequestMapping("/alterUser")
	public void alterUser(HttpServletRequest request, HttpServletResponse response) {

		int user_id = Integer.parseInt(request.getParameter("userId"));
		int udid = user_id;
		
		String icon = "https://img2.baidu.com/it/u=3354066334,1529355902&fm=26&fmt=auto&gp=0.jpg";
		
		int role = Integer.parseInt(request.getParameter("identity"));
		String pwd = request.getParameter("newPwd");
		
		/*首先需要判断用户名密码是否正确，这里似乎没有进行判断*/
		
		if(pwd != null && pwd != "") {
			/*修改user表*/
			HashMap<String,Object> hm1 = new HashMap<String,Object>();
			hm1.put("user_id", user_id);
			hm1.put("pwd", pwd);
			int isAlter1 = userService.updateUserPwd(hm1);
			if(isAlter1>0) {
				System.out.println("user表修改成功！");
			}else {
				System.out.println("user表修改失败！");
			}
		}else {
			System.out.println("密码为空或者为空串，不需要修改！");
		}
		
		/*修改user_details表*/
		HashMap<String,Object> hm2 = new HashMap<String,Object>();
		hm2.put("udid", udid);
//		hm2.put("icon", icon);
		hm2.put("role", role);
		if(role!=0) {
			int isAlter2 = userService.updateUserDetails(hm2);
			if(isAlter2>0) {
				System.out.println("user_details表修改成功！");
			}else {
				System.out.println("user_details表修改失败！");
			}
		}else {
			System.out.println("没有选择角色，不需要修改！");
		}
		try {
			response.sendRedirect("/TeamWork/user/getUserList.do");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/* 3、添加用户 */
	@RequestMapping("/insertUser")
	public String insertUser(@RequestParam(required=false) MultipartFile mulFile,HttpServletRequest request, HttpServletResponse response) {
		
		
		String userName = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		int role = Integer.parseInt(request.getParameter("identity"));

		System.out.println(userName);
		User user = userService.getUserByName(userName);
		/*
		 * 1、判断是否重名 （1）、重名：返回错误信息 （2）、不重名:直接插入新记录
		 */
		if (user != null) {
			return "insertUser";
		} else {

			int userid = userService.getMaxUserId() + 1;
			String storeFileUrl="";
			if(mulFile.getOriginalFilename()!=null && mulFile.getOriginalFilename()!="")
			{
				StringBuffer sb = new StringBuffer();//保存到硬盘中的地址 a.jpg ---------------> d://aaaa/01200120012_a.jpg
	//			FileUtil.createRandomFileName();
	//			mulFile.getOriginalFilename();
				sb.append(FileUtil.createRandomFileName()).append("_").append(mulFile.getOriginalFilename());
				System.out.println("sb = " + sb);
				storeFileUrl = sb.toString();// /upload/xxxxxxxxx_01.jpg 保存到硬盘中的地址
				String realFileName = mulFile.getOriginalFilename();//真实文件名
				System.out.println("realFileName="+realFileName);
	//			storeFileUrl = request.getServletContext().getRealPath(storeFileUrl);// /upload/xxxx_01.jpg --> d://xxx/upload/xxx_01.jpg
				System.out.println("storeFileName = " + storeFileUrl);
			}
			else
			{
				storeFileUrl="20210629094857148_8.jpg";
			}

			/* user表 */
			HashMap<String, Object> hm1 = new HashMap<String, Object>();
			hm1.put("user_delete", 0);
			hm1.put("user_id", userid);
			hm1.put("user_name", userName);
			hm1.put("password", pwd);
			userService.insertUser(hm1);

			/* user_details表 */
			/* user_details_id,user_id,name,icon,role */
			HashMap<String, Object> hm2 = new HashMap<String, Object>();
			hm2.put("user_id", userid);
			hm2.put("name", userName);
			hm2.put("icon", storeFileUrl);
			hm2.put("role", role);
			userService.insertUserDetails(hm2);
			
			if(mulFile.getOriginalFilename()!=null && mulFile.getOriginalFilename()!="")
			{
				Map<String,Object> hashmap=new HashMap<String,Object>();
				hashmap.put("user_id", userid);
				hashmap.put("icon",storeFileUrl);
				fileInfoService.uploadFileInfo(mulFile, hashmap);//保存文件
			}
			try {
				response.sendRedirect("/TeamWork/user/getUserList.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return null;
	}

	/* 4、删除用户 */
	@ResponseBody
	@RequestMapping("/deleteUser")
	public Object deleteUser(HttpServletRequest request, HttpServletResponse response) {
		int user_id = Integer.parseInt(request.getParameter("userId"));

		System.out.println(user_id);
		
		HashMap<String, Object> hm = new HashMap<String,Object>();
		
		int isDelete = userService.deleteUserByid(user_id);
		
		if (isDelete > 0) {
			System.out.println("删除成功！");
			hm.put("status", "success");
			/*response.sendRedirect("/TeamWork/user/getUserList.do");*/
			
		} else {
			System.out.println("删除失败！");
			hm.put("status", "error");
		}
		return hm;
	}

	/* 5、得到某个用户的详情 */
	@RequestMapping("/getUserDetails")
	public String getUserDetails(HttpServletRequest request, HttpSession session) {
		int userId = Integer.parseInt(request.getParameter("userId"));
		User_details userDetails = userService.getUserDetails(userId);

		session.setAttribute("userDetails", userDetails);
		return "userDetail";
	}
	/*6、查看某用户是否存在*/
	@ResponseBody
	@RequestMapping("/haveUser")
	public Object haveUser(HttpServletRequest request) {
		String userName = request.getParameter("key");
		User user = userService.getUserByName(userName);
		
		HashMap<String, Object> hm = new HashMap<>();
		if(user != null) {
			System.out.println("存在");
			hm.put("isHave", true);
			hm.put("content", "已存在该用户！");
		}else {
			System.out.println("不存在");
			hm.put("isHave", false);
			hm.put("content", "该用户名无重复！");
		}
		return hm;
	}
	/*7、模糊查询*/
	@RequestMapping("/search")
	public String search(@RequestParam(value="pageno",defaultValue="1")Integer pageno,HttpServletRequest request, HttpSession session) {

		String key = request.getParameter("key");
		if(key != null) {
			session.setAttribute("key", key);
		}else {
			key = (String) session.getAttribute("key");
			System.out.println(key);
		}
		List<User_details> userDetailsList = userService.getUserDetailslist2(key);
		
		session.setAttribute("DishQueriedNumber", userDetailsList.size());		// 保存记录数
		session.setAttribute("pageno", pageno);									// 保存当前页数到session里
		if (userDetailsList.size() > 5) {
			if ((Integer.valueOf(pageno) - 1) * 5 + 5 <= userDetailsList.size()) {
				userDetailsList = userDetailsList.subList((Integer.valueOf(pageno) - 1) * 5,
						(Integer.valueOf(pageno) - 1) * 5 + 5);
			}
			else {
				userDetailsList = userDetailsList.subList((Integer.valueOf(pageno) - 1) * 5, userDetailsList.size());
			}
		}
		
		session.setAttribute("userDetailsList", userDetailsList);

		return "searchUser";
	}
	
	/*13、验证密码的正确与否*/
	@ResponseBody
	@RequestMapping("/isTrue")
	public Object isTrue(HttpServletRequest request) {
		String pwd = request.getParameter("key");
		int userId = Integer.parseInt(request.getParameter("userId"));
		String realPwd = userService.getPwdById(userId);
		System.out.println(realPwd);
		
		HashMap<String, Object> hm = new HashMap<>();
		if(realPwd.equals(pwd)) {
			System.out.println("密码正确");
			hm.put("isTrue", true);
			hm.put("content", "密码正确！");
		}else {
			System.out.println("密码错误");
			hm.put("isTrue", false);
			hm.put("content", "密码错误！");
		}
		return hm;
	}
}
