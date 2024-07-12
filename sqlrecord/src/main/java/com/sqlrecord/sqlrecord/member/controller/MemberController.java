package com.sqlrecord.sqlrecord.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.Format;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sqlrecord.sqlrecord.mail.Mail;
import com.sqlrecord.sqlrecord.member.model.service.MemberService;
import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.member.model.vo.MemberGenre;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member/")
@Slf4j
@RequiredArgsConstructor
public class MemberController {

	private final MemberService memberService;
	private final BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	@Autowired
	private JavaMailSenderImpl sender;
	
//	@Autowired
//	private String content;
	
	/*
	이거 때문에 css 다깨저버림 
	오류 원인 "TypeError: Bootstrap의 JavaScript는 jQuery를 필요로 합니다. jQuery는 Bootstrap의 JavaScript보다 먼저 포함되어야 합니다.
at Object.jQueryDetection"
	*/
	
	@GetMapping("login.do")
	public String login(Model model) {
		return "member/login";
	}
	
	@GetMapping("findIdPw")
	public String find(Model model) {
		return "member/infoFound";
	}
	
	@GetMapping("mypage")
	public String mypage() {
		return "member/mypage";
	}
	
	@GetMapping("infoEdit")
	public String infoEdit(Model model,
			   			   HttpServletRequest request) {
						   
		
		HttpSession session = request.getSession(); // session 불러와서
		Member member = (Member) session.getAttribute("loginUser"); //로그인 회원 정보 담아서
		MemberGenre memberGenre = new MemberGenre();
		//log.info("member : {} ", member);
		memberGenre.setMemberNo(member.getMemberNo());
		
		List<Integer> tag = memberService.genre(memberGenre);
		session.setAttribute("tagNo", tag);
		model.addAttribute("tagList",tag);
		//log.info("tag : {} ", tag);
		
		return "member/infoEdit";
	}
	
