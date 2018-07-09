package com.city.car.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.city.car.model.CarinfoModel;
import com.city.car.model.DriverInfoModel;
import com.city.car.model.IllegalModel;
import com.city.car.service.CarinfoService;
import com.city.car.service.DriverInfoService;
import com.city.car.service.IllegalService;
import com.city.car.utils.AJAXResult;
import com.city.car.utils.Datas;
import com.city.car.utils.Page;

@Controller
@RequestMapping("illegal")
public class IllegalController {

	@Autowired
	IllegalService illegalService;
	@Autowired
	DriverInfoService driverInfoService;
	@Autowired
	CarinfoService carinfoService;
	
	@ResponseBody
	@RequestMapping("/pageQueryIllegal")
	public Object roleQuery(Integer pageno,Integer pagesize) {
		AJAXResult result = new AJAXResult(); 
		
		try {
			int start = (pageno - 1) * pagesize;
	    	Map<String, Object> paramMap = new HashMap<String, Object>();
	    	paramMap.put("start", start);
	    	paramMap.put("size", pagesize);
	    	
	    	List<IllegalModel> maintainList = illegalService.pageList(paramMap);
	    	//查询总条数
	    	int totalsize = illegalService.countPage(paramMap);
	    	
	    	Page<IllegalModel> maintainPage = new Page<IllegalModel>();
	    	maintainPage.setPageno(pageno);
	    	
	    	maintainPage.setPagesize(pagesize);
	    	System.out.println( "pagesize = "+pagesize);
	    	
	    	maintainPage.setDatas(maintainList);
	    	maintainPage.setTotalsize(totalsize);
	    	System.out.println("totalsize = "+totalsize);
	    	
	    	result.setData(maintainPage);
			result.setSuccess(true);
		}catch(Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}
	
	@RequestMapping("illegalList")
	public String illegalList(ModelMap map){
		List<IllegalModel> illegallist = illegalService.select();
		map.put("illegallist", illegallist);
		return "illegal/illegalList";
	}
	
	@RequestMapping("addList")
	public String addList(ModelMap map){
		List<CarinfoModel> carinfoList = carinfoService.selectAll();
		List<DriverInfoModel> listDriver = driverInfoService.selectAll();
		map.put("carinfoList", carinfoList);
		map.put("listDriver", listDriver);
		return "illegal/add";
	}
	
	@ResponseBody
	@RequestMapping("insert")
	public Object insert(IllegalModel e) {
		AJAXResult result = new AJAXResult();
		try {
			illegalService.insert(e);
			result.setSuccess(true);
		//	System.out.println(result);
		}catch(Exception ex) {
			ex.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("illegal_list")
	public Object goto_carinfo_list() {
		
		List<IllegalModel> list = new ArrayList<IllegalModel>();
		list = illegalService.selectAll();
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/pageList")
	public Object pageList(int page,int rows) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("start", (page - 1) * rows);
		paramMap.put("size", rows);
		
		List<IllegalModel> list = illegalService.pageList(paramMap);
		int count = illegalService.count();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", count);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public String deleteIllegal(IllegalModel e) {
		
		int i = illegalService.delete(e);
		return i==1?"1":"0";
	}
	
	@ResponseBody
	@RequestMapping("deleteBatch")
	public Object deleteBatch(Datas datas) {
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("datas", datas.getIds());
		illegalService.deleteBatch(paramMap);
		return "1";
	}
	
	@ResponseBody
	@RequestMapping("	addOrUpdate")
	public Object addOrUpdate(IllegalModel e) {
		if(e.getEid()==null){
			illegalService.insert(e);
			return "1";
		}else{
			IllegalModel info = illegalService.selectByPrimaryKey(e.getEid());
			info.setEaddr(e.getEaddr());
			info.setCno(e.getCno());
			info.setDname(e.getDname());
			info.setEmoney(e.getEmoney());
			info.setEreason(e.getEreason());
			info.setEtime(e.getEtime());
			info.setDname(e.getDname());
			int i = illegalService.updateByPrimaryKey(info);
			return i>0?"1":"0";
		}
	} 
	
	@ResponseBody
	@RequestMapping("update")
	public Object update(IllegalModel e) {
		
		IllegalModel info = illegalService.selectByPrimaryKey(e.getEid());
		info.setEaddr(e.getEaddr());
		info.setCno(e.getCno());
		info.setDname(e.getDname());
		info.setEmoney(e.getEmoney());
		info.setEreason(e.getEreason());
		info.setEtime(e.getEtime());
		int i = illegalService.updateByPrimaryKey(info);
		return i>0?"1":"0";
	} 
}
