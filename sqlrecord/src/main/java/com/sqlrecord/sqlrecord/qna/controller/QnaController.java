package com.sqlrecord.sqlrecord.qna.controller;



import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sqlrecord.sqlrecord.common.vo.PageInfo;
import com.sqlrecord.sqlrecord.message.Message;
import com.sqlrecord.sqlrecord.qna.model.service.QnaService;
import com.sqlrecord.sqlrecord.qna.model.vo.Comment;
import com.sqlrecord.sqlrecord.qna.model.vo.PaginationAndList;
import com.sqlrecord.sqlrecord.qna.model.vo.Qna;
import com.sqlrecord.sqlrecord.qna.model.vo.QnaFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/qna")
public class QnaController {
	private final QnaService qnaService;
	@GetMapping("/{cate}/{bool}/{page}")
	public ResponseEntity<Message>  forwarding(@PathVariable String cate,@PathVariable String bool,@PathVariable int page) {
		int listCount;
		int currentPage;
		int pageLimit;
		int qnaLimit;

		int maxPage;
		int startPage;
		int endPage; // 마지막 페이지

		pageLimit = 10;
		qnaLimit = 10;
		if(cate.equals("all")) {
			listCount = qnaService.qnaCount();
		}else {
			listCount = qnaService.qnaCountCate(cate);
		}
		
		log.info("조회된 게시글의 개수: {}", listCount);
		log.info("조회된 카테고리: {}", cate);
		maxPage = (int) Math.ceil((double) listCount / qnaLimit);

		currentPage = page;
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + maxPage - 1;

		if (endPage > maxPage)
			endPage = maxPage;
		PageInfo pageInfo = PageInfo.builder().maxPage(maxPage)
				.endPage(endPage).listCount(listCount).pageLimit(pageLimit).startPage(startPage).boardLimit(qnaLimit).currentPage(currentPage).build();

		Map<String, Integer> map = new HashMap<String, Integer>();
	

		int startValue = (currentPage - 1) * qnaLimit + 1;
		int endValue = startValue + qnaLimit - 1;
		map.put("startValue", startValue);
		map.put("endValue", endValue);
		log.info("조회된 start: {}", startValue);
		log.info("조회된 end: {}", endValue);
		List<Qna> qnaList = new ArrayList<>();
		if(cate.equals("all")) {
			log.info("조회된 전체: {}", cate);
			qnaList = qnaService.findAll(map, bool);
		}else {
			log.info("조회된 카테고리 일부: {}", cate);
			qnaList = qnaService.findByCate(map,cate, bool);
		}
		

		
		log.info("---------------");
		log.info("조회된 공지사항 목록 : {}", qnaList);
		if (qnaList.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Message.builder().message("조회결과가 없습니다.").build());
		}
		PaginationAndList PAList = new PaginationAndList(qnaList, pageInfo);
		Message responseMsg = Message.builder().data(PAList).message("조회 요청 성공").build();

		

		return ResponseEntity.status(HttpStatus.OK).body(responseMsg);

	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Message> findById(@PathVariable int id) {
		Qna qna = qnaService.findById(id);
		if (qna == null) {
			return ResponseEntity.status(HttpStatus.OK).body(Message.builder().message("존재하지 않습니다").build());

		}

		Message responseMsg = Message.builder().data(qna).message("조회 요청 성공").build();

		log.info("조회된 특정 공지사항 목록 : {}", qna);
		return ResponseEntity.status(HttpStatus.OK).body(responseMsg);

	}
	@PostMapping("/comment/")
	public ResponseEntity<Message>  insertComment(@RequestBody Comment newComment, HttpSession session) {
        // Assuming you have a service method to save the comment
		int qnaNumber =qnaService.insertComment(newComment);
        if (qnaNumber>0) {
        	Message responseMsg = Message.builder().data(qnaNumber).message("댓글 등록 성공").build();
        	return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
        } else {
        	return ResponseEntity.status(HttpStatus.OK).body(Message.builder().message("댓글 등록 실패").build());
        }
    }
	
