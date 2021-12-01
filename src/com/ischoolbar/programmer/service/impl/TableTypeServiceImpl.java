package com.ischoolbar.programmer.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.dao.TableTypeDao;
import com.ischoolbar.programmer.entity.TableType;
import com.ischoolbar.programmer.service.TableTypeService;

@Service
public class TableTypeServiceImpl implements TableTypeService{

	@Autowired
	private TableTypeDao tableTypeDao;
	
	@Override
	public int add(TableType tableType) {
		// TODO Auto-generated method stub
		return tableTypeDao.add(tableType);
	}

	@Override
	public int edit(TableType tableType) {
		// TODO Auto-generated method stub
		return tableTypeDao.edit(tableType);
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return tableTypeDao.delete(id);
	}

	@Override
	public Integer getTotal(Map<String, Object> querMap) {
		// TODO Auto-generated method stub
		return tableTypeDao.getTotal(querMap);
	}

	@Override
	public List<TableType> findList(Map<String, Object> querMap) {
		// TODO Auto-generated method stub
		return tableTypeDao.findList(querMap);
	}

	@Override
	public List<TableType> findAll() {
		// TODO Auto-generated method stub
		return tableTypeDao.findAll();
	}

	@Override
	public TableType find(Long id) {
		// TODO Auto-generated method stub
		return tableTypeDao.find(id);
	}

	@Override
	public int updateNum(TableType tableType) {
		// TODO Auto-generated method stub
		return tableTypeDao.updateNum(tableType);
	}

}
