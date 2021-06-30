package com.youhao.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.our.pojo.User;
import com.our.pojo.User_details;
import com.youhao.dao.UserAndDetailsYhDao;
import com.youhao.service.UserYouhaoService;

@Service
public class UserYouhaoServicelmpl implements UserYouhaoService {

	@Autowired
	private UserAndDetailsYhDao userADDao;

	/* 1、得到所有没有被假删除的userList */
	@Override
	public List<User> getUserList() {
		return userADDao.getUserList();
	}

	/* 2、得到用户详情列表 */
	@Override
	public List<User_details> getUserDetailsList() {
		return userADDao.getUserDetailsList();
	}

	/* 3、根据user_id查询某一用户详细信息 */
	@Override
	public User_details getUserDetails(int user_id) {
		return userADDao.getUserDetails(user_id);
	}

	/* 4、更新用户详情表中的icon和role */
	@Override
	public int updateUserDetails(HashMap<String, Object> hm) {
		return userADDao.updateUserDetails(hm);
	}

	/* 5、更新用户表中的密码 */
	@Override
	public int updateUserPwd(HashMap<String, Object> hm) {
		return userADDao.updateUserPwd(hm);
	}

	/* 6、通过user_id假删除用户 */
	@Override
	public int deleteUserByid(int user_id) {
		return userADDao.deleteUserByid(user_id);
	}

	/* 7、在user表中查找user_id列的最大值 */
	@Override
	public int getMaxUserId() {
		return userADDao.getMaxUserId();
	}

	/* 8、向user表中插入一条记录 */
	@Override
	public int insertUser(HashMap<String, Object> hm) {
		return userADDao.insertUser(hm);
	}

	/* 9、在user_details表中插入一条数据 */
	@Override
	public int insertUserDetails(HashMap<String, Object> hm) {
		return userADDao.insertUserDetails(hm);
	}

	/* 10、通过user_name查找用户的删除状态 */
	@Override
	public User getUserByName(String name) {
		return userADDao.getUserByName(name);
	}

	/* 11、模糊查询 */
	@Override
	public List<User_details> getUserDetailslist2(String key){
		return userADDao.getUserDetailslist2(key);
	}

	/*12、得到没有被删除的且不是管理员的用户列表*/
	@Override
	public List<User_details> getUserDetailslist3(){
		return userADDao.getUserDetailslist3();
		
	}

	/*13、通过userid获得密码*/
	@Override
	public String getPwdById(int userId) {
		return userADDao.getPwdById(userId);
	}
	
	/*14、通过user_id查找user_name*/
	@Override
	public String getUsernameById(int userId) {
		return userADDao.getUsernameById(userId);
	}
}
