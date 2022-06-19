package com.mj.homeAdmin.email.model.service;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.email.vo.Email;

@Service
public class EmailServiceImpl implements EmailService{

	@Autowired
	JavaMailSender mailSender;
	

	
	public void snedMail(Email vo) {
		try {
			System.out.println("---------------메일전송시작-------------");
			// 이메일 객체
			MimeMessage message = mailSender.createMimeMessage();
			
			message.addRecipient(RecipientType.TO, new InternetAddress(vo.getToMail()));
			message.addFrom(new InternetAddress[] {new InternetAddress(vo.getFromMail(), vo.getFromUser()) });
			message.setSubject(vo.getSubject(), "utf-8");
			message.setText(vo.getMessage(), "utf-8");
			System.out.println("---------------메일전송시작22-------------");
			mailSender.send(message);
			System.out.println("---------------메일전송시작33-------------");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}


	
}
