package com.mj.homeAdmin.myinfo.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.comm.BCryptTest;
import com.mj.homeAdmin.comm.JavaUtil;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.manageM.model.service.ManegeMService;
import com.mj.homeAdmin.manageM.vo.ManageM;
import com.mj.homeAdmin.myinfo.model.service.MyinfoService;
import com.mj.homeAdmin.myinfo.model.service.MyinfoServiceImpl;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;
import com.mj.homeAdmin.visit.model.service.VisitService;
import com.mj.homeAdmin.visit.vo.Visit;
import com.sun.org.apache.regexp.internal.RE;
import com.mj.homeAdmin.checkList.model.service.checkListService;
import com.mj.homeAdmin.checkList.vo.checkList;

@Controller
@RequestMapping("/my/*")
public class MyinfoController {

	@Autowired
	private MyinfoService ms;
   
	@Autowired
	private checkListService checkListService;

	@Autowired
	private ManegeMService manageService;
	
	@Autowired
	private VisitService visitService;
	@Autowired
	private BCryptTest by;
	
	@Autowired
	private CmmnServiceImpl cm;
	
	@Autowired
	private CmmnServiceImpl myutil;
	
	public MyinfoController() {
		
	}
	
	/** ????????? ????????? ??????
	 * @return
	 */
	@RequestMapping("login.do")
	public String login() {
		
		
		return "myinfo/login";
	}
	
	
	// ?????????
	 @RequestMapping(value="loginGo.do", produces = "application/json; charset=utf-8")
	public String loginGo(MyinfoVo vo, Model model, HttpSession ss, HttpServletRequest req) throws Exception{
		
		String result ="false";
		
			boolean chk = by.checkPw(vo);
			
	if(chk == true) {
		result ="true";
		
		//????????? ????????? ??????????????????
		// ????????????
		 List<MyinfoVo> user = ms.selectUser(vo);
		 
		 
		 
		
		 // ????????? ????????? ??????
		 // ??? ?????????
		 String homeImg = ms.getHomeImg(user.get(0).getId());
		 // ???????????????
		 System.out.println("??????");
		 List<checkList> checkList = checkListService.selectCheckList(user.get(0).getId());
		 List<checkList> checkListDetail = checkListService.selectCheckListDetail(user.get(0).getId());
	
		 // ????????? ??????vs??????
		 
		 String flag = "false";
		 ManageM manageVo = new ManageM();
		 manageVo.setuId(user.get(0).getId());
		 String	yyyy= "" + LocalDate.now().getYear();
         String mm= JavaUtil.checkMM(""+LocalDate.now().getMonthValue(), "0");
        
        // ???????????? ????????? ?????????
        manageVo.setgChk(flag);
        
        
        manageVo.setYyyy(yyyy);
        manageVo.setMm(mm);
         System.out.println("manageVo.getuId()  " + manageVo.getuId());
         System.out.println("manageVo.getuId()  " + manageVo.getYyyy());
         System.out.println("manageVo.getuId()  " + manageVo.getMm());
        // ?????????
        List<ManageM> arrViewNow = manageService.manageIndex(manageVo);
        
        //-------------------------------//
        // ?????????, ????????? ??????
 
        manageVo.setMm2(JavaUtil.checkMM(mm, "1"));
        manageVo.setYyyy2(JavaUtil.checkYYYY(yyyy, mm, "1"));
        
        List<ManageM> arrViewPast = manageService.manageNP(manageVo);
        
        // ?????????
		 List<Visit> visitList = visitService.mainVistList(user.get(0).getId());
		
		 vo.setId(user.get(0).getId());
		 vo.setNm(user.get(0).getNm());
		 vo.setnNm(user.get(0).getnNm());
		 vo.setGb(user.get(0).getGb());
	//	 System.out.println(user.get(0).getNm() + " ????????? ???");
	//	 System.out.println(vo.getNm() + " vo???");
		 
		// ????????? ??????
		cm.goSessionChk(vo, ss, req);
		cm.getSessionChk(ss);
		model.addAttribute("user" ,vo);
		model.addAttribute("homeImg", homeImg);
		model.addAttribute("checkList", checkList);
		model.addAttribute("checkListDetail", checkListDetail);
		model.addAttribute("arrViewNow", arrViewNow);
        model.addAttribute("arrViewPast", arrViewPast);
        model.addAttribute("visitList", visitList);
	//	System.out.println(ss.getAttribute("ssNM") + " ?????? ??????");
	}	
		
	return "../../main" ;
	}
	
	// ???????????? ?????????
		@RequestMapping("join.do")
		public String join(MyinfoVo vo) throws Exception{
			return "myinfo/join";
		}
			
