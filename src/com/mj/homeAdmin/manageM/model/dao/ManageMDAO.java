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

	public List<ManageM> manageListP12(ManageM vo) {
		return sqlSession.selectList("manageMapper.manageListP12", vo);
	}

	
	public void insertMGAS(ManageM vo) {
		sqlSession.insert("manageMapper.insertMGAS", vo);
		
	}

	public int manageIndex(ManageM vo) {
		return sqlSession.selectOne("manageMapper.manageIndex", vo);
		}
	
	public String manageIndexS(ManageM vo) {
		return sqlSession.selectOne("manageMapper.manageIndexS", vo);
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

	public String newUp(ManageM vo) {
		return sqlSession.selectOne("manageMapper.newUp", vo);
		
	}

	public List<ManageM> managePassSame(ManageM vo) {
		return sqlSession.selectList("manageMapper.managePassSame", vo);
	}

	public String chkD(ManageM vo) {
		return sqlSession.selectOne("manageMapper.chkD", vo);
		
	}

	public List<ManageM> gasNP12m(ManageM vo) {
		return sqlSession.selectList("manageMapper.gasNP12m", vo);
	}

	public String chkDG(ManageM vo) {
		return sqlSession.selectOne("manageMapper.chkDG", vo);
	}

	public List<ManageM> gasPassSame(ManageM vo) {
		return sqlSession.selectList("manageMapper.gasPassSame", vo);
	}
	
	//--- 인터넷 시작
	
	public List<ManageM> manageItNow(ManageM vo) {
		return sqlSession.selectList("manageMapper.manageItNow", vo);
	}
	
	public void insertMIT(ManageM vo) {
		sqlSession.insert("manageMapper.insertMIT", vo);
		
	}
	public void allUpdateIt(ManageM vo) {
		sqlSession.update("manageMapper.allUpdateIt", vo);
		
	}
	
	public void updateTItM(ManageM vo) {
		sqlSession.update("manageMapper.updateTItM", vo);
		
	}
	public List<ManageM> itNP(ManageM vo) {
		return sqlSession.selectList("manageMapper.itNP", vo);
	}
	
	public String chkDI(ManageM vo) {
		return sqlSession.selectOne("manageMapper.chkDI", vo);
	}

	public List<ManageM> itNP12m(ManageM vo) {
		return sqlSession.selectList("manageMapper.itNP12m", vo);
	}
	
	public List<ManageM> itPassSame(ManageM vo) {
		return sqlSession.selectList("manageMapper.itPassSame", vo);
	}

}
