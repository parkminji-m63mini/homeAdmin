package com.mj.homeAdmin.admin.userManage.model.service;

import java.util.List;

import com.mj.homeAdmin.admin.userManage.vo.UserManage;
import com.mj.homeAdmin.notice.vo.Notice;

public interface UserManageSerivce {

	int listCnt(UserManage vo) throws Exception;

	List<UserManage> userList(UserManage vo) throws Exception;
}
