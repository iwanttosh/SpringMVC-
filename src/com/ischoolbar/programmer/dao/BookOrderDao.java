package com.ischoolbar.programmer.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.entity.BookOrder;


/**
 * 客户预定订单
 * @author 10268
 *
 */
@Repository
public interface BookOrderDao {
	public int add(BookOrder bookOrder);	
	public int edit(BookOrder bookOrder);	
	public int delete(Long id);	
	public List<BookOrder> findList(Map<String,Object> querMap);
	public Integer getTotal(Map<String,Object> querMap);
	public BookOrder find(Long id);

}
