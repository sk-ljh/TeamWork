package com.libo.service.impl;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.libo.dao.FileInfoDao;
import com.libo.service.FileInfoService;
import com.our.util.FileUtil;

@Service("fileInfoService")
public class FileInfoServiceImpl implements FileInfoService {
	@Autowired
	private FileInfoDao fileInfoDao;
	
	@Override
	public void uploadFileInfo(MultipartFile file,Map<String,Object> hashMap) {
		try {
			//1.文件本身写到磁盘上
			FileUtil.writeFileToDisc(hashMap, file);
			//2.DO对象保存到数据库中
			fileInfoDao.saveFileInfo(hashMap);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
