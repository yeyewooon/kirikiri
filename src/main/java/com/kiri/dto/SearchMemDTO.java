package com.kiri.dto;

public class SearchMemDTO {
	private int start;
	private int end;
	private String searchType;
	private String searchKeyword;
	
	public SearchMemDTO() {}
	public SearchMemDTO(int start, int end, String searchType, String searchKeyword) {
		super();
		this.start = start;
		this.end = end;
		this.searchType = searchType;
		this.searchKeyword = searchKeyword;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	@Override
	public String toString() {
		return "SearchMemDTO [start=" + start + ", end=" + end + ", searchType=" + searchType + ", searchKeyword="
				+ searchKeyword + "]";
	}

}
