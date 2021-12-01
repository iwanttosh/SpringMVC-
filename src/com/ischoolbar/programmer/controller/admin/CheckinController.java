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
 * 订单管理后台控制器
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
	 * 订单管理列表页面
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
	 * 订单信息添加操作
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
			ret.put("msg", "请填写正确的信息!");
			return ret;
		}
		if(checkin.getTableId() == null){
			ret.put("type", "error");
			ret.put("msg", "餐桌不能为空!");
			return ret;
		}
		if(checkin.getTableTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "餐桌类型不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(checkin.getArriveDate())){
			ret.put("type", "error");
			ret.put("msg", "开始时间不能为空!");
			return ret;
		}

		checkin.setCreateTime(new Date());
		if(checkinService.add(checkin) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败，请联系管理员!");
			return ret;
		}
		//订单的餐桌类型
		TableType oldTableType = tableTypeService.find(checkin.getTableTypeId());
		BookOrder bookOrder = bookOrderService.find(bookOrderId);
		
		//如果是预定单来的
		if (bookOrderId != null ) {
			//预订单的餐桌类型
			TableType newTableType = tableTypeService.find(bookOrder.getTableTypeId());
			//如果预订单餐桌类型和订单餐桌类型不一样
			if (!oldTableType.getId().equals(newTableType.getId())) {
				//预订单餐桌类型 可用数+1；预定数-1；该订单可用餐桌数 - 1 正在使用数 + 1
				newTableType.setAvilableNum(newTableType.getAvilableNum() + 1);
				newTableType.setBookNum(newTableType.getBookNum() - 1);
				oldTableType.setAvilableNum(oldTableType.getAvilableNum() - 1);
				oldTableType.setSurNum(oldTableType.getSurNum() + 1);
				//修改新的餐桌数量
				tableTypeService.updateNum(newTableType);//修改数量
				tableTypeService.updateNum(oldTableType);
				//如果新的餐桌可用数量变为0，则将餐桌数量设置为餐桌已满
				if(newTableType.getAvilableNum() == 0){
					newTableType.setStatus(0);
					tableTypeService.edit(newTableType);
				}
			}
			bookOrder.setStatus(1);
			bookOrder.setTableTypeId(oldTableType.getId());
			bookOrderService.edit(bookOrder);			
		}//如果不是预订单来的。 直接可用数-1 使用数 +1
		if (bookOrderId == null ){
			oldTableType.setAvilableNum(oldTableType.getAvilableNum() - 1);//可用数 - 1
			oldTableType.setSurNum(oldTableType.getSurNum() + 1 );//使用数 + 1

			tableTypeService.updateNum(oldTableType);//修改数量
		} 		
		if(oldTableType.getAvilableNum() == 0){
			oldTableType.setStatus(0);
			tableTypeService.edit(oldTableType);
		}
		Table table = tableService.find(checkin.getTableId());
		if(table != null){
			//要把餐桌状态设置为已使用
			table.setStatus(1);
			tableService.edit(table);
		}
		ret.put("type", "success");
		ret.put("msg", "添加成功!");
		return ret;
	}
	
	/**
	 * 订单信息编辑操作
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Checkin checkin,
			@RequestParam(name="bookOrderId",required=false) Long bookOrderId
			){
		Map<String, String> ret = new HashMap<String, String>();
		if(checkin == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的信息!");
			return ret;
		}
		if(checkin.getTableId() == null){
			ret.put("type", "error");
			ret.put("msg", "餐桌不能为空!");
			return ret;
		}
		if(checkin.getTableTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "餐桌类型不能为空!");
			return ret;
		}


		if(StringUtils.isEmpty(checkin.getArriveDate())){
			ret.put("type", "error");
			ret.put("msg", "到达时间不能为空!");
			return ret;
		}

		Checkin existCheckin = checkinService.find(checkin.getId());
		if(existCheckin == null){
			ret.put("type", "error");
			ret.put("msg", "请选择正确的信息进行编辑!");
			return ret;
		}
		if(checkinService.edit(checkin) <= 0){
			ret.put("type", "error");
			ret.put("msg", "编辑失败，请联系管理员!");
			return ret;
		}
		//编辑成功之后：1：判断餐桌类型是否发生变化，2：判断餐桌是否发生变化，3：判断是否是从预定订单来的信息
		//首先判断是否是从预定来的信息
		TableType oldTableType = tableTypeService.find(existCheckin.getTableTypeId());
		TableType newTableType = tableTypeService.find(checkin.getTableTypeId());
		
		//餐桌类型数不收预定订单的影响
		if(oldTableType.getId().longValue() != newTableType.getId().longValue()){
			//说明餐桌类型发生了变化，原来的餐桌类型数恢复，新的餐桌类型数增加
			oldTableType.setSurNum(oldTableType.getSurNum() - 1);
			newTableType.setSurNum(newTableType.getSurNum() + 1);
			if(bookOrderId == null){
				oldTableType.setAvilableNum(oldTableType.getAvilableNum() + 1);
				newTableType.setAvilableNum(newTableType.getAvilableNum() - 1);
			}
		}

		tableTypeService.updateNum(newTableType);
		tableTypeService.updateNum(oldTableType);
		//判断餐桌是否发生变化
		if(checkin.getTableId().longValue() != existCheckin.getTableId().longValue()){
			//表示餐桌发生了变化
			Table oldTable = tableService.find(existCheckin.getTableId());
			Table newTable = tableService.find(checkin.getTableId());
			oldTable.setStatus(0);//原来的餐桌类型可预定
			newTable.setStatus(1);//现在的餐桌类型已预定
			tableService.edit(newTable);
			tableService.edit(oldTable);
		}

		ret.put("type", "success");
		ret.put("msg", "修改成功!");
		return ret;
	}
	
	/**
	 * 分页查询信息
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
	 * 根据餐桌类型获取房间

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
	 * 离开操作
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
			ret.put("msg", "请选择数据!");
			return ret;
		}
		Checkin checkin = checkinService.find(checkId);	
		if(checkin == null){
			ret.put("type", "error");
			ret.put("msg", "请选择正确的数据!");
			return ret;
		}		
		checkin.setStatus(1);		
		checkin.setLeaveDate(new Date());
		if(checkinService.edit(checkin) <= 0){
			ret.put("type", "error");
			ret.put("msg", "失败，请联系管理员!");
			return ret;
		}
		//首先操作餐桌状态
		Table table = tableService.find(checkin.getTableId());
		if(table != null){
			table.setStatus(2);
			tableService.edit(table);
		}
		//其次修改餐桌类型可用数、使用数、状态
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
		//判断是否来自预定
		if(checkin.getBookOrderId() != null){
			BookOrder bookOrder = bookOrderService.find(checkin.getBookOrderId());
			bookOrder.setStatus(2);
			bookOrderService.edit(bookOrder);
			
		}
		checkinService.edit(checkin);
		ret.put("type", "success");
		ret.put("msg", "成功!");
		
		return ret;
	}

}
