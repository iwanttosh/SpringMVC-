package com.ischoolbar.programmer.service.admin;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.entity.admin.Floor;

import  java.util.Map;

@Service
public interface FloorSercvice {

	public int add(Floor floor);
	
	public int edit(Floor floor);
	

	
	public List<Floor> findList(Map<String, Object> queryMap);
	
	public List<Floor> findAll();
	
	public Integer getTotal(Map<String, Object> queryMap);

	public int delete(Long id);




}
