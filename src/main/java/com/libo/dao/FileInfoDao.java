package com.libo.dao;

import java.util.Map;


public interface FileInfoDao {
	/**
	 * 添加文件记录
	 * @param fileInfo
	 */
	public void saveFileInfo(Map<String,Object> map);
	/**
	 * 根据id查找文件记录
	 * @param fileInfo
	 * @return
	 */
	public String getFileInfo(int user_id);
}	
