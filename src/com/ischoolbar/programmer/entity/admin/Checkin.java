package com.ischoolbar.programmer.entity.admin;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * 订单实体类
 * @author Administrator
 *
 */
@Component
public class Checkin {
	private Long id;//id
	private Long tableId;//餐桌id
	private Long tableTypeId;//类型id
	private int useNum;//使用人数
	private Float checkinPrice;//用餐价格
	private String name;//姓名
	private String mobile;//手机号
	private int status;//状态：0：使用中，1：已结算离店
	private String arriveDate;//开始时间
	private Date leaveDate;//离店时间
	private Date createTime;//创建时间
	private Long bookOrderId;//预定订单id，可为空
	private String remark;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getTableId() {
		return tableId;
	}
	public void setTableId(Long tableId) {
		this.tableId = tableId;
	}
	public Long getTableTypeId() {
		return tableTypeId;
	}
	public void setTableTypeId(Long tableTypeId) {
		this.tableTypeId = tableTypeId;
	}
	public int getUseNum() {
		return useNum;
	}
	public void setUseNum(int useNum) {
		this.useNum = useNum;
	}
	public Float getCheckinPrice() {
		return checkinPrice;
	}
	public void setCheckinPrice(Float checkinPrice) {
		this.checkinPrice = checkinPrice;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getArriveDate() {
		return arriveDate;
	}
	public void setArriveDate(String arriveDate) {
		this.arriveDate = arriveDate;
	}

	public Date getLeaveDate() {
		return leaveDate;
	}
	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Long getBookOrderId() {
		return bookOrderId;
	}
	public void setBookOrderId(Long bookOrderId) {
		this.bookOrderId = bookOrderId;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
}
