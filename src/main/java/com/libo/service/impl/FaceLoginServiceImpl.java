package com.libo.service.impl;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.libo.dao.UserLiboDao;
import com.libo.service.FaceLoginService;
import com.our.pojo.User;
import com.our.util.FaceClient;
import com.our.util.FileUtil;
import com.youhao.dao.UserAndDetailsYhDao;

@Service("faceLoginService")
public class FaceLoginServiceImpl implements FaceLoginService {
	@Autowired
	private UserAndDetailsYhDao userAndDetailsYhDao;
	@Autowired
	private UserLiboDao userLiboDao;
	@Override
	public User doFaceLogin(String base) {
		List<User> users = userAndDetailsYhDao.getUserList();
		FaceClient client = FaceClient.getInstance();
		for(User user : users){
			if(user.getFace_path() != null && !user.getFace_path().equals("")){
				//获得每一个用户的照片的base64编码的字符串
				String base1 = FileUtil.getImageStr(user.getFace_path());
				boolean login = client.faceCompare(base, base1);
				if(login){
					return user;
				}
			}
		}
		return null;
	}
	@Override
	public void writeImgToDisc(String base, String path, String urlPath,User user) {
		File uploadDir = new File(path);
		if(!uploadDir.exists() && !uploadDir.isDirectory()){
			uploadDir.mkdirs();
		}
//		path += userInfo.getUserId() + ".jpg";//d://..../ssm01/headphoto/id.jpg
		OutputStream out = null;
		InputStream in = null;
		byte[] imgByte = Base64.decodeBase64(base);//从base64加密的字符串中恢复出图像的字节数组
		for(int i = 0 ; i < imgByte.length ; i++){
			if(imgByte[i] < 0){
				imgByte[i] += 256;//调整异常数据
			}
		}
		try {
			out = new FileOutputStream(urlPath);
			in = new ByteArrayInputStream(imgByte);
			byte[] buf = new byte[1024];
			int len = 0;
			while((len = in.read(buf)) != -1){
				out.write(buf, 0 , len);
			}
//			PathDTO pathDTO = new PathDTO();
//			pathDTO.setPath(path);
//			pathDTO.setUrlPath(urlPath);
//			return pathDTO;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				in.close();
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}
	}
	@Override
	public void updateUserFace(Map<String, Object> map) {
		userLiboDao.updateFace(map);
		
	}

}
