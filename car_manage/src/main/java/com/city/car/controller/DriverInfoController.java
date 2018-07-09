package com.city.car.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.city.car.model.CategoryModel;
import com.city.car.model.DriverInfoModel;
import com.city.car.service.CategoryService;
import com.city.car.service.DriverInfoService;
import com.city.car.utils.Datas;
import com.city.car.utils.MyFileUpload;

@Controller
@RequestMapping("driver")
public class DriverInfoController {

	@Autowired
	DriverInfoService driverInfoService;
	@Autowired
	CategoryService  categoryService;
	
	@RequestMapping("driverAndCategory")
	public String carinfAndCategory(ModelMap map,@Param("ccname")String ccname) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ccname", ccname);
		
		List<DriverInfoModel> driverList = driverInfoService.selectAll();
		List<CategoryModel> categoryList = categoryService.selectAll();
		map.put("driverList", driverList);
		map.put("categoryList", categoryList);
		return "driver/driverList";
	}
	
	@ResponseBody
	@RequestMapping("gotoDriver")
	public Object goto_ins() {
		
		List<DriverInfoModel> list_driver = driverInfoService.selectAll();
		return list_driver;
	}
	
	@ResponseBody
	@RequestMapping("pass")
	public Object pass(Datas d) {
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("d", d.getS());
		driverInfoService.passStatus(paramMap);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("/pageQueryList")
	public Object pageQueryList(int page,int rows,String dname,
				Integer status,Integer level) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("start", (page - 1) * rows);
		paramMap.put("size", rows);
		paramMap.put("dname", dname);
		paramMap.put("level", level);
		paramMap.put("status", status);
		
		List<DriverInfoModel> list = driverInfoService.pageList(paramMap);
		int count = driverInfoService.count(paramMap);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", count);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public String delete(DriverInfoModel d) {
		
		int i = driverInfoService.delete(d);
		return i==1?"1":"0";
	}
	
	@ResponseBody
	@RequestMapping("deleteBatch")
	public Object deleteBatch(Datas datas) {
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("datas", datas.getIds());
		driverInfoService.deleteBatch(paramMap);
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value=("addOrUpdate"),method=RequestMethod.POST)
	public Object addOrUpdate(DriverInfoModel d) {
		if(d.getDid()== null){ 
			//上传图片
//			String img = MyFileUpload.uploadImage(photo);
	
//			d.setFiles(img);
			//保存信息
			int i = driverInfoService.insert1(d);
			return i>0?"1":"0";
		}else{
			DriverInfoModel driver = driverInfoService.selectByPrimaryKey(d.getDid());
			driver.setDname(d.getDname());
			driver.setSex(d.getSex());
			driver.setBirth(d.getBirth());
			driver.setDno(d.getDno());
			driver.setLevel(d.getLevel());
			driver.setOrgan(d.getOrgan());
			driver.setStatus(d.getStatus());
			driver.setIssueDate(d.getIssueDate());
			int i = driverInfoService.updateByPrimaryKey(driver);
			
			return i>0?"1":"0";
		}
	} 
	
	@ResponseBody
	@RequestMapping(value=("add"))
	public Object add(DriverInfoModel d) {
		if(d.getDid()== null){ 
			//上传图片
			 String uploadImage = MyFileUpload.uploadImage(d.getFile());
			d.setFiles(uploadImage);
			d.setFile(null);
			//保存信息
			 driverInfoService.insert1(d);
			return "success";
		}else{
			DriverInfoModel driver = driverInfoService.selectByPrimaryKey(d.getDid());
			driver.setDname(d.getDname());
			driver.setSex(d.getSex());
			driver.setBirth(d.getBirth());
			driver.setDno(d.getDno());
			driver.setLevel(d.getLevel());
			driver.setOrgan(d.getOrgan());
			driver.setStatus(d.getStatus());
			driver.setIssueDate(d.getIssueDate());
			driver.setFiles(d.getFiles());
			String uploadImage = MyFileUpload.uploadImage(d.getFile());
			driver.setFiles(uploadImage);
			driver.setFiles(d.getFiles());
			 driverInfoService.updateByPrimaryKey(driver);
			 return "success";
		}
	} 
}









