package com.ischoolbar.programmer.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


import com.ischoolbar.programmer.entity.TableType;

@Service
public interface TableTypeService {
	
	public int add(TableType tableType);//添加
	
	public int edit(TableType tableType);//修改
	
	public int delete(Long id);//删除
	public List<TableType> findList(Map<String,Object> querMap);//列表查询

	public Integer getTotal(Map<String,Object> querMap);//分页查询
	

	public List<TableType> findAll();//查询所有
	
	public TableType find(Long id);//单个查询
	public int updateNum(TableType tableType);
}
