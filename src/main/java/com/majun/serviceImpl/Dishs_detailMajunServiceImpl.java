package com.majun.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majun.dao.Dishs_detailMajunDAO;
import com.majun.service.Dishs_detailMajunService;
import com.our.pojo.Dishs_detail;

@Service
public class Dishs_detailMajunServiceImpl implements Dishs_detailMajunService {

	@Autowired
	private Dishs_detailMajunDAO dishs_detailMajunDAO;

	// 查看菜品详情
	@Override
	public List<Dishs_detail> listDishs_detail() {
		// TODO 自动生成的方法存根
		return dishs_detailMajunDAO.listDishs_detail();
	}

	// 修改菜品详情
	@Override
	public int updateDishs_detail(Map map) {
		// TODO 自动生成的方法存根
		return dishs_detailMajunDAO.updateDishs_detail(map);
	}

}
