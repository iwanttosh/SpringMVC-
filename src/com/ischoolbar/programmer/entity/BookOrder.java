package com.ischoolbar.programmer.entity;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * Ԥ������ʵ����
 * @author Administrator
 *
 */
@Component
public class BookOrder {
	private Long id;//Ԥ������id
	private Long accountId;//�ͻ�id
	private Long tableTypeId;//��������id
	private String name;//Ԥ��������
	private int useNum;//ʹ������
	private String mobile;//�ֻ���
	private int status;//״̬��0��Ԥ���У�1����ʹ��,2:�ѽ������,3�ѳ�ʱ
	private String arriveDate;//ʹ������ʱ��
	private Date createTime;//Ԥ������
	private String remark;//��ע
	
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
