package com.mega.bbs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReplyController {
	
	@Autowired
	ReplyService service;
	
	@RequestMapping("create.do")
	public String create(ReplyDTO replyDTO) {		
		int result = service.create(replyDTO);
		if(result ==1) {			
			return "ok";
		}else {			
			return "fail";
		}
	}
	
	@RequestMapping("replyDelete.do")
	public String delete(ReplyDTO replyDTO) {
		boolean pwc = service.replyPw(replyDTO);
		if (pwc) {
			int result = service.delete(replyDTO);
			if(result ==1) {
				return "redirect:one.do?bno=" + replyDTO.getBno();
			}else {
				return "fail";//views/fail.jsp
			}	
		}else {
			return "fail";//views/fail.jsp
		}
		
	}
}
