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
 * 餐桌管理后台控制器
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
	 * 餐桌管理列表页面
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
	 * 餐桌信息添加操作

	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Table table){
		Map<String, String> ret = new HashMap<String, String>();
		if(table == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的餐桌信息!");
			return ret;
		}
		if(StringUtils.isEmpty(table.getSn())){
			ret.put("type", "error");
			ret.put("msg", "餐桌编号不能为空!");
			return ret;
		}
		if(table.getTableTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "请选择餐桌类型!");
			return ret;
		}
		TableType tableType = tableTypeService.find(table.getTableTypeId());
		//当添加一个类型的餐桌时，可用餐桌数，和所有餐桌数都+1
		tableType.setTableNum(tableType.getTableNum()+1);
		tableType.setAvilableNum(tableType.getAvilableNum()+1);
		tableTypeService.edit(tableType);
		if(table.getFloorId() == null){
			ret.put("type", "error");
			ret.put("msg", "请选择餐桌所属楼层!");
			return ret;
		}
		if(isExist(table.getSn(), 0l)){
			ret.put("type", "error");
			ret.put("msg", "该餐桌编号已经存在!");
			return ret;
		}
		if(tableService.add(table) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败，请联系管理员!");
			return ret;
		}

		ret.put("type", "success");
		ret.put("msg", "添加成功!");
		return ret;
	}

	/**
	 * 餐桌信息编辑操作

	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Table table){
		Map<String, String> ret = new HashMap<String, String>();
		if(table == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的餐桌信息!");
			return ret;
		}
		if(StringUtils.isEmpty(table.getSn())){
			ret.put("type", "error");
			ret.put("msg", "餐桌编号不能为空!");
			return ret;
		}
		if(table.getTableTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "请选择餐桌类型!");
			return ret;
		}
		if(table.getFloorId() == null){
			ret.put("type", "error");
			ret.put("msg", "请选择餐桌所属楼层!");
			return ret;
		}
		if(isExist(table.getSn(), table.getId())){
			ret.put("type", "error");
			ret.put("msg", "该餐桌编号已经存在!");
			return ret;
		}
		if(tableService.edit(table) <= 0){
			ret.put("type", "error");
			ret.put("msg", "修改失败，请联系管理员!");
			return ret;
		}

		ret.put("type", "success");
		ret.put("msg", "修改成功!");
		return ret;
	}

	/**
	 * 分页查询餐桌信息
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
	 * 餐桌信息删除操作
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
		Table table = tableService.find(id);
		TableType tableType = tableTypeService.find(table.getTableTypeId());
		//当删除一个类型的餐桌时，可用餐桌数，和所有餐桌数都-1
		tableType.setTableNum(tableType.getTableNum()-1);
		tableType.setAvilableNum(tableType.getAvilableNum()-1);
		tableTypeService.edit(tableType);
		try {
			if(tableService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "删除失败，请联系管理员!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "该餐桌下存在订单信息，请先删除该餐桌下的所有订单信息!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "删除成功!");
		return ret;
	}

	/**
	 * 判断餐桌编号是否存在
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
