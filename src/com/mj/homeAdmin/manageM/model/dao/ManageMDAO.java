// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ManageMDAO.java

package com.mj.homeAdmin.manageM.model.dao;

import com.mj.homeAdmin.manageM.vo.ManageM;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManageMDAO
{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

    public ManageMDAO()
    {
    }

    public  List<ManageM> manageList(ManageM vo)
    {
        return sqlSession.selectList("manageMapper.manageList", vo);
    }

    public void insertMAll(ManageM vo)
    {
        sqlSession.insert("manageMapper.insertMAll", vo);
    }

    public void updateMAll(ManageM vo)
    {
        sqlSession.update("manageMapper.updateMAll", vo);
    }

	public List<ManageM> manageNP(ManageM vo) {
		return sqlSession.selectList("manageMapper.manageNP", vo);
	}

}
