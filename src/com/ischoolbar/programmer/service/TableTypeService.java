package com.ischoolbar.programmer.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


import com.ischoolbar.programmer.entity.TableType;

@Service
public interface TableTypeService {
	
	public int add(TableType tableType);//���
	
	public int edit(TableType tableType);//�޸�
	
	public int delete(Long id);//ɾ��
	public List<TableType> findList(Map<String,Object> querMap);//�б��ѯ

	public Integer getTotal(Map<String,Object> querMap);//��ҳ��ѯ
	

	public List<TableType> findAll();//��ѯ����
	
	public TableType find(Long id);//������ѯ
	public int updateNum(TableType tableType);
}
