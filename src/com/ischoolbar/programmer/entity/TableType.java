package com.ischoolbar.programmer.entity;

import org.springframework.stereotype.Component;

/**
 * �������ʵ����
 * @author 10268
 *
 */
@Component
public class TableType {
	
	private Long id;//id
	private String name;//��λ����
	private String type;//�������
	private String photo;//��������ͼƬ
	private int useNum;//��Ϊ��������������
	private int tableNum;//��������
	private int avilableNum;//��Ԥ�����ò���
	private int bookNum;//Ԥ����
	private Integer surNum;//����ʹ������
	private int status;//״̬ , 0 ���ã�1������
	private String remark;//��ע
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
