package com.mj.homeAdmin.notice.model.service;

import java.util.List;

import com.mj.homeAdmin.help.vo.Help;
import com.mj.homeAdmin.notice.vo.Notice;

public interface NoticeService {

	public abstract int listCnt(Notice vo)throws Exception;

	public abstract List<Notice> NoticeList(Notice vo)throws Exception;


}
