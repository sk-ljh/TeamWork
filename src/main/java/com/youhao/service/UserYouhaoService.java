package com.youhao.service;

import java.util.HashMap;
import java.util.List;

import com.our.pojo.User;
import com.our.pojo.User_details;

public interface UserYouhaoService {
	/* 1、得到所有没有被假删除的userList */
	public List<User> getUserList();

	/* 2、得到用户详情列表 */
	public List<User_details> getUserDetailsList();

	/* 3、根据user_id查询某一用户详细信息 */
	public User_details getUserDetails(int user_id);

	/* 4、更新用户详情表中的icon和role */
	public int updateUserDetails(HashMap<String, Object> hm);

	/* 5、更新用户表中的密码 */
	public int updateUserPwd(HashMap<String, Object> hm);

	/* 6、通过user_id假删除用户 */
	public int deleteUserByid(int user_id);

	/* 7、在user表中查找user_id列的最大值 */
	public int getMaxUserId();

	/* 8、向user表中插入一条记录 */
	public int insertUser(HashMap<String, Object> hm);

	/* 9、在user_details表中插入一条数据 */
	public int insertUserDetails(HashMap<String, Object> hm);

	/* 10、通过user_name查找用户的删除状态 */
	public User getUserByName(String name);
	
	/* 11、模糊查询 */
	public List<User_details> getUserDetailslist2(String key);
	
	/*12、得到没有被删除的且不是管理员的用户列表*/
	public List<User_details> getUserDetailslist3();
	
	/*13、通过userid获得密码*/
	public String getPwdById(int userId);
	
	/*14、通过user_id查找user_name*/
	public String getUsernameById(int userId);
}
