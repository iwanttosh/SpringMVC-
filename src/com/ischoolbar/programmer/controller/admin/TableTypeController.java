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
	 * 餐桌类型管理列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.setViewName("table_type/list");
		return model;
	}
	
	/**
	 * 餐桌类型信息添加操作
	 * @param tableType
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(TableType tableType){
		Map<String, String> ret = new HashMap<String, String>();
		if(tableType == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的餐桌类型信息!");
			return ret;
		}
		if(StringUtils.isEmpty(tableType.getType())){
			ret.put("type", "error");
			ret.put("msg", "餐桌类型名称不能为空!");
			return ret;
		}
		tableType.setAvilableNum(tableType.getTableNum());//默认餐桌数等于可用餐桌
		tableType.setBookNum(0);//设置预定数0
		tableType.setUseNum(0);;//设置已用餐数0
		if(tableTypeService.add(tableType) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "添加成功!");
		return ret;
	}
	
	/**
	 * 餐桌类型信息编辑操作
	 * @param tableType
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(TableType tableType){
		Map<String, String> ret = new HashMap<String, String>();
		if(tableType == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的餐桌类型信息!");
			return ret;
		}
		if(StringUtils.isEmpty(tableType.getType())){
			ret.put("type", "error");
			ret.put("msg", "餐桌类型名称不能为空!");
			return ret;
		}
		TableType existTableType = tableTypeService.find(tableType.getId());
		if(existTableType == null){
			ret.put("type", "error");
			ret.put("msg", "未找到该数据!");
			return ret;
		}
		int offset = tableType.getTableNum()-existTableType.getTableNum();
		tableType.setAvilableNum(existTableType.getAvilableNum() + offset);
		if(tableType.getAvilableNum() <= 0){
			tableType.setAvilableNum(0);//没有可用房间
			tableType.setStatus(0);//房型已满
			if(tableType.getAvilableNum() + existTableType.getSurNum() + existTableType.getBookNum() > tableType.getTableNum()){
				ret.put("type", "error");
				ret.put("msg", "房间数设置不合理!");
				return ret;
			}
		}
		if(tableTypeService.edit(tableType) <= 0){
			ret.put("type", "error");
			ret.put("msg", "修改失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "修改成功!");
		return ret;
	}
	
	/**
	 * 分页查询餐桌类型信息
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
	 * 餐桌类型信息删除操作
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> delete(Long id){
		Map<String, String> ret = new HashMap<String, String>();
		if(id == null){
			ret.put("type", "error");
			ret.put("msg", "请选择要删除的信息!");
			return ret;
		}
		try {
			if(tableTypeService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "删除失败，请联系管理员!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "该餐桌类型下存在餐桌信息，请先删除该餐桌类型下的所有餐桌信息!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "删除成功!");
		return ret;
	}
}
