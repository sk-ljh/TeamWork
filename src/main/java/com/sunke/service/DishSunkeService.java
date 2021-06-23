package com.sunke.service;
import java.util.HashMap;
import java.util.List;


import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.our.pojo.*;
import com.sunke.dao.DishSunkeDao;
import com.sunke.entity.QueryInfo;
public interface DishSunkeService {
	
	public HashMap<String,Object>  getOneTypeDish(@RequestBody QueryInfo qinfo);
	public List<String>  getCate(); 
	
}
