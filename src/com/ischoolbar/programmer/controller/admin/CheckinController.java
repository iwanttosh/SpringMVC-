package com.ischoolbar.programmer.controller.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import com.ischoolbar.programmer.service.BookOrderService;
import com.ischoolbar.programmer.service.TableTypeService;
import com.ischoolbar.programmer.service.admin.CheckinService;
import com.ischoolbar.programmer.service.admin.TableService;

/**
 * ���������̨������
 * @author Administrator
 *
 */
@RequestMapping("/admin/checkin")
@Controller
public class CheckinController {
	
	@Autowired
	private TableService tableService;
	@Autowired
	private TableTypeService tableTypeService;
	@Autowired
	private BookOrderService bookOrderService;
	@Autowired
	private CheckinService checkinService;
	
	/**
	 * ���������б�ҳ��
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.addObject("tableTypeList", tableTypeService.findAll());
		model.addObject("tableList", tableService.findAll());
		model.setViewName("checkin/list");
		return model;
	}
	
	/**
	 * ������Ϣ��Ӳ���
	 * @param checkin
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Checkin checkin,
			@RequestParam(name="bookOrderId",required=false) Long bookOrderId
			){
		Map<String, String> ret = new HashMap<String, String>();		
		if(checkin == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ����Ϣ!");
			return ret;
		}
		if(checkin.getTableId() == null){
			ret.put("type", "error");
			ret.put("msg", "��������Ϊ��!");
			return ret;
		}
		if(checkin.getTableTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "�������Ͳ���Ϊ��!");
			return ret;
		}
		if(StringUtils.isEmpty(checkin.getArriveDate())){
			ret.put("type", "error");
			ret.put("msg", "��ʼʱ�䲻��Ϊ��!");
			return ret;
		}

		checkin.setCreateTime(new Date());
		if(checkinService.add(checkin) <= 0){
			ret.put("type", "error");
			ret.put("msg", "���ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		//�����Ĳ�������
		TableType oldTableType = tableTypeService.find(checkin.getTableTypeId());
		BookOrder bookOrder = bookOrderService.find(bookOrderId);
		
		//�����Ԥ��������
		if (bookOrderId != null ) {
			//Ԥ�����Ĳ�������
			TableType newTableType = tableTypeService.find(bookOrder.getTableTypeId());
			//���Ԥ�����������ͺͶ����������Ͳ�һ��
			if (!oldTableType.getId().equals(newTableType.getId())) {
				//Ԥ������������ ������+1��Ԥ����-1���ö������ò����� - 1 ����ʹ���� + 1
				newTableType.setAvilableNum(newTableType.getAvilableNum() + 1);
				newTableType.setBookNum(newTableType.getBookNum() - 1);
				oldTableType.setAvilableNum(oldTableType.getAvilableNum() - 1);
				oldTableType.setSurNum(oldTableType.getSurNum() + 1);
				//�޸��µĲ�������
				tableTypeService.updateNum(newTableType);//�޸�����
				tableTypeService.updateNum(oldTableType);
				//����µĲ�������������Ϊ0���򽫲�����������Ϊ��������
				if(newTableType.getAvilableNum() == 0){
					newTableType.setStatus(0);
					tableTypeService.edit(newTableType);
				}
			}
			bookOrder.setStatus(1);
			bookOrder.setTableTypeId(oldTableType.getId());
			bookOrderService.edit(bookOrder);			
		}//�������Ԥ�������ġ� ֱ�ӿ�����-1 ʹ���� +1
		if (bookOrderId == null ){
			oldTableType.setAvilableNum(oldTableType.getAvilableNum() - 1);//������ - 1
			oldTableType.setSurNum(oldTableType.getSurNum() + 1 );//ʹ���� + 1

			tableTypeService.updateNum(oldTableType);//�޸�����
		} 		
		if(oldTableType.getAvilableNum() == 0){
			oldTableType.setStatus(0);
			tableTypeService.edit(oldTableType);
		}
		Table table = tableService.find(checkin.getTableId());
		if(table != null){
			//Ҫ�Ѳ���״̬����Ϊ��ʹ��
			table.setStatus(1);
			tableService.edit(table);
		}
		ret.put("type", "success");
		ret.put("msg", "��ӳɹ�!");
		return ret;
	}
	
	/**
	 * ������Ϣ�༭����
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Checkin checkin,
			@RequestParam(name="bookOrderId",required=false) Long bookOrderId
			){
		Map<String, String> ret = new HashMap<String, String>();
		if(checkin == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ����Ϣ!");
			return ret;
		}
		if(checkin.getTableId() == null){
			ret.put("type", "error");
			ret.put("msg", "��������Ϊ��!");
			return ret;
		}
		if(checkin.getTableTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "�������Ͳ���Ϊ��!");
			return ret;
		}


		if(StringUtils.isEmpty(checkin.getArriveDate())){
			ret.put("type", "error");
			ret.put("msg", "����ʱ�䲻��Ϊ��!");
			return ret;
		}

		Checkin existCheckin = checkinService.find(checkin.getId());
		if(existCheckin == null){
			ret.put("type", "error");
			ret.put("msg", "��ѡ����ȷ����Ϣ���б༭!");
			return ret;
		}
		if(checkinService.edit(checkin) <= 0){
			ret.put("type", "error");
			ret.put("msg", "�༭ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		//�༭�ɹ�֮��1���жϲ��������Ƿ����仯��2���жϲ����Ƿ����仯��3���ж��Ƿ��Ǵ�Ԥ������������Ϣ
		//�����ж��Ƿ��Ǵ�Ԥ��������Ϣ
		TableType oldTableType = tableTypeService.find(existCheckin.getTableTypeId());
		TableType newTableType = tableTypeService.find(checkin.getTableTypeId());
		
		//��������������Ԥ��������Ӱ��
		if(oldTableType.getId().longValue() != newTableType.getId().longValue()){
			//˵���������ͷ����˱仯��ԭ���Ĳ����������ָ����µĲ�������������
			oldTableType.setSurNum(oldTableType.getSurNum() - 1);
			newTableType.setSurNum(newTableType.getSurNum() + 1);
			if(bookOrderId == null){
				oldTableType.setAvilableNum(oldTableType.getAvilableNum() + 1);
				newTableType.setAvilableNum(newTableType.getAvilableNum() - 1);
			}
		}

		tableTypeService.updateNum(newTableType);
		tableTypeService.updateNum(oldTableType);
		//�жϲ����Ƿ����仯
		if(checkin.getTableId().longValue() != existCheckin.getTableId().longValue()){
			//��ʾ���������˱仯
			Table oldTable = tableService.find(existCheckin.getTableId());
			Table newTable = tableService.find(checkin.getTableId());
			oldTable.setStatus(0);//ԭ���Ĳ������Ϳ�Ԥ��
			newTable.setStatus(1);//���ڵĲ���������Ԥ��
			tableService.edit(newTable);
			tableService.edit(oldTable);
		}

		ret.put("type", "success");
		ret.put("msg", "�޸ĳɹ�!");
		return ret;
	}
	
	/**
	 * ��ҳ��ѯ��Ϣ
	 * @param name
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> list(
			@RequestParam(name="name",defaultValue="") String name,
			@RequestParam(name="tableId",defaultValue="") Long tableId,
			@RequestParam(name="tableTypeId",defaultValue="") Long tableTypeId,
			@RequestParam(name="mobile",defaultValue="") String mobile,
			@RequestParam(name="status",required=false) Integer status,
			Page page
			){
		Map<String,Object> ret = new HashMap<String, Object>();
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		queryMap.put("status", status);
		queryMap.put("tableId", tableId);
		queryMap.put("tableTypeId", tableTypeId);
		queryMap.put("mobile", mobile);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", checkinService.findList(queryMap));
		ret.put("total", checkinService.getTotal(queryMap));
		return ret;
	}
	
	/**
	 * ���ݲ������ͻ�ȡ����

	 * @return
	 */
	@RequestMapping(value="/load_table_list",method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> load_table_list(Long tableTypeId){
		List<Map<String, Object>> retList = new ArrayList<Map<String,Object>>();
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("tableTypeId", tableTypeId);
		queryMap.put("status", 0);
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 999);
		List<Table> tableList = tableService.findList(queryMap);
		for(Table table:tableList){
			Map<String, Object> option = new HashMap<String, Object>();
			option.put("value", table.getId());
			option.put("text", table.getSn());
			retList.add(option);
		}
		return retList;
	}
	
