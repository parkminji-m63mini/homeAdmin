package com.mj.homeAdmin.HomeInfo.model.vo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.HomeInfo.model.dao.HomeInfoDAO;
import com.mj.homeAdmin.HomeInfo.vo.HomeInfo;

@Service
public class HomeInfoImpl implements HomeInfoService{
	
	@Autowired
	private HomeInfoDAO dao;
	
	public HomeInfoImpl() {
		
	} 
	
	@Override
	public void insertHomeInfo(HomeInfo vo) throws Exception{
		System.out.println("임플왔나");
		dao.insertHomeInfo(vo);
	}
	
	@Override
	public HomeInfo selectHomeInfo(String id) throws Exception{
		return dao.selectHomeInfo(id);
	} 
	
	@Override
	public int updateHomeInfo(HomeInfo vo) throws Exception{
		return dao.updateHomeInfo(vo);
	}

}
