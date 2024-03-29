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
	
	public List<ManageM> manageElNow(ManageM vo) {
		return sqlSession.selectList("manageMapper.manageElNow", vo);
	}
	public void insertMEL(ManageM vo) {
		sqlSession.insert("manageMapper.insertMEL", vo);
		
	}

	public List<ManageM> elNP(ManageM vo) {
		return sqlSession.selectList("manageMapper.elNP", vo);
	}
	public List<ManageM> elPassSame(ManageM vo) {
		return sqlSession.selectList("manageMapper.elPassSame", vo);
	}
	public List<ManageM> elNP6m(ManageM vo) {
		return sqlSession.selectList("manageMapper.elNP6m", vo);
	}
	public List<ManageM> elNP12m(ManageM vo) {
		return sqlSession.selectList("manageMapper.elNP12m", vo);
	}
	public String chkDE(ManageM vo) {
		return sqlSession.selectOne("manageMapper.chkDE", vo);
	}
	public void updateTelM(ManageM vo) {
		sqlSession.update("manageMapper.updateTelM", vo);
		
	}
	public String newUpel(ManageM vo) {
		return sqlSession.selectOne("manageMapper.newUpel", vo);
		
	}

	public void updateEl(ManageM vo) {
		sqlSession.update("manageMapper.updateEl", vo);
		
	}
	public void allUpdateEl(ManageM vo) {
		sqlSession.update("manageMapper.allUpdateEl", vo);
		
	}
	
	
	
	public List<ManageM> manageMaNow(ManageM vo) {
		return sqlSession.selectList("manageMapper.manageMaNow", vo);
	}
	public void insertMMa(ManageM vo) {
		sqlSession.insert("manageMapper.insertMMa", vo);
		
	}
	public void updateMm(ManageM vo) {
		sqlSession.update("manageMapper.updateMm", vo);
		
	}

	public String manageMaNowSum(ManageM vo) {
		return sqlSession.selectOne("manageMapper.manageMaNowSum", vo);
	}

	public void deleteMm(ManageM vo) {
		sqlSession.delete("manageMapper.deleteMm", vo);
	}
	public List<ManageM> MmNP(ManageM vo) {
		return sqlSession.selectList("manageMapper.MmNP", vo);
	}

	public List<ManageM> mMPassSame(ManageM vo) {
		return sqlSession.selectList("manageMapper.mMPassSame", vo);
	}
	public String chkDM(ManageM vo) {
		return sqlSession.selectOne("manageMapper.chkDM", vo);
	}

	public void insertMMm(ManageM vo) {
		sqlSession.insert("manageMapper.insertMMm", vo);
	}
	
	public void updateTMm(ManageM vo) {
		sqlSession.update("manageMapper.updateTMm", vo);
		
	}
	public List<ManageM> mMNP12m(ManageM vo) {
		return sqlSession.selectList("manageMapper.mMNP12m", vo);
	}
	public String sumMa(ManageM vo) {
		return sqlSession.selectOne("manageMapper.sumMa", vo);
	}
	
	
	
	
	
	
	public List<ManageM> manageWaNow(ManageM vo) {
		return sqlSession.selectList("manageMapper.manageWaNow", vo);
	}
	public void insertMWA(ManageM vo) {
		sqlSession.insert("manageMapper.insertMWA", vo);
		
	}

	public List<ManageM> waNP(ManageM vo) {
		return sqlSession.selectList("manageMapper.waNP", vo);
	}
	public List<ManageM> waPassSame(ManageM vo) {
		return sqlSession.selectList("manageMapper.waPassSame", vo);
	}
	public List<ManageM> waNP6m(ManageM vo) {
		return sqlSession.selectList("manageMapper.waNP6m", vo);
	}
	public List<ManageM> waNP12m(ManageM vo) {
		return sqlSession.selectList("manageMapper.waNP12m", vo);
	}
	public String chkDW(ManageM vo) {
		return sqlSession.selectOne("manageMapper.chkDW", vo);
	}
	public void updateTwaM(ManageM vo) {
		sqlSession.update("manageMapper.updateTwaM", vo);
		
	}
	public String newUpwa(ManageM vo) {
		return sqlSession.selectOne("manageMapper.newUpwa", vo);
		
	}

	public void updateWa(ManageM vo) {
		sqlSession.update("manageMapper.updateWa", vo);
		
	}
	public void allUpdateWa(ManageM vo) {
		sqlSession.update("manageMapper.allUpdateWa", vo);
		
	}

	
	
}
