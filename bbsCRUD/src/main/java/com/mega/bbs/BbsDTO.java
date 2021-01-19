package com.mega.bbs;

import java.sql.Date;



public class BbsDTO {
	

	@Override
	public String toString() {
		return "BbsDTO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", pw=" + pw
				+ ", cdate=" + cdate + "]";
	}
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String keyword;
	private String pw;
	private Date cdate;
	private int cnt;
	private int reply;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	
	
}
