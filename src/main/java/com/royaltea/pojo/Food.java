package com.royaltea.pojo;

import java.math.BigDecimal;

public class Food implements java.io.Serializable {
	private Integer fId;
	private Integer ftId;
	private String ftName;
	private String fName;
	private BigDecimal fPrice;
	private BigDecimal fDprice;
	private BigDecimal fDc;
	private Integer fStatus;
	private String fImg;
	private String fDec;
	private Integer sales;
	private Integer num;
	
	public Integer getSales() {
		return sales;
	}
	public void setSales(Integer sales) {
		this.sales = sales;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public BigDecimal getfDc() {
		return fDc;
	}
	public void setfDc(BigDecimal fDc) {
		this.fDc = fDc;
	}
	public Integer getfStatus() {
		return fStatus;
	}
	public void setfStatus(Integer fStatus) {
		this.fStatus = fStatus;
	}
	public Integer getfId() {
		return fId;
	}
	public void setfId(Integer fId) {
		this.fId = fId;
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
	public String getfImg() {
		return fImg;
	}
	public void setfImg(String fImg) {
		this.fImg = fImg;
	}
	public String getfDec() {
		return fDec;
	}
	public void setfDec(String fDec) {
		this.fDec = fDec;
	}
	@Override
	public String toString() {
		return "Food [fId=" + fId + ", ftId=" + ftId + ", ftName=" + ftName + ", fName=" + fName + ", fPrice=" + fPrice
				+ ", fDprice=" + fDprice + ", fDc=" + fDc + ", fStatus=" + fStatus + ", fImg=" + fImg + ", fDec=" + fDec
				+ ", sales=" + sales + ", num=" + num + "]";
	}
}
