package com.ischoolbar.programmer.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ischoolbar.programmer.entity.TableType;

/**
 * 餐桌类别Dao
 * @author 10268
 *
 */

@Repository
public interface TableTypeDao {
	public int add(TableType tableType);//添加
	
	public int edit(TableType tableType);//修改
	
	public int delete(Long id);//删除
	public List<TableType> findList(Map<String,Object> querMap);//列表查询

	public Integer getTotal(Map<String,Object> querMap);//分页查询
	

	public List<TableType> findAll();//查询所有
	
	public TableType find(Long id);//单个查询
	public int updateNum(TableType tableType);
}
