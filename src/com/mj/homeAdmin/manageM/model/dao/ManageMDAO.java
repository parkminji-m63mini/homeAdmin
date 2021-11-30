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

	public List<ManageM> manageListP3(ManageM vo) {
		return sqlSession.selectList("manageMapper.manageListP3", vo);
	}

	public void insertMGAS(ManageM vo) {
		sqlSession.insert("manageMapper.insertMGAS", vo);
		
	}

	public int manageIndex(ManageM vo) {
		return sqlSession.selectOne("manageMapper.manageIndex", vo);
		}

	public List<ManageM> manageGasNow(ManageM vo) {
		return sqlSession.selectList("manageMapper.manageGasNow", vo);
	}

	public void updateGas(ManageM vo) {
		sqlSession.update("manageMapper.updateGas", vo);
	}

	public void updateMGas(ManageM vo) {
		sqlSession.update("manageMapper.updateMGas", vo);
	}

	public void updateGchk(ManageM vo) {
		sqlSession.update("manageMapper.updateGchk", vo);
		
	}

	public void updateTgasM(ManageM vo) {
		sqlSession.update("manageMapper.updateTgasM", vo);
		
	}

	public void updateGchkA(ManageM vo) {
		sqlSession.update("manageMapper.updateGchkA", vo);
		
	}

	public void updateGasNum(ManageM vo) {
		sqlSession.update("manageMapper.updateGasNum", vo);
	}

	public void updatepNum(ManageM vo) {
		
	}

	public void allUpdateGas(ManageM vo) {
		sqlSession.update("manageMapper.allUpdateGas", vo);
		
	}

	public List<ManageM> gasNP(ManageM vo) {
		return sqlSession.selectList("manageMapper.gasNP", vo);
	}

	public List<ManageM> gasNP6m(ManageM vo) {
		return sqlSession.selectList("manageMapper.gasNP6m", vo);
	}
	

}
