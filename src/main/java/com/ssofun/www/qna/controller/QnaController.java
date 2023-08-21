package com.ssofun.www.qna.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;


import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssofun.dto.*;
import com.ssofun.www.qna.service.QnaServiceImpl;

@Controller
@RequestMapping("www/qna/*")
public class QnaController {
	
	@Autowired
	private QnaServiceImpl qnaService;

	

	@RequestMapping("loginPage")
	public String loginPage() {
		
		
		return"www/qna/loginPage";
	}
	
	                         

	@ResponseBody
	@RequestMapping("loginProcess")
	public int loginProcess(HttpSession session, UserDto userDto) {
		
		UserDto user = (UserDto) session.getAttribute("user");
		UserDto sessionUser= qnaService.getUserByEmailAndPw(user);
	
//		int user_id = sessionUser.getUser_id();
	
		if (sessionUser == null) {		
			return 0;
		}else {
			session.setAttribute("sessionUser", sessionUser);
			
			return 1;
					//"redirect:../qna/qnaMain?user_id="+user_id;
		}
	}
	
	
	
	

	@RequestMapping("customerServiceMainPage")
	public String customerServiceMainPage(HttpSession session) {
		
		UserDto userDto =(UserDto)session.getAttribute("user");
		session.setAttribute("userDto", userDto);
		
		System.out.println(session.getAttribute("userDto.user_id"));
		
		
		return"www/qna/customerServiceMainPage";
	}
	

	@RequestMapping("writeQnaPage")
	public String writeQnaPage(HttpSession session) {
		UserDto userDto =(UserDto)session.getAttribute("user");
		session.setAttribute("userDto", userDto);
		return "www/qna/writeQnaPage";
	}


	@RequestMapping("writeQnaProcess")
	public String writeQnaProcess(HttpSession session,QnaDto qnacontents, MultipartFile[] qnaFiles ) {

		List<Qna_ImageDto> tb_Qna_ImageDtoList = new ArrayList<>();

		
		if(qnaFiles != null) {
			for(MultipartFile multipartFile : qnaFiles) {
				if(multipartFile.isEmpty()) {
					continue;
				}
				System.out.println("파일이름: "+multipartFile.getOriginalFilename());
				
			
				String rootFolder = "C:/ssofunUploadFiles/";
				
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());
				
				File targetFolder = new File(rootFolder+today);
				
				if(!targetFolder.exists()) {
					targetFolder.mkdirs();
				}
			
				String fileName = UUID.randomUUID().toString(); 
				fileName += "_" + System.currentTimeMillis();
				
			
				String originalFileName = multipartFile.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				String saveFileName = today + "/" + fileName+ext;
				
				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
				}catch(Exception e) {
					e.printStackTrace();
				}
				Qna_ImageDto tb_Qna_ImageDto = new Qna_ImageDto();
				tb_Qna_ImageDto.setOriginal_filename(originalFileName);
				tb_Qna_ImageDto.setLink(saveFileName);
				
				tb_Qna_ImageDtoList.add(tb_Qna_ImageDto);
				
			}
		}
		
		
		UserDto user = (UserDto)session.getAttribute("user");
		//String userEmail = sessionUser.getEmail();
		long userId = user.getUser_id();
		user.getUser_id();
				
		
		qnaService.writeQna(qnacontents, tb_Qna_ImageDtoList);
		
		return "redirect:./qnaMain";
	}
 


	
	public List<QnaDto> qnaListsProcess(Model model, HttpSession session ) {
		
		session.getAttribute("user");
		int userId = (int)((UserDto)session.getAttribute("user")).getUser_id();
	
			List<QnaDto> qnaList = qnaService.getQnaList(userId);
			if(model != null) {
				model.addAttribute("qnaList", qnaList);
			}
			
			return qnaList;
	}
	

	
	//login
	@RequestMapping("qnaMain")
	public String qnaMain(HttpSession session, Model model) {
		UserDto sessionUser= (UserDto)session.getAttribute("user");
		session.setAttribute("user", sessionUser);
	
		List<QnaDto> qnaList = qnaListsProcess(model, session);
		
		
		if(qnaList.size() == 0) {
			return "www/qna/emptyQna";
		}else {
			model.addAttribute("qnaList",qnaList);
			return "www/qna/qnaMain";
		}
	}
	

	@RequestMapping("readQnaPage")
	public String readQnaPage(Model model, int qna_id) {
		
		
	    Map<String, Object> map = qnaService.getQnaData(qna_id);

	    QnaDto QnaDto = (QnaDto) map.get("QnaDto");
	    String contents = QnaDto.getContents();
	    
	    // html escape
	    contents = StringEscapeUtils.escapeHtml4(contents);
	    contents = contents.replaceAll("\n", "<br>");
	    QnaDto.setContents(contents);

	    model.addAttribute("data", map);

	    return "www/qna/readQnaPage";
	}
	
	//readpage service
//	@RequestMapping("readQnaPage")
//	public String readQnaPage(Model model, int qna_id) {
//		
//		List<Tb_Qna_ImageDto> imageList = qnaService.Tb_Qna_ImageDto(qna_id);
//		Tb_QnaDto qnaDto = qnaService.selectQnaId(qna_id);
//		
//		for(Tb_Qna_ImageDto qn : imageList) {
//			System.out.println(qn.getLink());
//		}
//		
//		model.addAttribute("imageList", imageList);
//		model.addAttribute("qnaDto", qnaDto);
//		
//		return "qna/readQnaPage";
//	}

	
	

	@RequestMapping("emptyQna")
	public String emptyQna() {
		return "www/qna/emptyQna";
	}
	
	

}
