package com.mega.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public int create(ReplyDTO replyDTO) {
		int result = mybatis.insert("reply.create", replyDTO);
		return result;		
	}
	
	public List<ReplyDTO> list(int bno) {
		List<ReplyDTO> list = mybatis.selectList("reply.list", bno);
		System.out.println(list);
		return list;
	}
	
	public int delete(ReplyDTO replyDTO) {		
		int result = mybatis.delete("reply.delete", replyDTO);
		return result;
	}
	

	public ReplyDTO replyPw(ReplyDTO replyDTO) {
		ReplyDTO pwc =  mybatis.selectOne("reply.pw", replyDTO);
		return pwc;	
	}




	

	
	
	
	
	
}
