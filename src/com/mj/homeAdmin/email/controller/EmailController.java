package com.mj.homeAdmin.email.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mj.homeAdmin.email.model.service.EmailService;
import com.mj.homeAdmin.email.vo.Email;
import com.sun.javafx.sg.prism.NGShape.Mode;


@RequestMapping("email/*")
@Controller
public class EmailController {

	@Autowired
	private EmailService emailService;

	
	
	//@Scheduled(cron = "0 40 10 17 6 *")
	@RequestMapping("send.do")
	public String send(@ModelAttribute Email vo, Model model) {
		try {
			vo.setSubject("제목");
			emailService.snedMail(vo);
			
			model.addAttribute("message", "성공");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "실패");
		}
		return "/email/write";
	}
}
