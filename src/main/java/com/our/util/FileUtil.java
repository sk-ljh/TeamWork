package com.our.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.web.multipart.MultipartFile;


public class FileUtil {
	/**
	 * 根据日期产生一个随机数
	 * @return
	 */
	public static String createRandomFileName(){
		String format = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		return format;
	}
	/**
	 * 将文件写入磁盘
	 * @throws IOException 
	 */
	public static void writeFileToDisc(Map<String,Object> hashMap,MultipartFile file) throws IOException{
		String Path="D:/tomcat_upload/userimg/"+(String) hashMap.get("icon");
		FileOutputStream fos = new FileOutputStream(new File(Path));
		fos.write(file.getBytes());
		fos.flush();
		fos.close();
	}
	
	public static void main(String[] args) {
		System.out.println(FileUtil.createRandomFileName());
	}
	
	/**
	 * 根据path得到图片的base64编码的字符串
	 * @param userFacePath 图片路径
	 * @return base64编码之后的字符串
	 */
	public static String getImageStr(String userFacePath){
		FileInputStream fis = null;
		byte[] buf;
		try {
			fis = new FileInputStream(new File(userFacePath));
			buf = new byte[fis.available()];
			fis.read(buf);
			return Base64.encodeBase64String(buf);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				fis.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
		
		
	}
}
