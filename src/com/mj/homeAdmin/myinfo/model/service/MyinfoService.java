package com.mj.homeAdmin.myinfo.model.service;

import java.util.List;

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
}
