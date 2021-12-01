package com.ischoolbar.programmer.entity.admin;

import org.springframework.stereotype.Component;

/**
 * 用户实体类
 * @author llq
 *
 */
@Component
public class User {
	private Long id;//用户id，设置自增
	private String username;//用户名，登录名
	private String password;//登录密码
	private Long roleId;//所属角色id
	private String photo;//头像照片地址
	private int sex;//性别0,代表未知，1代表男，2代表女
	private Integer age;//年龄
	private String address;//家庭住址
	private String idCard;//身份证号
	private String mobile;//手机号
	private String realName;//真实姓名
	
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
