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

import com.ischoolbar.programmer.entity.admin.Floor;
import com.ischoolbar.programmer.page.admin.Page;
import com.ischoolbar.programmer.service.admin.FloorSercvice;

/**
 * 区域管理后台控制器
 * @author Administrator
 *
 */
@RequestMapping("/admin/floor")
@Controller
public class FloorController {
	
	@Autowired
	private FloorSercvice floorService;

	
	/**
	 * 区域管理列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.setViewName("floor/list");
		return model;
	}
	
	/**
	 * 区域信息添加操作
	 * @param floor
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Floor floor){
		Map<String, String> ret = new HashMap<String, String>();
		if(floor == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的区域信息!");
			return ret;
		}
		if(StringUtils.isEmpty(floor.getName())){
			ret.put("type", "error");
			ret.put("msg", "区域名称不能为空!");
			return ret;
		}
		if(floorService.add(floor) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "添加成功!");
		return ret;
	}
	
	/**
	 * 区域信息编辑操作
	 * @param floor
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Floor floor){
		Map<String, String> ret = new HashMap<String, String>();
		if(floor == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的区域信息!");
			return ret;
		}
		if(StringUtils.isEmpty(floor.getName())){
			ret.put("type", "error");
			ret.put("msg", "区域名称不能为空!");
			return ret;
		}
		if(floorService.edit(floor) <= 0){
			ret.put("type", "error");
			ret.put("msg", "修改失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "修改成功!");
		return ret;
	}
	
	/**
	 * 分页查询区域信息
	 * @param name
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> list(
			@RequestParam(name="name",defaultValue="") String name,
			Page page
			){
		Map<String,Object> ret = new HashMap<String, Object>();
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", floorService.findList(queryMap));
		ret.put("total", floorService.getTotal(queryMap));
		return ret;
	}
	
	/**
	 * 区域信息删除操作
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
			if(floorService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "删除失败，请联系管理员!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "该区域下存在房间信息，请先删除该区域下的所有房间信息!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "删除成功!");
		return ret;
	}
}
