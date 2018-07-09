package com.city.car.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.city.car.model.InsuranceModel;
import com.city.car.service.InsuranceService;
import com.city.car.utils.Datas;

@Controller
@RequestMapping("insurance")
public class InsuranceController {

	@Autowired
	InsuranceService insuranceService;
	
	@ResponseBody
	@RequestMapping("query")
	public Object queryByStatus(String queryContent) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("queryContent", queryContent);
		
		List<InsuranceModel> list_search = insuranceService.querySearch(paramMap);
		return list_search;
	}
	
	@ResponseBody
	@RequestMapping("/pageQueryList")
	public Object pageQueryList(int page,int rows,String queryContent) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("start", (page - 1) * rows);
		paramMap.put("size", rows);
		paramMap.put("queryContent", queryContent);
		
		List<InsuranceModel> list = insuranceService.pageList(paramMap);
		int count = insuranceService.count(paramMap);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", count);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/pageList")
	public Object pageList(int page,int rows) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("start", (page - 1) * rows);
		paramMap.put("size", rows);
		
		List<InsuranceModel> list = insuranceService.pageList(paramMap);
		int count = insuranceService.count();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", count);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("gotoIns")
	public Object goto_ins(InsuranceModel ins) {
		
		List<InsuranceModel> list_ins = insuranceService.selectAll();
		return list_ins;
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public String deleteIns(InsuranceModel ins) {
		
		int i = insuranceService.delete(ins);
		return i==1?"1":"0";
	}
	
	@ResponseBody
	@RequestMapping("deleteBatch")
	public Object deleteBatch(Datas datas) {
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("datas", datas.getIds());
		insuranceService.deleteBatch(paramMap);
		return "1";
	}
	
	@ResponseBody
	@RequestMapping("addOrUpdate")
	public Object addOrUpdate(InsuranceModel ins) {
		if(ins.getSid() == null){
			
			int i = insuranceService.insert(ins);
			return i>0?"1":"0";
		}else{
			InsuranceModel info = insuranceService.selectByPrimaryKey(ins.getSid());
			info.setStype(ins.getStype());
			info.setSmoney(ins.getSmoney());
			info.setCompany(ins.getCompany());
			info.setScharact(ins.getScharact());
			info.setModifyTime(ins.getModifyTime());
			info.setCno(ins.getCno());
			int i = insuranceService.updateByPrimaryKey(info);
			return i>0?"1":"0";
		}
	} 
}
