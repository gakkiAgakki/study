package cn.haokeweiye.bean;

import java.io.Serializable;
import java.util.List;

public class PageBean implements Serializable {
	private List<Message> pList;//留言集合
	private int pages;//总页数
	private int pageNum;//当前页码数
	private int rows;//一页记录数
	private int startIndex;//开始索引
	private int totalRecord;//总记录数
	
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public List<Message> getpList() {
		return pList;
	}
	public void setpList(List<Message> pList) {
		this.pList = pList;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
}