	@PostMapping("loginPro.do")
	public ModelAndView login(Member member,
							  ModelAndView mv,
							  HttpSession session) {
		Member loginUser = memberService.login(member);
		
		if(loginUser != null && bCryptPasswordEncoder.matches(member.getMemberPw(), loginUser.getMemberPw())) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("loginMSg", "로그인 성공");
			//log.info("loginUser : {} ", loginUser);
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
	public ModelAndView joinPro(Member member,
								@RequestParam("tagNo") List<Integer> tagNos, 
								ModelAndView mv) {
	    member.setMemberPw(bCryptPasswordEncoder.encode(member.getMemberPw())); // 비밀번호 암호화
	    memberService.insMember(member);
	    //memberGenre.setMemberNo(member.getMemberNo());
	    //memberService.insGenre(memberGenre);
	    //log.info("회원이 입력한 값 : {} ", member);
	    
	    //log.info("태그?? : {}" , tagNos.size());
	    for (Integer tagNo : tagNos) {
	        MemberGenre memberGenre = new MemberGenre();
	        memberGenre.setTagNo(tagNo);
	        memberGenre.setMemberNo(member.getMemberNo());
	        memberService.insGenre(memberGenre);
	    }
	    
	    
	    
	    mv.addObject("msg", "회원가입을 축하합니다.");
	    mv.setViewName("redirect:/");
	    return mv;
	}
	
	@GetMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	
	@PostMapping("emailckId")
	public ModelAndView infoId(@RequestParam("name") String name, 
							   @RequestParam("email") String email,
							   ModelAndView mv,
							   Member member,
							   Mail mail) throws MessagingException {
										 
		
		//log.info("name1 : {}", name);
		//log.info("email1 : {}", email);
		// 아이디 찾기 입력받은 값을 조회
		member = memberService.infoId(member);
		member.setName(name);
		member.setEmail(email);
		member.getMemberId();
		//log.info("name : {}", name);
		//log.info("email : {}", email);
		
		// 인증번호 생성
		Random r = new Random();
		int i = r.nextInt(100000);
		Format format = new DecimalFormat("000000");
		String code = format.format(i);
		
		// 메일 내용
				String content = "<html>\n" +
					    "<head>\n" +
					    "    <style>\n" +
					    "        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }\n" +
					    "        .container { max-width: 600px; margin: 0 auto; padding: 20px; }\n" +
					    "        .header { background-color: #4CAF50; color: white; text-align: center; padding: 10px; }\n" +
					    "        .content { background-color: #f4f4f4; padding: 20px; border-radius: 5px; }\n" +
					    "        .auth-code { font-size: 24px; font-weight: bold; color: #4CAF50; text-align: center; margin: 20px 0; }\n" +
					    "        .footer { text-align: center; margin-top: 20px; font-size: 12px; font-weight: 600; color: #777; }\n" +
					    "        p {font-weight: 600;}"+
					    "    </style>\n" +
					    "</head>\n" +
					    "<body>\n" +
					    "    <div class=\"container\">\n" +
					    "        <div class=\"header\">\n" +
					    "            <h1>이메일 인증</h1>\n" +
					    "        </div>\n" +
					    "        <div class=\"content\">\n" +
					    "            <p>안녕하세요,</p>\n" +
					    "            <p>귀하의 계정 인증을 위한 인증 코드입니다 <br>아래의 인증 코드를 입력해주세요:</p>\n" +
					    "            <div class=\"auth-code\">"+code+"</div>\n" +
					    "            <p>이 인증 코드는 2분 동안 유효합니다<br> 본 메일을 요청하지 않으셨다면, 이 메일을 무시해주세요.</p>\n" +
					    "            <p>감사합니다.</p>\n" +
					    "        </div>\n" +
					    "        <div class=\"footer\">\n" +
					    "            <p>본 메일은 발신 전용이므로 회신하지 마세요. 문의사항은 고객센터를 이용해주세요.</p>\n" +
					    "        </div>\n" +
					    "    </div>\n" +
					    "</body>\n" +
					    "</html>";
		
		MimeMessage messeage = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(messeage,false,"UTF-8");
		
		
		if(member != null) {
			helper.setSubject("정보찾기 이메일 인증 메일 입니다."); //제목
			helper.setText(content,true); // 내용
			helper.setTo(member.getEmail());
			sender.send(messeage);
			mv.addObject("code",code);
			mv.addObject("memberId",member.getMemberId());
			mv.setViewName("member/emailSuccess");
		} else {
			mv.addObject("errorMsg", "일치하는 회원이 없습니다.").setViewName("member/infoFound");
		}
		return mv;
	}
	
	@PostMapping("emailckPw")
	public ModelAndView infoPw(@RequestParam("name") String name, 
							   @RequestParam("email") String email,
							   @RequestParam("memberId") String memberId,
							   ModelAndView mv,
							   Member member,
							   Mail mail) throws MessagingException {
										 
		
		//일치 회원 있으면 메일 보내야하니 멤버에 저장
		member = memberService.infoId(member);
		member.setName(name);
		member.setEmail(email);
		member.setMemberId(memberId);
		
		//새 비밀번호 
		Random rpw = new Random();
		int ipw = rpw.nextInt(100000);
		Format formatPw = new DecimalFormat("000000");
		String memberPw = formatPw.format(ipw);
		 member.setMemberPw(bCryptPasswordEncoder.encode(memberPw));
		 memberService.pwChange(member);
		
		// 인증번호 생성
		Random r = new Random();
		int i = r.nextInt(100000);
		Format format = new DecimalFormat("000000");
		String code = format.format(i);
		
		// 메일 내용
				String content = "<html>\n" +
					    "<head>\n" +
					    "    <style>\n" +
					    "        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }\n" +
					    "        .container { max-width: 600px; margin: 0 auto; padding: 20px; }\n" +
					    "        .header { background-color: #4CAF50; color: white; text-align: center; padding: 10px; }\n" +
					    "        .content { background-color: #f4f4f4; padding: 20px; border-radius: 5px; }\n" +
					    "        .auth-code { font-size: 24px; font-weight: bold; color: #4CAF50; text-align: center; margin: 20px 0; }\n" +
					    "        .footer { text-align: center; margin-top: 20px; font-size: 12px; font-weight: 600; color: #777; }\n" +
					    "        p {font-weight: 600;}"+
					    "    </style>\n" +
					    "</head>\n" +
					    "<body>\n" +
					    "    <div class=\"container\">\n" +
					    "        <div class=\"header\">\n" +
					    "            <h1>이메일 인증</h1>\n" +
					    "        </div>\n" +
					    "        <div class=\"content\">\n" +
					    "            <p>안녕하세요,</p>\n" +
					    "            <p>귀하의 계정 인증을 위한 인증 코드입니다 <br>아래의 인증 코드를 입력해주세요:</p>\n" +
					    "            <div class=\"auth-code\">"+code+"</div>\n" +
					    "            <p>이 인증 코드는 2분 동안 유효합니다<br> 본 메일을 요청하지 않으셨다면, 이 메일을 무시해주세요.</p>\n" +
					    "            <p>감사합니다.</p>\n" +
					    "        </div>\n" +
					    "        <div class=\"footer\">\n" +
					    "            <p>본 메일은 발신 전용이므로 회신하지 마세요. 문의사항은 고객센터를 이용해주세요.</p>\n" +
					    "        </div>\n" +
					    "    </div>\n" +
					    "</body>\n" +
					    "</html>";
		
		MimeMessage messeage = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(messeage,false,"UTF-8");
		
		
		if(member != null) {
			helper.setSubject("정보찾기 이메일 인증 메일 입니다."); //제목
			helper.setText(content,true); // 내용
			helper.setTo(member.getEmail());
			sender.send(messeage);
			mv.addObject("code",code);
			mv.addObject("memberPw",memberPw);
			mv.setViewName("member/emailSuccess2");
		} else {
			mv.addObject("errorMsg", "일치하는 회원이 없습니다.").setViewName("member/infoFound");
		}
		return mv;
	}
	
	@GetMapping("pwCheck")
    @ResponseBody
    public String checkPw(@RequestParam("checkPwd") String checkPwd, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser != null && bCryptPasswordEncoder.matches(checkPwd, loginUser.getMemberPw())) {
            return "success";
        } else {
            return "fail";
        }
    }
}
