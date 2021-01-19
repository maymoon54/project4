package com.mega.bbs;

import java.util.List;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonFormat;

@Controller
public class BbsController {

	@Autowired
	BbsService bbs;

	@Autowired
	ReplyService reply;

	@RequestMapping("write.do")
	public void insert(BbsDTO bbsDTO) {
/*		String content = bbsDTO.getContent();
		content = content.replace("\r\n","<br>");
		bbsDTO.setContent(content); 
		디비에 br을 넣어버리니까 수정창에 br이 출력되고,, 검색에서 br이 걸림*/
		bbs.insert(bbsDTO);
	}

	@RequestMapping("one.do")
	public void one(BbsDTO bbsDTO, Model model) {
		BbsDTO one = bbs.one(bbsDTO);
		String content = one.getContent();
		content = content.replace("\r\n","<br>");
		one.setContent(content);
		model.addAttribute("one", one); // 글번호로 검색내용 모델에 저장
		System.out.println("모델" + one);

		// 댓글
		model.addAttribute("list", reply.list(bbsDTO.getBno()));//전체댓글
		model.addAttribute("total", reply.list(bbsDTO.getBno()).size());
	}


/*	@ResponseBody
	@RequestMapping("list.do")
	public List<BbsDTO> list() {
		System.out.println("컨트롤러 호출");
		return bbs.list();
	}*/

	@RequestMapping("all.do")
	public String all(PagingDTO pagingDTO, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
			int total = bbs.countBbs();
			System.out.println("전체글갯수는" + total);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "10";
			}
			
			pagingDTO = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", pagingDTO);
			model.addAttribute("viewAll", bbs.list(pagingDTO));		
			
			return "/bbsPaging";		
	}
	
	@RequestMapping("search.do")
	public void search(BbsDTO bbsDTO, Model model) {		
		System.out.println(bbsDTO.getKeyword());
		List<BbsDTO> search = bbs.search(bbsDTO);
		model.addAttribute("search", search);
	}
	
	@RequestMapping("bbsDelete.do")
	public String delete(BbsDTO bbsDTO) {
		boolean pwc = bbs.bbsPw(bbsDTO);
		if (pwc) {
			int result = bbs.delete(bbsDTO);
			if(result ==1) {
				return "success";
			}else {
				return "fail";//views/fail.jsp
			}	
		}else {
			return "fail";//views/fail.jsp
		}		
	}
	
	//글 수정하기 전에 디비 내용 읽어오기
	@RequestMapping("read.do")
	public String read(BbsDTO bbsDTO, Model model) {
		boolean pwc = bbs.bbsPw(bbsDTO);		
		if (pwc) {
			BbsDTO read = bbs.one(bbsDTO);
			model.addAttribute("read", read); 
			System.out.println("모델" + read);
			return "read";
		}else {
			return "fail";
		}
		
	}
	
	@RequestMapping("update.do")
	public String update(BbsDTO bbsDTO) {
		int result = bbs.update(bbsDTO);		
		if (result == 1) {
			return "redirect:one.do?bno=" + bbsDTO.getBno();		
		}
		return "fail";
	}



}
