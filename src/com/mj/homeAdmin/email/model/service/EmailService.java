package com.mj.homeAdmin.email.model.service;



import java.io.Serializable;

import com.mj.homeAdmin.email.vo.Email;


public interface EmailService extends Serializable {
	
	public void snedMail(Email vo);
	
	
}
