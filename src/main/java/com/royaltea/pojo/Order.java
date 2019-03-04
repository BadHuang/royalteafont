package com.royaltea.pojo;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class Order {
	private String oId;
	private Integer odId;
	private Date oTime;
	private String oTimes;
	private Integer oOut;
	private Integer oStatus;
	private BigDecimal oTotal;
	private BigDecimal oDtotal;
	private String oDec;
	private List<OrderInfo> oiList;
	
	public BigDecimal getoDtotal() {
		return oDtotal;
	}
	public void setoDtotal(BigDecimal oDtotal) {
		this.oDtotal = oDtotal;
	}
	public String getoTimes() {
		return oTimes;
	}
	public void setoTimes(String oTimes) {
		this.oTimes = oTimes;
	}
	public Integer getOdId() {
		return odId;
	}
	public void setOdId(Integer odId) {
		this.odId = odId;
	}
	public List<OrderInfo> getOiList() {
		return oiList;
	}
	public void setOiList(List<OrderInfo> oiList) {
		this.oiList = oiList;
	}
	public String getoId() {
		return oId;
	}
	public void setoId(String oId) {
		this.oId = oId;
	}
	public Date getoTime() {
		return oTime;
	}
	public void setoTime(Date oTime) {
		this.oTime = oTime;
	}
	public Integer getoOut() {
		return oOut;
	}
	public void setoOut(Integer oOut) {
		this.oOut = oOut;
	}
	public Integer getoStatus() {
		return oStatus;
	}
	public void setoStatus(Integer oStatus) {
		this.oStatus = oStatus;
	}
	public BigDecimal getoTotal() {
		return oTotal;
	}
	public void setoTotal(BigDecimal oTotal) {
		this.oTotal = oTotal;
	}
	public String getoDec() {
		return oDec;
	}
	public void setoDec(String oDec) {
		this.oDec = oDec;
	}
	
}
