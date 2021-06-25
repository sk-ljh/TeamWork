package com;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.libo.dao.FileInfoDao;
import com.libo.dao.UserLiboDao;
import com.libo.service.FileInfoService;
import com.our.pojo.User;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:config/application-*.xml")
public class getUserFromNameTest {
		@Autowired
		FileInfoService file;
		@Autowired
		private UserLiboDao userLiboDao;
		@Autowired
		private FileInfoDao fileInfoDao;
		@Test
		public void testListDepartmentInfo(){
			User user=userLiboDao.getUserFromName("libo");
			System.out.print(user);
		}
//		@Test
		public void test(){
			Map<String,Object> hashmap=new HashMap<String,Object>();
			hashmap.put("user_id", 7);
			hashmap.put("icon","好的");
			System.out.print(hashmap);
			fileInfoDao.saveFileInfo(hashmap);
			
		}
		

	

}
