package com.ischoolbar.programmer.controller.admin;

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

import com.ischoolbar.programmer.page.admin.Page;
import com.ischoolbar.programmer.entity.TableType;
import com.ischoolbar.programmer.service.TableTypeService;





import com.ischoolbar.programmer.service.admin.FloorSercvice;

@Controller
@RequestMapping("/admin/table_type")
public class TableTypeController {
	
	@Autowired
	private TableTypeService tableTypeService;
	
	
	/**
	 * �������͹����б�ҳ��
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.setViewName("table_type/list");
		return model;
	}
	
	/**
	 * ����������Ϣ��Ӳ���
	 * @param tableType
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(TableType tableType){
		Map<String, String> ret = new HashMap<String, String>();
		if(tableType == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ�Ĳ���������Ϣ!");
			return ret;
		}
		if(StringUtils.isEmpty(tableType.getType())){
			ret.put("type", "error");
			ret.put("msg", "�����������Ʋ���Ϊ��!");
			return ret;
		}
		tableType.setAvilableNum(tableType.getTableNum());//Ĭ�ϲ��������ڿ��ò���
		tableType.setBookNum(0);//����Ԥ����0
		tableType.setUseNum(0);;//�������ò���0
		if(tableTypeService.add(tableType) <= 0){
			ret.put("type", "error");
			ret.put("msg", "���ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "��ӳɹ�!");
		return ret;
	}
	
	/**
	 * ����������Ϣ�༭����
	 * @param tableType
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(TableType tableType){
		Map<String, String> ret = new HashMap<String, String>();
		if(tableType == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ�Ĳ���������Ϣ!");
			return ret;
		}
		if(StringUtils.isEmpty(tableType.getType())){
			ret.put("type", "error");
			ret.put("msg", "�����������Ʋ���Ϊ��!");
			return ret;
		}
		TableType existTableType = tableTypeService.find(tableType.getId());
		if(existTableType == null){
			ret.put("type", "error");
			ret.put("msg", "δ�ҵ�������!");
			return ret;
		}
		int offset = tableType.getTableNum()-existTableType.getTableNum();
		tableType.setAvilableNum(existTableType.getAvilableNum() + offset);
		if(tableType.getAvilableNum() <= 0){
			tableType.setAvilableNum(0);//û�п��÷���
			tableType.setStatus(0);//��������
			if(tableType.getAvilableNum() + existTableType.getSurNum() + existTableType.getBookNum() > tableType.getTableNum()){
				ret.put("type", "error");
				ret.put("msg", "���������ò�����!");
				return ret;
			}
		}
		if(tableTypeService.edit(tableType) <= 0){
			ret.put("type", "error");
			ret.put("msg", "�޸�ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "�޸ĳɹ�!");
		return ret;
	}
	
	/**
	 * ��ҳ��ѯ����������Ϣ
	 * @param name
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> list(
			@RequestParam(name="name",defaultValue="") String name,
			@RequestParam(name="status",required=false) Integer status,
			Page page
			){
		Map<String,Object> ret = new HashMap<String, Object>();
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		queryMap.put("status", status);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", tableTypeService.findList(queryMap));
		ret.put("total", tableTypeService.getTotal(queryMap));
		return ret;
	}
	
	/**
	 * ����������Ϣɾ������
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
		try {
			if(tableTypeService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "ɾ��ʧ�ܣ�����ϵ����Ա!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "�ò��������´��ڲ�����Ϣ������ɾ���ò��������µ����в�����Ϣ!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "ɾ���ɹ�!");
		return ret;
	}
}
