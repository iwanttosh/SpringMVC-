package com.ischoolbar.programmer.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ischoolbar.programmer.entity.TableType;
import com.ischoolbar.programmer.entity.admin.Table;

/**
 * 餐桌类别Dao
 * @author 10268
 *
 */

@Repository
public interface TableDao {
	
	public int add(Table table);//添加	
	public int edit(Table table);//修改	
	public int delete(Long id);//删除
	public List<Table> findList(Map<String,Object> querMap);//列表查询
	public List<Table> findAll();//查询所有
	public Integer getTotal(Map<String,Object> querMap);//分页查询
	public Table find(Long id);//单个查询
	public Table findBySn(String sn);//通过姓名查询
}
