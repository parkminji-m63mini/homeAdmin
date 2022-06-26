package com.mj.homeAdmin.myinfo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.checkList.vo.checkList;
import com.mj.homeAdmin.myinfo.model.dao.MyinfoDAO;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;

@Service
public class MyinfoServiceImpl implements MyinfoService {

	@Autowired
	private MyinfoDAO dao;
	
	public MyinfoServiceImpl(){	}

	public String checkPw(MyinfoVo vo)   throws Exception{
		String chkPw = dao.checkPw(vo);
		return chkPw;
	}

	public void signUp(MyinfoVo vo)   throws Exception {
		dao.signUp(vo);
		
	}

	public List<MyinfoVo> selectUser(MyinfoVo vo)  throws Exception{
		return dao.selectUser(vo);
	}

	public List<MyinfoVo> selectCode(MyinfoVo vo)   throws Exception {
		return dao.selectCode(vo);
	}

	public List<MyinfoVo> selectCode3(MyinfoVo vo)  throws Exception {
		return dao.selectCode3(vo);
	}

	@Override
	public String idChk(MyinfoVo vo) throws Exception {
		return dao.idChk(vo);
	}
	
	@Override
	public String getHomeImg(String id) {
		// TODO Auto-generated method stub
		return dao.getHomeImg(id);
	}

	@Override
	public List<checkList> getCheckList(String id) {
		// TODO Auto-generated method stub
		return dao.getCheckList(id);
	}
	@Override
	public MyinfoVo mypage(MyinfoVo vo) throws Exception {
		return dao.mypage(vo);
	}

	@Override
	public void updateMyInfo(MyinfoVo vo) throws Exception {
		dao.updateMyInfo(vo);
	}
}
