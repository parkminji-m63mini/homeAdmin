package com.mj.homeAdmin.visit.model.service;


import java.util.List;

import com.mj.homeAdmin.visit.vo.Visit;

public interface VisitService {


	public abstract String findNm(Visit vo) throws Exception;

	public abstract void insertVisit(Visit vo) throws Exception;

	public abstract List<Visit> visitList(Visit vo) throws Exception;

	public abstract void delete(Visit vo) throws Exception;

	public abstract List<Visit> mainVistList(String id);
}
