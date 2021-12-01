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
 * 预定订单管理后台控制器
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
	 * 预定订单管理列表页面
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
	 * 预定订单信息添加操作
	 * @param bookOrder
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(BookOrder bookOrder){
		Map<String, String> ret = new HashMap<String, String>();
		if(bookOrder == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的预定订单信息!");
			return ret;
		}
	
		if(bookOrder.getTableTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "桌型不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getName())){
			ret.put("type", "error");
			ret.put("msg", "预定订单联系人名称不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getMobile())){
			ret.put("type", "error");
			ret.put("msg", "预定订单联系人手机号不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getArriveDate())){
			ret.put("type", "error");
			ret.put("msg", "到达时间不能为空!");
			return ret;
		}

		bookOrder.setCreateTime(new Date());
		bookOrder.setStatus(0);
		if(bookOrderService.add(bookOrder) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败，请联系管理员!");
			return ret;
		}
		TableType tableType = tableTypeService.find(bookOrder.getTableTypeId());
		//预定成功后去修改该桌型的预定数
		if(tableType != null){
			tableType.setBookNum(tableType.getBookNum() + 1);
			tableType.setAvilableNum(tableType.getAvilableNum() - 1);
			tableTypeService.updateNum(tableType);
			//如果可用的桌间数为0，则设置该桌型状态已满
			if(tableType.getAvilableNum() == 0){
				tableType.setStatus(0);
				tableTypeService.edit(tableType);
			}
		}
		ret.put("type", "success");
		ret.put("msg", "添加成功!");
		return ret;
	}
	
	/**
	 * 预定订单信息编辑操作
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(BookOrder bookOrder){
		Map<String, String> ret = new HashMap<String, String>();
		if(bookOrder == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的预定订单信息!");
			return ret;
		}
		
		if(bookOrder.getTableTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "桌型不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getName())){
			ret.put("type", "error");
			ret.put("msg", "预定订单联系人名称不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getMobile())){
			ret.put("type", "error");
			ret.put("msg", "预定订单联系人手机号不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getArriveDate())){
			ret.put("type", "error");
			ret.put("msg", "到达时间不能为空!");
			return ret;
		}
		BookOrder existBookOrder = bookOrderService.find(bookOrder.getId());
		if(existBookOrder == null){
			ret.put("type", "error");
			ret.put("msg", "请选择正确的数据进行编辑!");
			return ret;
		}
		if(bookOrderService.edit(bookOrder) <= 0){
			ret.put("type", "error");
			ret.put("msg", "编辑失败，请联系管理员!");
			return ret;
		}
		//判断桌型是否发生变化
		if(existBookOrder.getTableTypeId().longValue() != bookOrder.getTableTypeId().longValue()){
			//桌型发生了变化
			//首先恢复原来桌型的预定数及可用数
			TableType oldTableType = tableTypeService.find(existBookOrder.getTableTypeId());
			oldTableType.setAvilableNum(oldTableType.getAvilableNum() + 1);
			oldTableType.setBookNum(oldTableType.getBookNum() - 1);
			tableTypeService.updateNum(oldTableType);
			if(oldTableType.getStatus() == 0){
				//旧的桌间原来是满桌，现在不满桌的话，恢复状态
				if(oldTableType.getAvilableNum() > 0){
					//设置成状态可用
					oldTableType.setStatus(1);
					tableTypeService.edit(oldTableType);
				}
			}
			//修改新的桌型的可用数和预定数
			TableType newTableType = tableTypeService.find(bookOrder.getTableTypeId());
			newTableType.setAvilableNum(newTableType.getAvilableNum() - 1);
			newTableType.setBookNum(newTableType.getBookNum() + 1);
			tableTypeService.updateNum(newTableType);
			if(newTableType.getAvilableNum() <= 0){
				//没有可用桌数
				newTableType.setStatus(0);//设置成满桌
				tableTypeService.edit(newTableType);
			}
		}
		ret.put("type", "success");
		ret.put("msg", "修改成功!");
		return ret;
	}
	
	/**
	 * 分页查询预定订单信息
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
	 * 修改过期订单
	 * 
	 */
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> delete(Long id){
		Map<String, String> ret = new HashMap<String, String>();
		if(id == null){
			ret.put("type", "error");
			ret.put("msg", "请选择数据!");
			return ret;
		}
		BookOrder bookOrder = bookOrderService.find(id);	
		if(bookOrder == null){
			ret.put("type", "error");
			ret.put("msg", "请选择正确的数据!");
			return ret;
		}
		bookOrder.setStatus(3);		
		if(bookOrderService.edit(bookOrder) <= 0){
			ret.put("type", "error");
			ret.put("msg", "失败，请联系管理员!");
			return ret;
		}
		//其次修改餐桌类型可用数、使用数、状态
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
		ret.put("msg", "成功!");
		
		return ret;
	}
}
