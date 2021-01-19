package com.mega.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class BbsService {

	@Autowired
	BbsDAO dao;

	// 글쓰기
	public void insert(BbsDTO bbsDTO) {
		dao.insert(bbsDTO);
	}

	// 상세게시물
	public BbsDTO one(BbsDTO bbsDTO) {
		dao.pluscnt(bbsDTO); // 상세게시물 조회 전에 조회수를 증가시킨다
		return dao.one(bbsDTO);
	}

	// 전체게시물
	public List<BbsDTO> list(PagingDTO pagingDTO) {
		return dao.list(pagingDTO);
	}	

	// 전체게시물 개수
	public int countBbs() {
		return dao.countBbs();
	}
	
	// 글삭제
	public int delete(BbsDTO bbsDTO) {
		return dao.delete(bbsDTO);
	}
	
	// 글수정
	public int update(BbsDTO bbsDTO) {
		return dao.update(bbsDTO);
	}
	
	//비밀번호 일치여부
	public boolean bbsPw(BbsDTO input) {
		String pw = input.getPw();
		BbsDTO db = dao.bbsPw(input); //전달받은 글번호로 DB비밀번호 조회하기
		String pwc = db.getPw();
		System.out.println("서비스" + pwc);
		if (pw.equals(pwc)) {
			return true;
		}else {
			return false;
		}
	}

	//검색	
	public List<BbsDTO> search(BbsDTO bbsDTO) {
		return dao.search(bbsDTO);
	}


}
