package com.royaltea.pojo;

import java.util.List;

public class FoodType {
	private Integer ftId;
	private String ftName;
	private String ftDec;
	private List<Food> fList;
	
	public List<Food> getfList() {
		return fList;
	}
	public void setfList(List<Food> fList) {
		this.fList = fList;
	}
	public Integer getFtId() {
		return ftId;
	}
	public void setFtId(Integer ftId) {
		this.ftId = ftId;
	}
	public String getFtName() {
		return ftName;
	}
	public void setFtName(String ftName) {
		this.ftName = ftName;
	}
	public String getFtDec() {
		return ftDec;
	}
	public void setFtDec(String ftDec) {
		this.ftDec = ftDec;
	}
	
}
