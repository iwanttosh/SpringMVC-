package com.ischoolbar.programmer.entity.admin;

import org.springframework.stereotype.Component;

/**
 * �������ʵ����
 * @author 10268
 *
 */
@Component
public class Table {
	
	private Long id;//����id
	private String sn;//�������
	private Long tableTypeId;//��������id
	private Long floorId;//��������id
	private int status;//����״̬��0������,1:����,2:��ɨ��
	private String remark;//������ע
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}

	public Long getTableTypeId() {
		return tableTypeId;
	}
	public void setTableTypeId(Long tableTypeId) {
		this.tableTypeId = tableTypeId;
	}
	public Long getFloorId() {
		return floorId;
	}
	public void setFloorId(Long floorId) {
		this.floorId = floorId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

	
	
	
	
}
