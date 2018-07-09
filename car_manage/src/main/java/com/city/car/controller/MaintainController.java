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
import com.city.car.service.CarinfoService;
import com.city.car.service.DriverInfoService;
import com.city.car.service.MaintainService;
import com.city.car.utils.AJAXResult;
import com.city.car.utils.Datas;
import com.city.car.utils.Page;

@Controller
@RequestMapping("maintain")
public class MaintainController {

	@Autowired
	MaintainService maintainService;
	@Autowired
	DriverInfoService driverInfoService;
	@Autowired
	CarinfoService carinfoService;
	
	@ResponseBody
	@RequestMapping("/pageQueryMaintain")
	public Object roleQuery(Integer pageno,Integer pagesize) {
		AJAXResult result = new AJAXResult(); 
		
		try {
			int start = (pageno - 1) * pagesize;
	    	Map<String, Object> paramMap = new HashMap<String, Object>();
	    	paramMap.put("start", start);
	    	paramMap.put("size", pagesize);
	    	
	    	List<MaintainModel> maintainList = maintainService.pageList(paramMap);
	    	//查询总条数
	    	int totalsize = maintainService.countPage(paramMap);
	    	
	    	Page<MaintainModel> maintainPage = new Page<MaintainModel>();
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
	
	
	@RequestMapping("maintainList")
	public String maintainList(ModelMap map){
		List<MaintainModel> maintainList = maintainService.select();
		map.put("maintainList", maintainList);
		return "maintain/maintainList2";
	}
	
	
	@RequestMapping("addList")
	public String addList(ModelMap map){
		List<CarinfoModel> carinfoList = carinfoService.selectAll();
		List<DriverInfoModel> listDriver = driverInfoService.selectAll();
		map.put("carinfoList", carinfoList);
		map.put("listDriver", listDriver);
		return "maintain/add";
	}
	
	@ResponseBody
	@RequestMapping("insert")
	public Object insert(MaintainModel m) {
		AJAXResult result = new AJAXResult();
		try {
			maintainService.insert(m);
			result.setSuccess(true);
		//	System.out.println(result);
		}catch(Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("goto_maintain_list")
	public Object goto_maintain_list() {
		
		List<MaintainModel> list = new ArrayList<MaintainModel>();
		list = maintainService.selectAll();
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/pageList")
	public Object pageList(int page,int rows) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("start", (page - 1) * rows);
		paramMap.put("size", rows);
		
		List<MaintainModel> list = maintainService.pageList(paramMap);
		int count = maintainService.count();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", count);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("update")
	public Object update(MaintainModel m) {
		if(m.getMid()==null){
			maintainService.insert(m);
			return "1";
		}else{
			MaintainModel info = maintainService.selectByPrimaryKey(m.getMid());
			
			info.setMaddr(m.getMaddr());
			info.setCno(m.getCno());
			info.setDname(m.getDname());
			info.setMmoney(m.getMmoney());
			info.setMreason(m.getMreason());
			info.setMtime(m.getMtime());
			info.setDname(m.getDname());
			int i = maintainService.updateByPrimaryKey(info);
			return i>0?"1":"0";
		}
	} 
	
	/*@ResponseBody
	@RequestMapping("update")
	public Object update(MaintainModel m) {
		
		MaintainModel info = maintainService.selectByPrimaryKey(m.getMid());
		
		info.setMaddr(m.getMaddr());
		info.setCno(m.getCno());
		info.setDname(m.getDname());
		info.setMmoney(m.getMmoney());
		info.setMreason(m.getMreason());
		info.setMtime(m.getMtime());
		int i = maintainService.updateByPrimaryKey(info);
		return i>0?"1":"0";
	} */
	
	@ResponseBody
	@RequestMapping("delete")
	public String deleteMaintain(MaintainModel m) {
		
		int i = maintainService.delete(m);
		return i==1?"1":"0";
	}
	
	@ResponseBody
	@RequestMapping("deleteBatch")
	public Object deleteBatch(Datas datas) {
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("datas", datas.getIds());
		maintainService.deleteBatch(paramMap);
		return "1";
	}
}
