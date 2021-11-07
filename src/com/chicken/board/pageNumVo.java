package com.chicken.board;

public class pageNumVo {
	private int StartNum ;
	private int EndNum;
	
	
	private int noticeCount;
	
	
	public int getNoticeCount() {
		return noticeCount;
	}
	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}
	public pageNumVo(int startNum, int endNum) {
		super();
		StartNum = startNum;
		EndNum = endNum;
	}
	
	public pageNumVo(int startNum, int endNum, int noticeCount) {
		super();
		StartNum = startNum;
		EndNum = endNum;
		this.noticeCount = noticeCount;
	}
	
	public int getStartNum() {
		return StartNum;
	}
	public void setStartNum(int startNum) {
		StartNum = startNum;
	}

	public void AddStartNum() {
		StartNum = StartNum+5;
	}
	public void AddEndNum() {
		EndNum = EndNum+5;
	}
	
	
	public int getEndNum() {
		return EndNum;
	}
	public void setEndNum(int endNum) {
		EndNum = endNum;
	}
	
	
}
