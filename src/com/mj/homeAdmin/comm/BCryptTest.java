package com.mj.homeAdmin.comm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.myinfo.model.dao.MyinfoDAO;
import com.mj.homeAdmin.myinfo.model.service.MyinfoServiceImpl;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;
	
@Service
public class BCryptTest {
	
	@Autowired
	private MyinfoServiceImpl ms;
	
	public BCryptTest() {}
	
	// 암호화
	public String encry(String pw) {
        String password = pw;

        // 디비에 저장할 비밀번호 암호화
        String encrypted = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println("encrypted : " + encrypted);

        // 로그인시 디비에 저장된 암호화된 문자열과 사용자가 입력한 비밀번호로 checkpw 검증
        System.out.println(BCrypt.checkpw(password, encrypted)); // true
        System.out.println(BCrypt.checkpw(password + "1", encrypted)); // false
        
        
        return encrypted;
    }

	
	//  로그인 시 아이디 , 비밀번호 체크
	public boolean checkPw(MyinfoVo vo) throws Exception {
		
		boolean result = false;

		// 아이디 있는지 확인 -> 있으면 암호화 된 비번 가져오기 
		String chkPw = String.valueOf(ms.checkPw(vo));
		
		if(chkPw.equals("") || chkPw.isEmpty()) {
		}else if(!chkPw.isEmpty()) {
			
			// 암호화 된 비밀번호 세팅
			vo.setPw(chkPw);
			// 암호화된 비밀번호 비교
			result = BCrypt.checkpw(vo.getInputPw(),vo.getPw());
		}
		
		return result;
	}
}
