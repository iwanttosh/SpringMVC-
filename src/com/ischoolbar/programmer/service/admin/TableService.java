package com.ischoolbar.programmer.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;



import com.ischoolbar.programmer.entity.TableType;
import com.ischoolbar.programmer.entity.admin.Table;

@Service
public interface TableService {
	
	public int add(Table table);//���	
	public int edit(Table table);//�޸�	
	public int delete(Long id);//ɾ��
	public List<Table> findList(Map<String,Object> querMap);//�б��ѯ
	public List<Table> findAll();//��ѯ����
	public Integer getTotal(Map<String,Object> querMap);//��ҳ��ѯ
	public Table find(Long id);//������ѯ
	public Table findBySn(String sn);//ͨ��������ѯ
}
