package com.sqlrecord.sqlrecord.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sqlrecord.sqlrecord.member.model.service.MemberService;
import com.sqlrecord.sqlrecord.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member/")
@Slf4j
@RequiredArgsConstructor
public class MemberController {

	private final MemberService memberService;
	private final BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("login.do")
	public String login(Model model) {
		return "member/login";
	}
	
	@PostMapping("loginPro.do")
	public ModelAndView login(Member member,
							  ModelAndView mv,
							  HttpSession session) {
		Member loginUser = memberService.login(member);
		
		if(loginUser != null && bCryptPasswordEncoder.matches(member.getMemberPw(), loginUser.getMemberPw())) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("loginMSg", "로그인 성공");
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "로그인 실패 했습니다.").setViewName("common/errorPage");
		}
		return mv;  
	}
	
	@GetMapping("idCheck.do")
	public void idCheck(@RequestParam("memberId") String memberId, HttpServletResponse response, Model model) throws IllegalArgumentException, IOException {
		
		Member cus = memberService.getMember(memberId);
		
		//boolean result = (cus == null); cus가 null이 아니면 false
		
		boolean result;
		if(cus!=null) {
			result = false;
		} else {
			result = true;
		}
		
		// 결과를 JSON 객체로 변환
	    JSONObject json = new JSONObject();
	    json.put("data", result);
	    
	    // JSON 응답을 클라이언트에 보냄
	    PrintWriter out = response.getWriter();
	    out.println(json.toString());
		
	}
	
	@PostMapping("joinPro.do")
	public ModelAndView joinPro(Member member, ModelAndView mv) {
	    member.setMemberPw(bCryptPasswordEncoder.encode(member.getMemberPw())); // 비밀번호 암호화
	    memberService.insMember(member);
	    
	    log.info("회원이 입력한 값 : {} ", member);
	    
	    mv.addObject("msg", "회원가입을 축하합니다.");
	    mv.setViewName("redirect:/");
	    return mv;
	}
}
