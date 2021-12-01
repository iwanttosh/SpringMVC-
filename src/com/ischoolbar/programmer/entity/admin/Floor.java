package com.ischoolbar.programmer.entity.admin;

import org.springframework.stereotype.Component;

/**
 * 楼层注解
 * 
 * @author 10268
 *
 */

@Component
public class Floor {
	
	private Long id;//区域id
	private String name;//区域名称
	
	private String remark;//备注

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
	
	
}
