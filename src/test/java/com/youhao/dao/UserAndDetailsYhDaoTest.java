package com.youhao.dao;

import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.our.pojo.User_details;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:config/application-*.xml")
public class UserAndDetailsYhDaoTest {

	/**
	 * 自动装配待测试接口DAO
	 */
	@Autowired
	private UserAndDetailsYhDao uADDao;
	
	
	/*1、查询所有用户详情*/
//	@Test
	public void getUserDetailsList() {
		List<User_details> userDetailsList = uADDao.getUserDetailsList();
		
		for (User_details user_details : userDetailsList) {
			System.out.println(user_details);
		}
	}
	
	/*3、根据user_id查询某一用户详细信息*/
//	@Test
	public void getUserDetails() {
		User_details userDetails = uADDao.getUserDetails(9);
		System.out.println(userDetails);
	}
	
	/*3、修改用户icon、role、密码*/
//	@Test
	public void UpdateUserPwd() {
		HashMap<String, Object> hm1 = new HashMap<>();
		hm1.put("pwd", "1180399021");
		hm1.put("user_id", 9);
		
		/*更改密码*/
		int isUpdatePwd = uADDao.updateUserPwd(hm1);
		
		if(isUpdatePwd>0) {
			System.out.println("修改用户密码成功");
		}else {
			System.out.println("修改用户密码失败");
		}
		
		HashMap<String, Object> hm2 = new HashMap<>();
		hm2.put("icon", "hksadbfcakv");
		hm2.put("role", 3);
		hm2.put("udid", 9);
		
		/*更改头像和角色*/
		int isUpdateIandR = uADDao.updateUserDetails(hm2);
		
		if(isUpdateIandR>0) {
			System.out.println("修改用户详情成功");
		}else {
			System.out.println("修改用户详情失败");
		}
	}
	
	/*4、通过user_id删除用户*/
//	@Test
	public void deleteUserByid() {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("user_delete", 1);
		hm.put("user_id", 9);
		int isDelete =  uADDao.deleteUserByid(hm);
		if(isDelete>0) {
			System.out.println("假删除成功！");
		}else {
			System.out.println("假删除失败");
		}
	}
	
	/*5、在user表中查找user_id列的最大值*/
//	@Test
	public void getMaxUserId() {
		int maxUserId = uADDao.getMaxUserId();
		System.out.println(maxUserId);
	}
	
	/*6、在user表中插入一条记录*/
//	@Test
	public void insertUser() {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("user_delete", 0);
		hm.put("user_id", 11);
		hm.put("user_name", "王五");
		hm.put("password", 123456);
		
		int isInsert = uADDao.insertUser(hm);
		if(isInsert>0) {
			System.out.println("插入成功！");
		}else {
			System.out.println("插入失败！");
		}
	}
	
	/*7、在user_details表中插入一条记录*/
	@Test
	public void insertUserDetails() {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("user_details_id", 11);
		hm.put("user_id", 11);
		hm.put("name", "王五");
		hm.put("icon", "scdvsdvsd");
		hm.put("role", 3);
		
		int isInsert = uADDao.insertUserDetails(hm);
		if(isInsert>0) {
			System.out.println("插入成功！");
		}else {
			System.out.println("插入失败！");
		}
	}
	
	
	
	
	
	
	
}
