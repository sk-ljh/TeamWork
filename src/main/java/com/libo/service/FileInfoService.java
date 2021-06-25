package com.libo.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;



public interface FileInfoService {
	public void uploadFileInfo(MultipartFile file,Map<String,Object> hashMap);
}
