package com.mega.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyService {
	
	@Autowired
	ReplyDAO dao;
	
	//댓글등록
	public int create(ReplyDTO replyDTO) {
		return dao.create(replyDTO);
	}
	
	//전체댓글
	public List<ReplyDTO> list(int bno) {
		return dao.list(bno);
	}
	
	//댓글삭제
	public int delete(ReplyDTO replyDTO) {		
		return dao.delete(replyDTO);
	}
	
	//댓글삭제시 비밀번호 확인
	public boolean replyPw(ReplyDTO input) {
		String pw = input.getPw(); //입력한 비밀번호
		System.out.println("입력한 비밀번호" + pw);
		ReplyDTO db = dao.replyPw(input); //전달받은 rno로 db에 저장된 비밀번호 가져오기
		String pwc = db.getPw();
		System.out.println("디비 비밀번호" + pwc);
		if (pw.equals(pwc)) {			
			return true;
		}else {
			System.out.println("비밀번호 틀렸다!");
			return false;
		}		
	}
}
