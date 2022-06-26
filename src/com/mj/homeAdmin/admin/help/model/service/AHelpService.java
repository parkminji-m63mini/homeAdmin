package com.mj.homeAdmin.admin.help.model.service;

import java.util.List;

import com.mj.homeAdmin.admin.help.vo.AHelp;
import com.mj.homeAdmin.help.vo.Help;

public interface AHelpService {
	
	List<AHelp> helpList(AHelp vo)  throws Exception;

	AHelp viewList(AHelp vo) throws Exception;

}
