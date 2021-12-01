package com.ischoolbar.programmer.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.BookOrder;
import com.ischoolbar.programmer.entity.TableType;
import com.ischoolbar.programmer.entity.admin.Checkin;
import com.ischoolbar.programmer.entity.admin.Table;
import com.ischoolbar.programmer.page.admin.Page;
import com.ischoolbar.programmer.service.AccountService;
import com.ischoolbar.programmer.service.BookOrderService;
import com.ischoolbar.programmer.service.TableTypeService;

/**
 * Ԥ�����������̨������
 * @author Administrator
 *
 */
@RequestMapping("/admin/book_order")
@Controller
public class BookOrderController {
	
	@Autowired
	private AccountService accountService;
	@Autowired
	private TableTypeService tableTypeService;
	@Autowired
	private BookOrderService bookOrderService;

	/**
	 * Ԥ�����������б�ҳ��
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.addObject("tableTypeList", tableTypeService.findAll());
		model.addObject("accountList", accountService.findAll());
		model.setViewName("book_order/list");
		return model;
	}
	
	/**
	 * Ԥ��������Ϣ��Ӳ���
	 * @param bookOrder
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(BookOrder bookOrder){
		Map<String, String> ret = new HashMap<String, String>();
		if(bookOrder == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ��Ԥ��������Ϣ!");
			return ret;
		}
	
		if(bookOrder.getTableTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "���Ͳ���Ϊ��!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getName())){
			ret.put("type", "error");
			ret.put("msg", "Ԥ��������ϵ�����Ʋ���Ϊ��!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getMobile())){
			ret.put("type", "error");
			ret.put("msg", "Ԥ��������ϵ���ֻ��Ų���Ϊ��!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getArriveDate())){
			ret.put("type", "error");
			ret.put("msg", "����ʱ�䲻��Ϊ��!");
			return ret;
		}

		bookOrder.setCreateTime(new Date());
		bookOrder.setStatus(0);
		if(bookOrderService.add(bookOrder) <= 0){
			ret.put("type", "error");
			ret.put("msg", "���ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		TableType tableType = tableTypeService.find(bookOrder.getTableTypeId());
		//Ԥ���ɹ���ȥ�޸ĸ����͵�Ԥ����
		if(tableType != null){
			tableType.setBookNum(tableType.getBookNum() + 1);
			tableType.setAvilableNum(tableType.getAvilableNum() - 1);
			tableTypeService.updateNum(tableType);
			//������õ�������Ϊ0�������ø�����״̬����
			if(tableType.getAvilableNum() == 0){
				tableType.setStatus(0);
				tableTypeService.edit(tableType);
			}
		}
		ret.put("type", "success");
		ret.put("msg", "��ӳɹ�!");
		return ret;
	}
	
	/**
	 * Ԥ��������Ϣ�༭����
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(BookOrder bookOrder){
		Map<String, String> ret = new HashMap<String, String>();
		if(bookOrder == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ��Ԥ��������Ϣ!");
			return ret;
		}
		
		if(bookOrder.getTableTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "���Ͳ���Ϊ��!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getName())){
			ret.put("type", "error");
			ret.put("msg", "Ԥ��������ϵ�����Ʋ���Ϊ��!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getMobile())){
			ret.put("type", "error");
			ret.put("msg", "Ԥ��������ϵ���ֻ��Ų���Ϊ��!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getArriveDate())){
			ret.put("type", "error");
			ret.put("msg", "����ʱ�䲻��Ϊ��!");
			return ret;
		}
		BookOrder existBookOrder = bookOrderService.find(bookOrder.getId());
		if(existBookOrder == null){
			ret.put("type", "error");
			ret.put("msg", "��ѡ����ȷ�����ݽ��б༭!");
			return ret;
		}
		if(bookOrderService.edit(bookOrder) <= 0){
			ret.put("type", "error");
			ret.put("msg", "�༭ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		//�ж������Ƿ����仯
		if(existBookOrder.getTableTypeId().longValue() != bookOrder.getTableTypeId().longValue()){
			//���ͷ����˱仯
			//���Ȼָ�ԭ�����͵�Ԥ������������
			TableType oldTableType = tableTypeService.find(existBookOrder.getTableTypeId());
			oldTableType.setAvilableNum(oldTableType.getAvilableNum() + 1);
			oldTableType.setBookNum(oldTableType.getBookNum() - 1);
			tableTypeService.updateNum(oldTableType);
			if(oldTableType.getStatus() == 0){
				//�ɵ�����ԭ�������������ڲ������Ļ����ָ�״̬
				if(oldTableType.getAvilableNum() > 0){
					//���ó�״̬����
					oldTableType.setStatus(1);
					tableTypeService.edit(oldTableType);
				}
			}
			//�޸��µ����͵Ŀ�������Ԥ����
			TableType newTableType = tableTypeService.find(bookOrder.getTableTypeId());
			newTableType.setAvilableNum(newTableType.getAvilableNum() - 1);
			newTableType.setBookNum(newTableType.getBookNum() + 1);
			tableTypeService.updateNum(newTableType);
			if(newTableType.getAvilableNum() <= 0){
				//û�п�������
				newTableType.setStatus(0);//���ó�����
				tableTypeService.edit(newTableType);
			}
		}
		ret.put("type", "success");
		ret.put("msg", "�޸ĳɹ�!");
		return ret;
	}
	
	/**
	 * ��ҳ��ѯԤ��������Ϣ
	 * @param name
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> list(
			@RequestParam(name="name",defaultValue="") String name,
			@RequestParam(name="accountId",defaultValue="") Long accountId,
			@RequestParam(name="tableTypeId",defaultValue="") Long tableTypeId,
			@RequestParam(name="mobile",defaultValue="") String mobile,
			@RequestParam(name="status",required=false) Integer status,
			Page page
			){
		Map<String,Object> ret = new HashMap<String, Object>();
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		queryMap.put("status", status);
		queryMap.put("accountId", accountId);
		queryMap.put("tableTypeId", tableTypeId);
		queryMap.put("mobile", mobile);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", bookOrderService.findList(queryMap));
		ret.put("total", bookOrderService.getTotal(queryMap));
		return ret;
	}
	
	/**
	 * �޸Ĺ��ڶ���
	 * 
	 */
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> delete(Long id){
		Map<String, String> ret = new HashMap<String, String>();
		if(id == null){
			ret.put("type", "error");
			ret.put("msg", "��ѡ������!");
			return ret;
		}
		BookOrder bookOrder = bookOrderService.find(id);	
		if(bookOrder == null){
			ret.put("type", "error");
			ret.put("msg", "��ѡ����ȷ������!");
			return ret;
		}
		bookOrder.setStatus(3);		
		if(bookOrderService.edit(bookOrder) <= 0){
			ret.put("type", "error");
			ret.put("msg", "ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		//����޸Ĳ������Ϳ�������ʹ������״̬
		TableType tableType = tableTypeService.find(bookOrder.getTableTypeId());
		if(tableType != null){
			tableType.setAvilableNum(tableType.getAvilableNum() + 1);
			if(tableType.getAvilableNum() > tableType.getTableNum()){
				tableType.setAvilableNum(tableType.getTableNum());
			}			
			tableType.setBookNum(tableType.getBookNum() - 1);
			tableTypeService.updateNum(tableType);
			tableTypeService.edit(tableType);
		}		

		ret.put("type", "success");
		ret.put("msg", "�ɹ�!");
		
		return ret;
	}
}