		// ????????????  ?????? or ??????
		@RequestMapping("signUp.do")
		public String signUp(MyinfoVo vo) throws Exception{
			
			// ?????? ??????
			vo.setGb('1');
			vo.setLtype("1");
			vo.setHtype("1");

			// ???????????? ?????? ?????????
			String pw = by.encry(vo.getPw());
			vo.setPw(pw);
			
			ms.signUp(vo);
			
			
			
			return "../../main";
		}	
		
		
		@ResponseBody
		 @RequestMapping(value="logoutGo.do", produces = "application/json; charset=utf-8")
			public String logoutGo(MyinfoVo vo, Model model, HttpSession ss, HttpServletRequest req) throws Exception{
				
			String result = "false";
			
			  ss.removeAttribute("ssID");
			  ss.removeAttribute("ssNM");
			  ss.removeAttribute("ssnNM");
			  ss.removeAttribute("ssGB");
			  ss.removeAttribute("ssIP");
			
			  result = "true";
			return result ;
			}
		
		/** ????????? ???????????? (2??? ??????)
		 * @return
		 */
		@RequestMapping("code.do")
		public String code(MyinfoVo vo, Model model) throws Exception{

			System.out.println(vo.getCd() + " ??????");
			List<MyinfoVo>list =  ms.selectCode(vo);
			
			model.addAttribute("list" ,list);
			model.addAttribute("cd" ,vo.getCd());
			
			System.out.println(list.get(0));
			return "myinfo/code";
		}
		
		/** ????????? ???????????? (3??? ??????)
		 * @return
		 */
		@RequestMapping("code3.do")
		public String code3(MyinfoVo vo, Model model) throws Exception{

			System.out.println(vo.getCd() + " ??????");
			System.out.println(vo.getScd() + " ??????");
			List<MyinfoVo>list =  ms.selectCode3(vo);
			
			model.addAttribute("list" ,list);
			model.addAttribute("cd" ,vo.getCd());
			
			System.out.println(list.get(0));
			return "myinfo/code";
		}
		
		
		@RequestMapping("mypage.do")
		public String mypage(MyinfoVo vo, Model model,HttpSession ss,  RedirectAttributes rdAttr, HttpServletResponse response) throws Exception{
			
			//???????????? ????????????
			vo.setId((String)ss.getAttribute("ssID"));
			
			MyinfoVo list = ms.mypage(vo);
			
			model.addAttribute("list" ,list);
			return "myinfo/mypage";
		}
		
		@RequestMapping("update.do")
		public void update(MultipartFile[] photo2, MyinfoVo vo, Model model,HttpSession ss,  RedirectAttributes rdAttr, HttpServletResponse response, HttpServletResponse res) throws Exception{
			
			System.out.println(vo.getPhoto() + "/" + vo.getCd() + " ??????");
			
			//???????????? ????????????
			vo.setId((String)ss.getAttribute("ssID"));
			
			
			int chkFile = 1;
			for(MultipartFile multipartFile : photo2) {
	 			if(multipartFile.isEmpty()) chkFile = 0;
			}
			
			
			 //----------- ?????? ????????? --------------------
			 String uploadFolder = myutil.fielUrl("myInfo");
			 
			 String fileNm = "";
			
			 if(chkFile == 1) {
				 
				 
				 // ?????? ?????? ??????
				 Path filePath = Paths.get(myutil.defalutFielUrl() + vo.getPhoto());
				 
				 System.out.println(filePath + "    //filePa");
			//	 Path directoryPath = Paths.get("d:\\example");        
				 try {            
					 // ?????? ??????          
					 Files.delete(filePath);             
					 
					 // ???????????? ??????          
			//		 Files.delete(directoryPath);                   
					} catch (NoSuchFileException e) {           
						System.out.println("??????????????? ??????/??????????????? ????????????");       
							} catch (DirectoryNotEmptyException e) {            
								System.out.println("??????????????? ???????????? ????????????");       
								} catch (IOException e) {           
									e.printStackTrace();    
									}
				 
			   // ----------------------- 	
			    	
			 
				for(MultipartFile multipartFile : photo2) {
					System.out.println("name = " + multipartFile.getOriginalFilename());	
					System.out.println("size = " + multipartFile.getSize());	
					
					fileNm = vo.getId() + multipartFile.getOriginalFilename();
					File saveFile = new File(uploadFolder, vo.getId() + multipartFile.getOriginalFilename());
					
					try {
						multipartFile.transferTo(saveFile);
					}catch (Exception e) {
					}
					
				}
				vo.setPhoto("myInfo/" +  fileNm);
			 }
			
			//---------?????? ????????? ??? ----------------------
			
			System.out.println(vo.getPhoto() + "/" + vo.getId() );
			
			ms.updateMyInfo(vo);
			
			
			res.setContentType("text/html; charset=UTF-8");
			res.setCharacterEncoding("utf-8");
			PrintWriter writer = res.getWriter();
			writer.println("<script type='text/javascript'>");
			writer.println("alert('????????????');location.href = 'mypage.do';");
			writer.println("</script>");
			writer.flush();
		}
	
}