	@PostMapping("/insert.do")
	public String insert(@ModelAttribute Qna qna, @RequestParam("upfile") MultipartFile[] upfiles,
			HttpSession session) {
		log.info("게시글 정보: {}", qna);
		log.info("파일 정보: {}", upfiles);
		List<QnaFile> files = new ArrayList<>();

		if (upfiles != null) {
			for (MultipartFile file : upfiles) {
				if (!file.getOriginalFilename().isEmpty()) {
					String originName = file.getOriginalFilename();
					QnaFile QnaFile = new QnaFile();
					QnaFile.setOriginalName(originName);
					QnaFile.setChangedName(saveFile(file, session));
					files.add(QnaFile);
				}
			}
		}

		qna.setFiles(files); // Assuming qna has a List<QnaFile> attribute named 'files'

		if (qnaService.insert(qna) > 0) {
			session.setAttribute("alertMsg", "게시글 작성 성공");
			return "redirect:/qnas";
		} else {
			session.setAttribute("errorMsg", "게시글 작성 실패");
			return "redirect:/qnas/insert.do";
		}
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
		int num = (int) (Math.random() * 900) + 100; // 0~899에서 100을 더하면 100~999로 3자리로 만듬
		// 0.0~0.9999999999

		log.info("currentTime: {}", new Date());
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/qna/");

		String changeName = "KH_" + currentTime + "_" + num + ext;
		File directory = new File(savePath);
		if (!directory.exists()) {
			directory.mkdirs();
		}
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "resources/uploadFiles/qna/" + changeName; // 얘는 슬래시 앞에 없어야 함 savePath 지정할때 이미 넣어서
	}
	// 업데이트 페이지용
		@PostMapping("/update.do")
		public String updateForm(Qna qna, @RequestParam("updatefile") MultipartFile[] upfiles, HttpSession session,
				@RequestParam(value = "fileNoDel", required = false) String fileNoDel) {
			log.info("start");
			log.info(fileNoDel);
			List<QnaFile> qnaFiles = new ArrayList<>();
			String savePath = session.getServletContext().getRealPath("");
			if (fileNoDel != null && !fileNoDel.isEmpty()) {
				String[] delFilesArray = fileNoDel.split(",");
				int[] delfiles = new int[delFilesArray.length];
				for (int i = 0; i < delFilesArray.length; i++) {
					delfiles[i] = Integer.parseInt(delFilesArray[i]);
				}

				for (int delfile : delfiles) {
					QnaFile tempFile = new QnaFile();
					tempFile = qnaService.findFileById(delfile);
		
					log.info("Deleting file with ID: " + delfile);
					String filePath = tempFile.getChangedName();
					File xFile = new File(savePath + filePath);
					
					boolean fileDelete = xFile.delete();
					
					qnaService.deleteFile(delfile);
				}
			} else {
				log.info("No files to delete.");
			}

			if (upfiles != null) {
				log.info(upfiles.toString());

				for (MultipartFile reupfile : upfiles) {
					log.info(reupfile.toString());
					if (!reupfile.getOriginalFilename().isEmpty()) {

						QnaFile qnaFile = new QnaFile();

						qnaFile.setOriginalName(reupfile.getOriginalFilename());
						qnaFile.setChangedName(saveFile(reupfile, session));
						log.info(qnaFile.toString());
						qnaFiles.add(qnaFile);
					}

				}
			}
			
			Qna newqna = new Qna();
			newqna.setQnaNo(qna.getQnaNo());
			newqna.setSecret(qna.getSecret());
			newqna.setQnaCategory(qna.getQnaCategory());
			newqna.setQnaContent(qna.getQnaContent());
			newqna.setQnaTitle(qna.getQnaTitle());
			if (qnaFiles.equals(qna.getFiles())) {
				newqna.setFiles(qna.getFiles());
			} else {
				newqna.setFiles(qnaFiles);
			}
			log.info(newqna.toString());
			log.info("updatef files");
			int result = qnaService.update(newqna);
			log.info(" result:{}", result);

			if (result == 0) {
				session.setAttribute("errorMsg", "게시글 작성 실패");
				return "redirect:/qnas/update.do/" + newqna.getQnaNo();
			}
			session.setAttribute("alertMsg", "게시글 작성 성공");
			return "redirect:/qnas";
		}
	
}
