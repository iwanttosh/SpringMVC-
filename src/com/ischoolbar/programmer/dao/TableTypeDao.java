package com.ischoolbar.programmer.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ischoolbar.programmer.entity.TableType;

/**
 * �������Dao
 * @author 10268
 *
 */

@Repository
public interface TableTypeDao {
	public int add(TableType tableType);//���
	
	public int edit(TableType tableType);//�޸�
	
	public int delete(Long id);//ɾ��
	public List<TableType> findList(Map<String,Object> querMap);//�б��ѯ

	public Integer getTotal(Map<String,Object> querMap);//��ҳ��ѯ
	

	public List<TableType> findAll();//��ѯ����
	
	public TableType find(Long id);//������ѯ
	public int updateNum(TableType tableType);
}
