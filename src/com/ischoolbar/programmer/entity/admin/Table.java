package com.ischoolbar.programmer.entity.admin;

import org.springframework.stereotype.Component;

/**
 * 餐桌类别实体类
 * @author 10268
 *
 */
@Component
public class Table {
	
	private Long id;//餐桌id
	private String sn;//餐桌编号
	private Long tableTypeId;//餐桌类型id
	private Long floorId;//所属区域id
	private int status;//餐桌状态，0：可用,1:已用,2:打扫中
	private String remark;//餐桌备注
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
