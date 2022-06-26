package com.mj.homeAdmin.admin.notice.model.service;

import java.util.List;

import com.mj.homeAdmin.admin.notice.vo.ANotice;

public interface ANoticeSerivce {

	List<ANotice> noticeList(ANotice vo) throws Exception;

}
