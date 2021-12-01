package com.ischoolbar.programmer.entity;

import org.springframework.stereotype.Component;

/**
 * 餐桌类别实体类
 * @author 10268
 *
 */
@Component
public class TableType {
	
	private Long id;//id
	private String name;//座位名称
	private String type;//类别名称
	private String photo;//餐桌类型图片
	private int useNum;//作为人数，可用人数
	private int tableNum;//桌子总数
	private int avilableNum;//可预定可用餐数
	private int bookNum;//预定数
	private Integer surNum;//正在使用桌数
	private int status;//状态 , 0 可用，1不可用
	private String remark;//备注
	private String price;
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Integer getSurNum() {
		return surNum;
	}
	public void setSurNum(Integer surNum) {
		this.surNum = surNum;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getUseNum() {
		return useNum;
	}
	public void setUseNum(int useNum) {
		this.useNum = useNum;
	}
	public int getTableNum() {
		return tableNum;
	}
	public void setTableNum(int tableNum) {
		this.tableNum = tableNum;
	}
	public int getAvilableNum() {
		return avilableNum;
	}
	public void setAvilableNum(int avilableNum) {
		this.avilableNum = avilableNum;
	}
	public int getBookNum() {
		return bookNum;
	}
	public void setBookNum(int bookNum) {
		this.bookNum = bookNum;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	
	
}
