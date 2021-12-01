package com.ischoolbar.programmer.service.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.dao.admin.TableDao;
import com.ischoolbar.programmer.entity.admin.Table;
import com.ischoolbar.programmer.service.admin.TableService;

@Service
public class TableServiceImpl implements TableService {

	@Autowired
	public TableDao tableDao;
	
	@Override
	public int add(Table table) {
		// TODO Auto-generated method stub
		return tableDao.add(table);
	}

	@Override
	public int edit(Table table) {
		// TODO Auto-generated method stub
		return tableDao.edit(table);
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return tableDao.delete(id);
	}

	@Override
	public List<Table> findList(Map<String, Object> querMap) {
		// TODO Auto-generated method stub
		return tableDao.findList(querMap);
	}

	@Override
	public List<Table> findAll() {
		// TODO Auto-generated method stub
		return tableDao.findAll();
	}

	@Override
	public Integer getTotal(Map<String, Object> querMap) {
		// TODO Auto-generated method stub
		return tableDao.getTotal(querMap);
	}

	@Override
	public Table find(Long id) {
		// TODO Auto-generated method stub
		return tableDao.find(id);
	}

	@Override
	public Table findBySn(String sn) {
		// TODO Auto-generated method stub
		return tableDao.findBySn(sn);
	}

}
