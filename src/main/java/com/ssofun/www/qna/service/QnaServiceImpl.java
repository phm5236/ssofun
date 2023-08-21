package com.ssofun.www.qna.service;


import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ssofun.dto.*;
import com.ssofun.www.qna.mapper.QnaSqlMapper;

@Service
public class QnaServiceImpl {

	@Autowired
	private QnaSqlMapper qnaSqlMapper;
	
	
	
	public UserDto getUserByEmailAndPw(UserDto userDto) {
		
		UserDto sessionUser = qnaSqlMapper.getUserByEmailAndPw(userDto);
		
		return sessionUser;
	}

	
	//qna 유저 글입력
	public void writeQna(QnaDto	qnaDto, List<Qna_ImageDto> Qna_ImageDtoList){
		
		

		qnaSqlMapper.insertQna(qnaDto);

		int qnaId = qnaSqlMapper.selectQnaByLatestQnaId();//pk로 userid로 qna정보가져옴
		
		for(Qna_ImageDto Qna_ImageDto:Qna_ImageDtoList) {//목록으로 출력
			
			Qna_ImageDto.setQna_id(qnaId);
			qnaSqlMapper.insertQnaImage(Qna_ImageDto);
			
			}
		}
	
	
	
//	public void insertQnaImage( List<Tb_Qna_ImageDto> tb_Qna_ImageDtoList) {
//		int qnaId = qnaSqlMapper.createPk();
//	
//		
//		for(Tb_Qna_ImageDto tb_Qna_ImageDto:tb_Qna_ImageDtoList) {
//			tb_Qna_ImageDto.setQna_id(qnaId);
//			qnaSqlMapper.insertQnaImage(tb_Qna_ImageDto);
//			
//	}
//	}
//	
	
	//user_id로 작성한 qna글목록가져옴
	public List<QnaDto> getQnaList(int user_id){
		
		
		List<QnaDto> qnaDtoList = qnaSqlMapper.qnaListByUserId(user_id);
		
		return qnaDtoList;
	}

//qna_id
	public Map<String, Object> getQnaData(int qna_id) {
		
		Map<String, Object> map = new HashMap<>();
		
		
		
		QnaDto QnaDto = qnaSqlMapper.selectQnaDataBYQnaId(qna_id);
			
		System.out.println(QnaDto);
		
		List<Qna_ImageDto> Qna_ImageDtoList= qnaSqlMapper.selectQnaImageByQnaId(qna_id);
	
		map.put("QnaDto", QnaDto);
		map.put("Qna_ImageDtoList", Qna_ImageDtoList);
		
	return map;
}
	
	
//	public List<Tb_Qna_ImageDto> Tb_Qna_ImageDto(int qna_id){
//		List<Tb_Qna_ImageDto> ImageList = qnaSqlMapper.selectQnaImageByQnaId(qna_id);
//		return ImageList;
//	}
//	
//	public Tb_QnaDto selectQnaId(int qna_id) {
//		Tb_QnaDto qnaDto = qnaSqlMapper.selectQnaDataBYQnaId(qna_id);
//		return qnaDto;
//	}
	

	
	//email
	public UserDto selectUserDtoByEmail(String email) {
		
		UserDto userDto	= qnaSqlMapper.selectUserDtoByEmail(email);
		
		return userDto;
	}
	
}




