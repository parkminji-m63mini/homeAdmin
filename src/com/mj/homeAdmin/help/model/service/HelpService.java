package com.mj.homeAdmin.help.model.service;

import java.util.List;

import com.mj.homeAdmin.help.vo.Help;

public interface HelpService {

	public abstract void submitHelp(Help vo) throws Exception;

	public abstract List<Help> helpList(Help vo)throws Exception;

	public abstract int listCnt(Help vo)throws Exception;

	public abstract List<Help> helpView(Help vo)throws Exception;

}
