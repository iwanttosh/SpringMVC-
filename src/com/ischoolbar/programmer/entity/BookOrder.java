package com.ischoolbar.programmer.entity;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * 预定订单实体类
 * @author Administrator
 *
 */
@Component
public class BookOrder {
	private Long id;//预定订单id
	private Long accountId;//客户id
	private Long tableTypeId;//餐桌类型id
	private String name;//预定者姓名
	private int useNum;//使用人数
	private String mobile;//手机号
	private int status;//状态：0：预定中，1：已使用,2:已结算离店,3已超时
	private String arriveDate;//使用日期时间
	private Date createTime;//预定日期
	private String remark;//备注
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getAccountId() {
		return accountId;
	}
	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}
	public Long getTableTypeId() {
		return tableTypeId;
	}
	public void setTableTypeId(Long tableTypeId) {
		this.tableTypeId = tableTypeId;
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
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getUseNum() {
		return useNum;
	}
	public void setUseNum(int useNum) {
		this.useNum = useNum;
	}

	
}
