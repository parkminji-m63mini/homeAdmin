package com.mj.homeAdmin.myinfo.model.service;

import java.util.List;

import com.mj.homeAdmin.checkList.vo.checkList;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;

public interface MyinfoService {

	  public abstract String checkPw(MyinfoVo vo)
		        throws Exception;
	  public abstract void signUp(MyinfoVo vo)
		        throws Exception;
	  public abstract List<MyinfoVo> selectCode(MyinfoVo vo)
		        throws Exception;
	  public abstract List<MyinfoVo> selectCode3(MyinfoVo vo)
		        throws Exception;
	public abstract List<MyinfoVo> selectUser(MyinfoVo vo)
			 throws Exception;
	public abstract String idChk(MyinfoVo vo) throws Exception;
	
	String getHomeImg(String id);
	public abstract List<checkList> getCheckList(String id);
	
	public abstract MyinfoVo mypage(MyinfoVo vo) throws Exception;
	public abstract void updateMyInfo(MyinfoVo vo) throws Exception;
}
