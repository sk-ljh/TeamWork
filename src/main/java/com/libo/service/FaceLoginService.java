package com.libo.service;

import java.util.Map;

import com.our.pojo.User;

public interface FaceLoginService {
	public User doFaceLogin(String base);
	public void writeImgToDisc(String base, String path,String urlPath, User user);
	public void updateUserFace(Map<String,Object> map);
}
