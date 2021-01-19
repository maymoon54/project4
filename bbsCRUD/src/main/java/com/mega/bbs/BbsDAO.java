package com.mega.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BbsDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	public int insert(BbsDTO bbsDTO) {
		int result = 0;
		result = mybatis.insert("bbs.insert", bbsDTO);
		return result;
	}

	public BbsDTO one(BbsDTO bbsDTO) {
		BbsDTO bbsDTO2 = mybatis.selectOne("bbs.one", bbsDTO);
		return bbsDTO2;
	}

	public List<BbsDTO> list(PagingDTO pagingDTO) {		
		List<BbsDTO> list = mybatis.selectList("bbs.list",pagingDTO);
		int reply = 0;
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getReply());	
			System.out.println(list.get(i).getBno());
			reply = mybatis.selectOne("bbs.countReply",list.get(i).getBno());
			list.get(i).setReply(reply);
		}
		return list;
	}

	public int delete(BbsDTO bbsDTO) {
		return mybatis.delete("bbs.delete", bbsDTO);
	}

	public int update(BbsDTO bbsDTO) {
		return mybatis.update("bbs.update", bbsDTO);
	}

	public void pluscnt(BbsDTO bbsDTO) {	
		mybatis.selectOne("bbs.pluscnt", bbsDTO);
	}

	public int countBbs() {		
		return mybatis.selectOne("bbs.countbbs");
	}
	
	public int countReply(int bno) {		
		return mybatis.selectOne("bbs.countReply");
	}
	
	public BbsDTO bbsPw(BbsDTO bbsDTO) {
		BbsDTO pwc = mybatis.selectOne("bbs.pwc", bbsDTO);
		System.out.println("다오" + pwc.getPw());
		return pwc;
	}
	
	//검색	
	public List<BbsDTO> search(BbsDTO bbsDTO) {		
		List<BbsDTO> search = mybatis.selectList("bbs.search" , bbsDTO);
		int reply = 0;
		for (int i = 0; i < search.size(); i++) {
			reply = mybatis.selectOne("bbs.countReply",search.get(i).getBno());
			search.get(i).setReply(reply);
		}
		return search;
	}
	
	public int countSearch() {
		return mybatis.selectOne("bbs.countsearch");
	}
}
