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
import com.city.car.model.MaintainModel;
import com.city.car.model.UseCarModel;
import com.city.car.service.CarinfoService;
import com.city.car.service.DriverInfoService;
import com.city.car.service.UseCarService;
import com.city.car.utils.AJAXResult;
import com.city.car.utils.Datas;
import com.city.car.utils.Page;


@Controller
@RequestMapping("useCar")
public class useCarController {

	@Autowired
	UseCarService useCarService;
	@Autowired
	DriverInfoService driverInfoService;
	@Autowired
	CarinfoService carinfoService;
	
	@ResponseBody
	@RequestMapping("driverByCarinfoId")
	public Object driverByCarinfoId(String cno) {
		
		List<DriverInfoModel> list = carinfoService.driverByCarinfoId(cno);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("selectByCarinfo")
	public Object selectByCarinfo(Integer cno) {
		AJAXResult result = new AJAXResult();
		try {
			carinfoService.selectByCarinfo(cno);
			result.setSuccess(true);
		//	System.out.println(result);
		}catch(Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/pageQueryUseCar")
	public Object roleQuery(Integer pageno,Integer pagesize) {
		AJAXResult result = new AJAXResult(); 
		
		try {
			int start = (pageno - 1) * pagesize;
	    	Map<String, Object> paramMap = new HashMap<String, Object>();
	    	paramMap.put("start", start);
	    	paramMap.put("size", pagesize);
	    	
	    	List<UseCarModel> useCarList = useCarService.pageList(paramMap);
	    	//查询总条数
	    	int totalsize = useCarService.countPage(paramMap);
	    	
	    	Page<UseCarModel> usecaePage = new Page<UseCarModel>();
	    	usecaePage.setPageno(pageno);
	    	
	    	usecaePage.setPagesize(pagesize);
	    	System.out.println( "pagesize = "+pagesize);
	    	
	    	usecaePage.setDatas(useCarList);
	    	usecaePage.setTotalsize(totalsize);
	    	System.out.println("totalsize = "+totalsize);
	    	
	    	result.setData(usecaePage);
			result.setSuccess(true);
		}catch(Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}
	
	@RequestMapping("useList")
	public String useList(ModelMap map){
		List<UseCarModel> useList = useCarService.select();
		map.put("useList", useList);
		return "useCar/useList";
	}
	
	@RequestMapping("addList")
	public String addList(ModelMap map){
		List<CarinfoModel> carinfoList = carinfoService.selectAll();
		List<DriverInfoModel> listDriver = driverInfoService.selectAll();
		map.put("carinfoList", carinfoList);
		map.put("listDriver", listDriver);
		return "useCar/add";
	}
	
	@ResponseBody
	@RequestMapping("insert")
	public Object insert(UseCarModel u) {
		 useCarService.insert(u);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("goto_usecar_list")
	public Object goto_usecar_list() {
		
		List<UseCarModel> list = new ArrayList<UseCarModel>();
		list = useCarService.selectAll();
		return list;
	}
	
	@ResponseBody
	@RequestMapping("pass")
	public Object pass(Datas d) {
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("d", d.getS());
		useCarService.passStatus(paramMap);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("stop")
	public Object stop(Datas d) {
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("d", d.getS());
		useCarService.stopStatus(paramMap);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("/pageList")
	public Object pageList(int page,int rows,Integer status) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("start", (page - 1) * rows);
		paramMap.put("size", rows);
		paramMap.put("status", status);
		
		List<UseCarModel> list = useCarService.pageList(paramMap);
		int count = useCarService.count();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", count);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("addOrUpdate")
	public Object addOrUpdate(UseCarModel u) {
		System.out.println(u.getDname());
		if(u.getUid()==null){
			useCarService.insert(u);
			return "1";
		}else{
			UseCarModel info = useCarService.selectByPrimaryKey(u.getUid());
			info.setCno(u.getCno());
			info.setDname(u.getDname());
			info.setUname(u.getUname());
			info.setUdate(u.getUdate());
			info.setUtime(u.getUtime());
			info.setUreason(u.getUreason());
			int i = useCarService.updateByPrimaryKey(info);
			return i>0?"1":"0";
		}
	} 
	
	@ResponseBody
	@RequestMapping("update")
	public Object update(UseCarModel u) {
		
		UseCarModel info = useCarService.selectByPrimaryKey(u.getUid());
		info.setCno(u.getCno());
		info.setDname(u.getDname());
		info.setUname(u.getUname());
		info.setUdate(u.getUdate());
		info.setUtime(u.getUtime());
		info.setUreason(u.getUreason());
		int i = useCarService.updateByPrimaryKey(info);
		return i>0?"1":"0";
	} 
	
	@ResponseBody
	@RequestMapping("delete")
	public String deleteMaintain(UseCarModel u) {
		
		int i = useCarService.delete(u);
		return i==1?"1":"0";
	}
	
	@ResponseBody
	@RequestMapping("deleteBatch")
	public Object deleteBatch(Datas datas) {
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("datas", datas.getIds());
		useCarService.deleteBatch(paramMap);
		return "1";
	}
}