	/**
	 * �뿪����
	 * @param checkId
	 * @return
	 */
	@RequestMapping(value="/checkout",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> checkout(Long checkId
			){
		Map<String, String> ret = new HashMap<String, String>();
		if(checkId == null){
			ret.put("type", "error");
			ret.put("msg", "��ѡ������!");
			return ret;
		}
		Checkin checkin = checkinService.find(checkId);	
		if(checkin == null){
			ret.put("type", "error");
			ret.put("msg", "��ѡ����ȷ������!");
			return ret;
		}		
		checkin.setStatus(1);		
		checkin.setLeaveDate(new Date());
		if(checkinService.edit(checkin) <= 0){
			ret.put("type", "error");
			ret.put("msg", "ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		//���Ȳ�������״̬
		Table table = tableService.find(checkin.getTableId());
		if(table != null){
			table.setStatus(2);
			tableService.edit(table);
		}
		//����޸Ĳ������Ϳ�������ʹ������״̬
		TableType tableType = tableTypeService.find(checkin.getTableTypeId());
		if(tableType != null){
			tableType.setAvilableNum(tableType.getAvilableNum() + 1);
			if(tableType.getAvilableNum() > tableType.getTableNum()){
				tableType.setAvilableNum(tableType.getTableNum());
			}
			tableType.setSurNum(tableType.getSurNum() - 1);
			if(tableType.getStatus() == 0){
				tableType.setStatus(1);
			}
			tableTypeService.updateNum(tableType);
			tableTypeService.edit(tableType);
		}
		//�ж��Ƿ�����Ԥ��
		if(checkin.getBookOrderId() != null){
			BookOrder bookOrder = bookOrderService.find(checkin.getBookOrderId());
			bookOrder.setStatus(2);
			bookOrderService.edit(bookOrder);
			
		}
		checkinService.edit(checkin);
		ret.put("type", "success");
		ret.put("msg", "�ɹ�!");
		
		return ret;
	}

}
