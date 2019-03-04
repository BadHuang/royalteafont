package com.royaltea.pojo;

import java.math.BigDecimal;

public class OrderInfo {
	private Integer oiId;
	private String oId;
	private Integer fId;
	private Integer fNum;
	private String fName;
	private String ftName;
	private BigDecimal fPrice;
	private BigDecimal fDprice;
	private BigDecimal fDc;
	private String fImg;
	
	public String getFtName() {
		return ftName;
	}
	public void setFtName(String ftName) {
		this.ftName = ftName;
	}
	public Integer getOiId() {
		return oiId;
	}
	public void setOiId(Integer oiId) {
		this.oiId = oiId;
	}
	public String getoId() {
		return oId;
	}
	public void setoId(String oId) {
		this.oId = oId;
	}
	public Integer getfId() {
		return fId;
	}
	public void setfId(Integer fId) {
		this.fId = fId;
	}
	public Integer getfNum() {
		return fNum;
	}
	public void setfNum(Integer fNum) {
		this.fNum = fNum;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public BigDecimal getfPrice() {
		return fPrice;
	}
	public void setfPrice(BigDecimal fPrice) {
		this.fPrice = fPrice;
	}
	public BigDecimal getfDprice() {
		return fDprice;
	}
	public void setfDprice(BigDecimal fDprice) {
		this.fDprice = fDprice;
	}
	public BigDecimal getfDc() {
		return fDc;
	}
	public void setfDc(BigDecimal fDc) {
		this.fDc = fDc;
	}
	public String getfImg() {
		return fImg;
	}
	public void setfImg(String fImg) {
		this.fImg = fImg;
	}
	
}
