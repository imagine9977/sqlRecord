package com.sqlrecord.sqlrecord.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sqlrecord.sqlrecord.member.model.vo.Member;
import com.sqlrecord.sqlrecord.product.model.service.ProductService;
import com.sqlrecord.sqlrecord.product.model.service.ReplyService;
import com.sqlrecord.sqlrecord.product.model.vo.Product;
import com.sqlrecord.sqlrecord.reply.model.vo.ChReply;
import com.sqlrecord.sqlrecord.reply.model.vo.Reply;
import com.sqlrecord.sqlrecord.reply.model.vo.ReplyFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/productFor")
@RequiredArgsConstructor
public class ProductForwardController {

	
	private final ProductService productService;
	
	@Autowired
	private final ReplyService replyService;
	
	@Autowired
	private HttpSession session;
	
	
	
	@RequestMapping("detail.do")
	public String getReply(@RequestParam("replyNo") int replyNo, Model model) {
		Reply reply = replyService.getReply(replyNo);
        model.addAttribute("reply", reply);
		return "product/detail";
	}
	
	@PostMapping("chInsReply.do")
	@ResponseBody
	public String chInsReply(@ModelAttribute ChReply chReply, 
			   				 Member member, Model model, 
			   				 HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		chReply.setMemberNo(loginUser.getMemberNo());
		replyService.chInsReply(chReply);
		return "redirect:/detail/{productNo}";
	}
	
	
	@RequestMapping("insReply.do")
	@ResponseBody
	public Map<String, String> insReply(@ModelAttribute Reply reply, 
				                       @ModelAttribute ReplyFile replyFile,
				                       @RequestParam(value = "files", required = false) MultipartFile[] files,
				                       Member member, 
				                       Model model,
				                       HttpSession session) {
		Map<String, String> result = new HashMap<>();
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    reply.setMemberNo(loginUser.getMemberNo());
	    try {
	    	replyService.insReply(reply);
	    	// 파일이 있을 경우에만 파일 업로드 처리
		    if (files != null) {
		        for (MultipartFile upfile : files) {
		                // 파일 처리
		                String originName = upfile.getOriginalFilename();
		                String ext = originName.substring(originName.lastIndexOf("."));
		                int num = (int) (Math.random() * 900) + 100;

		                String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/reply/");
		                String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		                String changeName = "KH_" + currentTime + "_" + num + ext;
		                File directory = new File(savePath);

		                if (!directory.exists()) { // 디렉토리 존재 유무 확인
		                    directory.mkdirs(); // 없다면 상위 디렉토리부터 생성
		                }
		                try {
		                    upfile.transferTo(new File(savePath + changeName));
		                } catch (IllegalStateException | IOException e) {
		                    e.printStackTrace();
		                }
		                replyFile.setMemberNo(loginUser.getMemberNo());
		                replyFile.setOriginName(originName);
		                replyFile.setChangeName(changeName);
		                replyService.insFile(replyFile);
		        }
		    }
		    result.put("status", "success");
	    } catch(Exception e) {
	    	e.printStackTrace();
	    	result.put("status", "error");
	    }
	    return result;
	}
		
	
	
    //Reply 클래스의 필드명과 폼의 입력 필드명(name 속성)이 일치해야함
    
	@PostMapping("delReply.do")
	@ResponseBody
	public Map<String, String> delReply(@RequestParam("replyNo") int replyNo) {
	    Map<String, String> result = new HashMap<>();
	    try {
	        replyService.delReply(replyNo);
	        replyService.delFile(replyNo);
	        result.put("status", "success");
	    } catch (Exception e) {
	    	e.printStackTrace();
	        result.put("status", "error");
	    }
	    return result;
	}
    
    @PostMapping("delChReply.do")
    @ResponseBody
	public String delChReply(@ModelAttribute ChReply chReplyNo) {
    	replyService.delChReply(chReplyNo);
    	return "redirect:/detail/{productNo}";
	}
    
