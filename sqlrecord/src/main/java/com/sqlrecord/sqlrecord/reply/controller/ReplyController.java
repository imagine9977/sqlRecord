package com.sqlrecord.sqlrecord.reply.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.reply.model.vo.ChReply;
import com.sqlrecord.sqlrecord.reply.model.vo.Reply;

@Controller
@RequestMapping("/reply/")
public class ReplyController {
	
	/*
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private HttpSession session;
	
//	@RequestMapping("list.do")
//	public String getReplyList(Model model) {
//		
//		return "reply/list";
//	}
	
	@RequestMapping("detail.do")
	public String getReply(@RequestParam("replyNo") int replyNo, Model model) {
		Reply reply = replyService.getReply(replyNo);
        model.addAttribute("reply", reply);
		return "reply/detail";
	}
	
	@GetMapping("count.do")
    public String getReplyCount(Model model) {
        int replyCount = replyService.replyCount();
        model.addAttribute("replyCount", replyCount);
        return "reply/list"; 
    }
	
	@PostMapping("chInsReply.do")
	@ResponseBody
	public String chInsReply(@ModelAttribute ChReply chReply, 
			   				 Member member, Model model, 
			   				 HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		chReply.setMemberNo(loginUser.getMemberNo());
		replyService.chInsReply(chReply);
		return "redirect:getReplyStarAll.do";
	}
	
	
	@RequestMapping("insReply.do")
	@ResponseBody
    public String insReply(@ModelAttribute Reply reply, 
    					   Member member, Model model, 
    					   HttpSession session) {
    	Member loginUser = (Member) session.getAttribute("loginUser");
    	reply.setMemberNo(loginUser.getMemberNo());
    	replyService.insReply(reply);
    	//model.addAttribute("rslt", replyService.insReply(reply));
    	return "redirect:getReplyStarAll.do";
    }
    //Reply 클래스의 필드명과 폼의 입력 필드명(name 속성)이 일치해야함
    
    @PostMapping("delReply.do")
    @ResponseBody
	public String delReply(@ModelAttribute Reply replyNo) {
    	//model.addAttribute("rslt", replyService.delReply(replyNo));
    	replyService.delReply(replyNo);
    	return "redirect:product/detail";
	}
    
    @PostMapping("delChReply.do")
    @ResponseBody
	public String delChReply(@ModelAttribute ChReply chReplyNo) {
    	replyService.delChReply(chReplyNo);
    	return "redirect:getReplyStarAll.do";
	}
    
    @PostMapping("upReply.do")
    @ResponseBody
    public String upReply(@ModelAttribute Reply reply,
    					  Member member, Model model, 
    					  HttpSession session) {
    	Member loginUser = (Member) session.getAttribute("loginUser");
    	reply.setMemberNo(loginUser.getMemberNo());
    	replyService.changeReply(reply);
    	//log.info("댓글 수정 : {}", reply);
    	return "redirect:getReplyStarAll.do";
    }
    
    @PostMapping("upChReply.do")
    @ResponseBody
    public String upChReply(@ModelAttribute ChReply chReply,
    						Member member, Model model, 
							HttpSession session) {
    	Member loginUser = (Member) session.getAttribute("loginUser");
    	chReply.setMemberNo(loginUser.getMemberNo());
    	replyService.changeChReply(chReply);
    	//log.info("댓글 수정 : {}", reply);
    	return "redirect:getReplyStarAll.do";
    }
    
    
    
    // 한페이지라서 호출을 별도로 못하니까 여기다 다 때려넣어버림 댓글 등록 빼고
    @RequestMapping("getReplyStarAll.do")
    public String getReplyStarAll(Model model) {
    	//리뷰 총 갯수 가져오기
    	int replyCount = replyService.replyCount();
    	model.addAttribute("replyCount", replyCount);
    	
    	//답글 총 갯수 가져오기
    	int chReplyCount = replyService.chReplyCount();
    	model.addAttribute("chReplyCount", chReplyCount);

    	//별점 점수대별 갯수 퍼센트 가져오기
    	List<Map<String, Object>> starAll = replyService.getReplyStarAll();
        model.addAttribute("starAll", starAll);
        
        
        //총 리뷰 평점 가져오기
        float avgStar = replyService.avgStar();
        model.addAttribute("avgStar", avgStar);
        
        //댓글 목록 가져오기
        model.addAttribute("list", replyService.getReplyList());
        System.out.println(replyService.getReplyList());
        //답글 목록 가져오기
        model.addAttribute("chList", replyService.getChReplyList());
        
        return "product/detail"; // 별점 분포를 표시할 JSP 페이지
    }
    */
}
