package com.mj.homeAdmin.myinfo.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mj.homeAdmin.checkList.vo.checkList;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;
import com.sun.org.apache.regexp.internal.recompile;

@Repository
public class MyinfoDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MyinfoDAO() {}

	public String checkPw(MyinfoVo vo) {
		return sqlSession.selectOne("myinfoMapper.checkPw", vo);
	}

	public void signUp(MyinfoVo vo) {
		sqlSession.insert("myinfoMapper.signUp", vo);
	}

	public List<MyinfoVo> selectUser(MyinfoVo vo) {
		return sqlSession.selectList("myinfoMapper.selectUser", vo);
	}

	public List<MyinfoVo> selectCode(MyinfoVo vo) {
		return sqlSession.selectList("myinfoMapper.selectCode", vo);
	}
	public List<MyinfoVo> selectCode3(MyinfoVo vo) {
		return sqlSession.selectList("myinfoMapper.selectCode3", vo);
	}

	public String idChk(MyinfoVo vo) {
		return sqlSession.selectOne("myinfoMapper.idChk", vo);
	}

	public String getHomeImg(String id) {
		
		return sqlSession.selectOne("myinfoMapper.getHomeImg", id);
	}

	public List<checkList> getCheckList(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("checkListMapper.selectCheckList", id);
	}
	public MyinfoVo mypage(MyinfoVo vo) {
		return sqlSession.selectOne("myinfoMapper.mypage", vo);
	}

	public void updateMyInfo(MyinfoVo vo) {
		sqlSession.update("myinfoMapper.updateMyInfo", vo);
		
	}
}
