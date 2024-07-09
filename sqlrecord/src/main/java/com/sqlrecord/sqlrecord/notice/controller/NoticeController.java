package com.sqlrecord.sqlrecord.notice.controller;



import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sqlrecord.sqlrecord.message.Message;
import com.sqlrecord.sqlrecord.notice.model.service.NoticeService;
import com.sqlrecord.sqlrecord.notice.model.vo.NFile;
import com.sqlrecord.sqlrecord.notice.model.vo.Notice;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/notice")
public class NoticeController {
	private final NoticeService noticeService ;
	@GetMapping
    public ResponseEntity<Message> findAll() {

        List<Notice> noticeList = noticeService.findAll();
        if(noticeList.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
            		.body(Message.builder().message("조회결과가 없습니다.").build());
        }

        Message responseMsg = Message.builder()
                                     .data(noticeList)
                                     .message("조회 요청 성공")
                                     .build();

        log.info("조회된 공지사항 목록 : {}" , noticeList);

        return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
    }
	
	@GetMapping("/category/{cate}")
    public ResponseEntity<Message> findByCate(@PathVariable String cate) {

        List<Notice> noticeList = noticeService.findByCate(cate);
        if(noticeList.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
            		.body(Message.builder().message("조회결과가 없습니다.").build());
        }

        Message responseMsg = Message.builder()
                                     .data(noticeList)
                                     .message("조회 요청 성공")
                                     .build();

        log.info("조회된 공지사항 목록 : {}" , noticeList);

        return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
    }
	
	@GetMapping("/nFile/{id}")
    public ResponseEntity<Message> findFiles(@PathVariable int id) {

        List<NFile> noticeList = noticeService.findFiles(id);
        if(noticeList.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
            		.body(Message.builder().message("조회결과가 없습니다.").build());
        }	

        Message responseMsg = Message.builder()
                                     .data(noticeList)
                                     .message("조회 요청 성공")
                                     .build();

        log.info("조회된 공지사항 목록 : {}" , noticeList);

        return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
    }
	
	@GetMapping("/{id}")
	public ResponseEntity<Message> findById(@PathVariable int id) {
		Notice notice = noticeService.findById(id);
		if(notice == null) {
			return ResponseEntity.status(HttpStatus.OK).body(Message
					.builder()
					.message("존재하지 않습니다")
					.build());
					
		}
		
		Message responseMsg = Message.builder()
                .data(notice)
                .message("조회 요청 성공")
                .build();
		return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
		
	
	}
	
	
	@PostMapping("insert.do")
	public String insert(Notice notice, MultipartFile[] upfile, HttpSession session) {
	    log.info("게시글 정보: {}", notice);

	    List<NFile> files = new ArrayList<>();

	    if (upfile != null) {
	        for (MultipartFile file : upfile) {
	            if (!file.getOriginalFilename().equals("")) {
	                String originName = file.getOriginalFilename();
	                String ext = originName.substring(originName.lastIndexOf("."));
	                int num = (int) (Math.random() * 900) + 100;
	                String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	                String savePath = session.getServletContext().getRealPath("resources/uploadFiles/");
	                String changeName = "KH_" + currentTime + "_" + num + ext;

	                try {
	                    file.transferTo(new File(savePath + changeName));
	                } catch (IllegalStateException | IOException e) {
	                    e.printStackTrace();
	                }

	                NFile nfile = new NFile();
	                nfile.setOriginalName(originName);
	                nfile.setChangedName(savePath + changeName);
	                files.add(nfile);
	            }
	        }
	    }

	    notice.setFiles(files); // Assuming Notice has a List<NFile> attribute named 'files'

	    if (noticeService.save(notice) > 0) {
	        session.setAttribute("alertMsg", "게시글 작성 성공");
	        return "redirect:notice";
	    } else {
	        session.setAttribute("errorMsg", "게시글 작성 실패");
	        return "common/errorPage";
	    }
	}

	
	@PostMapping
	public  ResponseEntity<Message> save(Notice notice) {
		
		if("".equals(notice.getNoticeTitle())||
				"".equals(notice.getNoticeNo())||
				"".equals(notice.getNoticeContent()) ) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
    		.body(Message.builder().data("서비스 요청실패").message("필수 파라미터 누락").build());
		}
		int result = noticeService.save(notice);
		Message responseMsg = Message.builder()
                .data(result)
                .message("서비스 요청 성공")
                .build();
		return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
	}
	
	
	@DeleteMapping("/{id}")
	public ResponseEntity<Message> deletebyId(@PathVariable int id) {
		int result = noticeService.delete(id);
		
		if(result == 0) {
			return ResponseEntity.status(HttpStatus.OK)
    		.body(Message.builder().message("게시글이  존재하지 않음").build());
		}
		
		Message responseMsg = Message.builder()
                .data("삭제성공!")
                .message("게시글 삭제 성공")
                .build();
		return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
	}
	
	
	@PutMapping
	public ResponseEntity<Message> update(@RequestBody Notice notice) {
		log.info("start");
		int result = noticeService.update(notice);
		log.info(" result:{}",result);
		if(result==0) {
			return ResponseEntity.status(HttpStatus.OK)
    		.body(Message.builder().message("공지사항 변경에 실패했습니다").build());
		}
		Message responseMsg = Message.builder()
                .data(result)
                .message("공지사항 변경을 성공했습니다.")
                .build();
		return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
	}
}
