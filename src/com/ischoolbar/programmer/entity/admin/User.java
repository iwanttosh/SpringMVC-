package com.ischoolbar.programmer.entity.admin;

import org.springframework.stereotype.Component;

/**
 * �û�ʵ����
 * @author llq
 *
 */
@Component
public class User {
	private Long id;//�û�id����������
	private String username;//�û�������¼��
	private String password;//��¼����
	private Long roleId;//������ɫid
	private String photo;//ͷ����Ƭ��ַ
	private int sex;//�Ա�0,����δ֪��1�����У�2����Ů
	private Integer age;//����
	private String address;//��ͥסַ
	private String idCard;//���֤��
	private String mobile;//�ֻ���
	private String realName;//��ʵ����
	
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	
}
