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
	
	/** 로그인 페이지 이동
	 * @return
	 */
	@RequestMapping("login.do")
	public String login() {
		
		
		return "myinfo/login";
	}
	
	
	// 로그인
	 @RequestMapping(value="loginGo.do", produces = "application/json; charset=utf-8")
	public String loginGo(MyinfoVo vo, Model model, HttpSession ss, HttpServletRequest req) throws Exception{
		
		String result ="false";
		
			boolean chk = by.checkPw(vo);
			
	if(chk == true) {
		result ="true";
		
		//세션에 필요한 정보가져오기
		// 여기부터
		 List<MyinfoVo> user = ms.selectUser(vo);
		 
		 
		 
		
		 // 메인에 나타날 것들
		 // 집 이미지
		 String homeImg = ms.getHomeImg(user.get(0).getId());
		 // 체크리스트
		 System.out.println("확인");
		 List<checkList> checkList = checkListService.selectCheckList(user.get(0).getId());
		 List<checkList> checkListDetail = checkListService.selectCheckListDetail(user.get(0).getId());
	
		 // 공과금 전월vs당월
		 
		 String flag = "false";
		 ManageM manageVo = new ManageM();
		 manageVo.setuId(user.get(0).getId());
		 String	yyyy= "" + LocalDate.now().getYear();
         String mm= JavaUtil.checkMM(""+LocalDate.now().getMonthValue(), "0");
        
        // 체크하는 용도로 사용함
        manageVo.setgChk(flag);
        
        
        manageVo.setYyyy(yyyy);
        manageVo.setMm(mm);
         System.out.println("manageVo.getuId()  " + manageVo.getuId());
         System.out.println("manageVo.getuId()  " + manageVo.getYyyy());
         System.out.println("manageVo.getuId()  " + manageVo.getMm());
        // 이번달
        List<ManageM> arrViewNow = manageService.manageIndex(manageVo);
        
        //-------------------------------//
        // 이번달, 이전달 비교
 
        manageVo.setMm2(JavaUtil.checkMM(mm, "1"));
        manageVo.setYyyy2(JavaUtil.checkYYYY(yyyy, mm, "1"));
        
        List<ManageM> arrViewPast = manageService.manageNP(manageVo);
        
        // 방명록
		 List<Visit> visitList = visitService.mainVistList(user.get(0).getId());
		
		 vo.setId(user.get(0).getId());
		 vo.setNm(user.get(0).getNm());
		 vo.setnNm(user.get(0).getnNm());
		 vo.setGb(user.get(0).getGb());
	//	 System.out.println(user.get(0).getNm() + " 리스트 값");
	//	 System.out.println(vo.getNm() + " vo값");
		 
		// 세션에 세팅
		cm.goSessionChk(vo, ss, req);
		cm.getSessionChk(ss);
		model.addAttribute("user" ,vo);
		model.addAttribute("homeImg", homeImg);
		model.addAttribute("checkList", checkList);
		model.addAttribute("checkListDetail", checkListDetail);
		model.addAttribute("arrViewNow", arrViewNow);
        model.addAttribute("arrViewPast", arrViewPast);
        model.addAttribute("visitList", visitList);
	//	System.out.println(ss.getAttribute("ssNM") + " 세션 확인");
	}	
		
	return "../../main" ;
	}
	
	// 회원가입 페이지
		@RequestMapping("join.do")
		public String join(MyinfoVo vo) throws Exception{
			return "myinfo/join";
		}
			
		// 회원가입  완료 or 실패
		@RequestMapping("signUp.do")
		public String signUp(MyinfoVo vo) throws Exception{
			
			// 임의 셋팅
			vo.setGb('1');
			vo.setLtype("1");
			vo.setHtype("1");

			// 비밀번호 신규 암호화
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
		
		/** 셀렉트 코드생성 (2차 코드)
		 * @return
		 */
		@RequestMapping("code.do")
		public String code(MyinfoVo vo, Model model) throws Exception{

			System.out.println(vo.getCd() + " 확인");
			List<MyinfoVo>list =  ms.selectCode(vo);
			
			model.addAttribute("list" ,list);
			model.addAttribute("cd" ,vo.getCd());
			
			System.out.println(list.get(0));
			return "myinfo/code";
		}
		
		/** 셀렉트 코드생성 (3차 코드)
		 * @return
		 */
		@RequestMapping("code3.do")
		public String code3(MyinfoVo vo, Model model) throws Exception{

			System.out.println(vo.getCd() + " 확인");
			System.out.println(vo.getScd() + " 확인");
			List<MyinfoVo>list =  ms.selectCode3(vo);
			
			model.addAttribute("list" ,list);
			model.addAttribute("cd" ,vo.getCd());
			
			System.out.println(list.get(0));
			return "myinfo/code";
		}
		
		
		@RequestMapping("mypage.do")
		public String mypage(MyinfoVo vo, Model model,HttpSession ss,  RedirectAttributes rdAttr, HttpServletResponse response) throws Exception{
			
			//세션으로 가져오기
			vo.setId((String)ss.getAttribute("ssID"));
			
			MyinfoVo list = ms.mypage(vo);
			
			model.addAttribute("list" ,list);
			return "myinfo/mypage";
		}
		
		@RequestMapping("update.do")
		public void update(MultipartFile[] photo2, MyinfoVo vo, Model model,HttpSession ss,  RedirectAttributes rdAttr, HttpServletResponse response, HttpServletResponse res) throws Exception{
			
			System.out.println(vo.getPhoto() + "/" + vo.getCd() + " 확인");
			
			//세션으로 가져오기
			vo.setId((String)ss.getAttribute("ssID"));
			
			
			int chkFile = 1;
			for(MultipartFile multipartFile : photo2) {
	 			if(multipartFile.isEmpty()) chkFile = 0;
			}
			
			
			 //----------- 파일 업로드 --------------------
			 String uploadFolder = myutil.fielUrl("myInfo");
			 
			 String fileNm = "";
			
			 if(chkFile == 1) {
				 
				 
				 // 기존 파일 삭제
				 Path filePath = Paths.get(myutil.defalutFielUrl() + vo.getPhoto());
				 
				 System.out.println(filePath + "    //filePa");
			//	 Path directoryPath = Paths.get("d:\\example");        
				 try {            
					 // 파일 삭제          
					 Files.delete(filePath);             
					 
					 // 디렉토리 삭제          
			//		 Files.delete(directoryPath);                   
					} catch (NoSuchFileException e) {           
						System.out.println("삭제하려는 파일/디렉토리가 없습니다");       
							} catch (DirectoryNotEmptyException e) {            
								System.out.println("디렉토리가 비어있지 않습니다");       
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
			
			//---------파일 업로드 끝 ----------------------
			
			System.out.println(vo.getPhoto() + "/" + vo.getId() );
			
			ms.updateMyInfo(vo);
			
			
			res.setContentType("text/html; charset=UTF-8");
			res.setCharacterEncoding("utf-8");
			PrintWriter writer = res.getWriter();
			writer.println("<script type='text/javascript'>");
			writer.println("alert('등록완료');location.href = 'mypage.do';");
			writer.println("</script>");
			writer.flush();
		}
	
}
