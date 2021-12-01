package com.ischoolbar.programmer.controller.admin;

import java.util.HashMap;
import java.util.Map;

import com.ischoolbar.programmer.entity.TableType;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.admin.Table;
import com.ischoolbar.programmer.page.admin.Page;
import com.ischoolbar.programmer.service.TableTypeService;
import com.ischoolbar.programmer.service.admin.FloorSercvice;
import com.ischoolbar.programmer.service.admin.TableService;

/**
 * ���������̨������
 * @author Administrator
 *
 */
@RequestMapping("/admin/table")
@Controller
public class TableController {

	@Autowired
	private TableTypeService tableTypeService;

	@Autowired
	private TableService tableService;

	@Autowired
	private FloorSercvice floorService;


	/**
	 * ���������б�ҳ��
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.addObject("tableTypeList", tableTypeService.findAll());
		model.addObject("floorList", floorService.findAll());
		model.setViewName("table/list");
		return model;
	}

	/**
	 * ������Ϣ��Ӳ���

	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Table table){
		Map<String, String> ret = new HashMap<String, String>();
		if(table == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ�Ĳ�����Ϣ!");
			return ret;
		}
		if(StringUtils.isEmpty(table.getSn())){
			ret.put("type", "error");
			ret.put("msg", "������Ų���Ϊ��!");
			return ret;
		}
		if(table.getTableTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "��ѡ���������!");
			return ret;
		}
		TableType tableType = tableTypeService.find(table.getTableTypeId());
		//�����һ�����͵Ĳ���ʱ�����ò������������в�������+1
		tableType.setTableNum(tableType.getTableNum()+1);
		tableType.setAvilableNum(tableType.getAvilableNum()+1);
		tableTypeService.edit(tableType);
		if(table.getFloorId() == null){
			ret.put("type", "error");
			ret.put("msg", "��ѡ���������¥��!");
			return ret;
		}
		if(isExist(table.getSn(), 0l)){
			ret.put("type", "error");
			ret.put("msg", "�ò�������Ѿ�����!");
			return ret;
		}
		if(tableService.add(table) <= 0){
			ret.put("type", "error");
			ret.put("msg", "���ʧ�ܣ�����ϵ����Ա!");
			return ret;
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
	public Map<String, String> edit(Table table){
		Map<String, String> ret = new HashMap<String, String>();
		if(table == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ�Ĳ�����Ϣ!");
			return ret;
		}
		if(StringUtils.isEmpty(table.getSn())){
			ret.put("type", "error");
			ret.put("msg", "������Ų���Ϊ��!");
			return ret;
		}
		if(table.getTableTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "��ѡ���������!");
			return ret;
		}
		if(table.getFloorId() == null){
			ret.put("type", "error");
			ret.put("msg", "��ѡ���������¥��!");
			return ret;
		}
		if(isExist(table.getSn(), table.getId())){
			ret.put("type", "error");
			ret.put("msg", "�ò�������Ѿ�����!");
			return ret;
		}
		if(tableService.edit(table) <= 0){
			ret.put("type", "error");
			ret.put("msg", "�޸�ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}

		ret.put("type", "success");
		ret.put("msg", "�޸ĳɹ�!");
		return ret;
	}

	/**
	 * ��ҳ��ѯ������Ϣ
	 * @param sn
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> list(
			@RequestParam(name="sn",defaultValue="") String sn,
			@RequestParam(name="status",required=false) Integer status,
			@RequestParam(name="tableTypeId",required=false) Long tableTypeId,
			@RequestParam(name="floorId",required=false) Long floorId,
			Page page
	){
		Map<String,Object> ret = new HashMap<String, Object>();
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("sn", sn);
		queryMap.put("status", status);
		queryMap.put("tableTypeId", tableTypeId);
		queryMap.put("floorId", floorId);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", tableService.findList(queryMap));
		ret.put("total", tableService.getTotal(queryMap));
		return ret;
	}

	/**
	 * ������Ϣɾ������
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> delete(Long id){
		Map<String, String> ret = new HashMap<String, String>();
		if(id == null){
			ret.put("type", "error");
			ret.put("msg", "��ѡ��Ҫɾ������Ϣ!");
			return ret;
		}
		Table table = tableService.find(id);
		TableType tableType = tableTypeService.find(table.getTableTypeId());
		//��ɾ��һ�����͵Ĳ���ʱ�����ò������������в�������-1
		tableType.setTableNum(tableType.getTableNum()-1);
		tableType.setAvilableNum(tableType.getAvilableNum()-1);
		tableTypeService.edit(tableType);
		try {
			if(tableService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "ɾ��ʧ�ܣ�����ϵ����Ա!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "�ò����´��ڶ�����Ϣ������ɾ���ò����µ����ж�����Ϣ!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "ɾ���ɹ�!");
		return ret;
	}

	/**
	 * �жϲ�������Ƿ����
	 * @param sn
	 * @param id
	 * @return
	 */
	private boolean isExist(String sn,Long id){
		Table findBySn = tableService.findBySn(sn);
		if(findBySn == null)return false;
		if(findBySn.getId().longValue() == id.longValue())return false;
		return true;
	}
}