    @PostMapping("upReply.do")
    @ResponseBody
    public String upReply(@ModelAttribute Reply reply,
    					  Member member, 
    					  Model model, 
    					  ReplyFile replyFile,
    					  HttpSession session) {
    	Member loginUser = (Member) session.getAttribute("loginUser");
    	reply.setMemberNo(loginUser.getMemberNo());
    	replyService.changeReply(reply);
    	//log.info("댓글 수정 : {}", reply);
    	return "redirect:/detail/{productNo}";
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
    	return "redirect:/detail/{productNo}";
    }
	
	// 개별 상품 상세보기 페이지로 이동
	// 한페이지라서 호출을 별도로 못하니까 여기다 다 때려넣어버림 댓글 등록 빼고
	@RequestMapping("/detail/{productNo}")
	public String getProductOne(@PathVariable int productNo , Model model) {
		
		//리뷰 총 갯수 가져오기
    	int replyCount = replyService.replyCount(productNo);
    	model.addAttribute("replyCount", replyCount);
    	
    	//답글 총 갯수 가져오기
    	int chReplyCount = replyService.chReplyCount();
    	model.addAttribute("chReplyCount", chReplyCount);

    	//별점 점수대별 갯수 퍼센트 가져오기
    	List<Map<String, Object>> starAll = replyService.getReplyStarAll(productNo);
        model.addAttribute("starAll", starAll);
        
        
        //총 리뷰 평점 가져오기
        float avgStar = replyService.avgStar(productNo);
        model.addAttribute("avgStar", avgStar);
        
        //댓글 목록 가져오기
        model.addAttribute("list", replyService.getReplyList(productNo));
        //System.out.println(replyService.getReplyList());
        
        //답글 목록 가져오기
        model.addAttribute("chList", replyService.getChReplyList());
        
        //리뷰 이미지 가져오기
        model.addAttribute("imgList",replyService.getImgList());
		//log.info("imgList : {}" , replyService.getImgList());
        
		//상품------------------------------------------------------------
		Product product = productService.findOne(productNo);
		
		//log.info("product? : {}" , product.getProductDetail());
		
		model.addAttribute("product",product);
		
		return "product/detail";
	}
	
	//화면 리로드
	@RequestMapping("/detail2/{productNo}")
	public String getProductOne2(@PathVariable int productNo , Model model) {
		
		//리뷰 총 갯수 가져오기
    	int replyCount = replyService.replyCount(productNo);
    	model.addAttribute("replyCount", replyCount);
    	
    	//답글 총 갯수 가져오기
    	int chReplyCount = replyService.chReplyCount();
    	model.addAttribute("chReplyCount", chReplyCount);

    	//별점 점수대별 갯수 퍼센트 가져오기
    	List<Map<String, Object>> starAll = replyService.getReplyStarAll(productNo);
        model.addAttribute("starAll", starAll);
        
        //총 리뷰 평점 가져오기
        float avgStar = replyService.avgStar(productNo);
        model.addAttribute("avgStar", avgStar);
        
        //댓글 목록 가져오기
        model.addAttribute("list", replyService.getReplyList(productNo));
        //System.out.println(replyService.getReplyList());
        
        //답글 목록 가져오기
        model.addAttribute("chList", replyService.getChReplyList());
        
        //리뷰 이미지 가져오기
        model.addAttribute("imgList",replyService.getImgList());
		log.info("productNo : {}" , productNo);
        
        return "reply/list3";
	}
	
	// 상품 추가 페이지로 이동
	@GetMapping("/saveProductForm")
	public String saveProductFormForwarding() {
		return "product/insertForm";
	}
	
	
	@GetMapping("/list/{productCate}")
	public String getProductList(@PathVariable String productCate , Model model) {
		
		
		List<Product> productList = productService.findAll(productCate);
		
		
		
		
		model.addAttribute("productList" , productList);
		
		return "product/list";
	}
	
	
}