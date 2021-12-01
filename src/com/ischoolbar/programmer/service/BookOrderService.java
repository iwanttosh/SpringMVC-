package com.ischoolbar.programmer.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.entity.BookOrder;


/**
 * 客户预定订单
 * @author 10268
 *
 */
@Service
public interface BookOrderService {
	public int add(BookOrder bookOrder);	
	public int edit(BookOrder bookOrder);	
	public int delete(Long id);	
	public List<BookOrder> findList(Map<String,Object> querMap);
	public Integer getTotal(Map<String,Object> querMap);
	public BookOrder find(Long id);

}
