package com.mj.homeAdmin.HomeInfo.model.vo;

import java.util.List;

import com.mj.homeAdmin.HomeInfo.vo.HomeInfo;

public interface HomeInfoService {

	
	// 집정보 입력
	public abstract void insertHomeInfo(HomeInfo vo) throws Exception;
	
	// 집정보 조회
	public abstract HomeInfo selectHomeInfo(String id) throws Exception;
	
	// 집정보 수정
	public abstract int updateHomeInfo(HomeInfo vo) throws Exception;

	 
}
