package com.mj.homeAdmin.food.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.food.model.dao.FoodDAO;
import com.mj.homeAdmin.food.vo.Food;

@Service
public class FoodServiceImpl implements FoodService{
	@Autowired
    private FoodDAO dao;
    
	@Autowired
    private CmmnServiceImpl myutil;
	
	public FoodServiceImpl() {
		
	}

	@Override
	public String frFind(Food vo) throws Exception {
		
		
		String chk = dao.frFind(vo);

//		int result = 0;
//		if(chk !=null) {
//			result = 1;
//		}else {
//		}
//		System.out.println(result +" result 출력 ");
		
		return chk;
	}

	@Override
	public void insertType(Food vo) throws Exception {
		dao.insertType(vo);
	}

	@Override
	public List<Food> selectFr(Food vo) throws Exception {
		
		List<Food> arrList = dao.selectFr(vo);
		
		
		return arrList;
	}

	@Override
	public int frJidx(Food vo) throws Exception {
		return dao.frJidx(vo);
	}

	@Override
	public void fr01Insert(Food vo) throws Exception {
		
		System.out.println(vo.getFnmL().length + " : 숫자확인");
		
		for (int i=0; i<vo.getFnmL().length; i++) {
			
			String[] fnm = vo.getFnmL();
			String[] area = vo.getfAreaL();
			String[] price = vo.getPriceL();
			String[] bDt = vo.getBdtL();
			String[] fdt = vo.getFdtL();
			String[] vm = vo.getVmL();
			
			if(fnm[i] != "") {
			
				vo.setFnm(fnm[i]);
				vo.setArea(area[i]);
				vo.setPrice(price[i]);
				vo.setBdt(bDt[i]);
				vo.setFdt(fdt[i]);
				vo.setVm(vm[i]);
				dao.fr01Insert(vo);
				
			}
				
			
		}
		
	}

}
