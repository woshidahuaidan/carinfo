package com.city.car.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.city.car.model.CarinfoModel;
import com.city.car.model.CategoryModel;
import com.city.car.model.DriverInfoModel;
import com.city.car.service.CarinfoService;
import com.city.car.service.CategoryService;
import com.city.car.service.DriverInfoService;
import com.city.car.utils.Datas;
import com.city.car.utils.MyFileUpload;

@Controller
@RequestMapping("carinfo")
public class CarinfoController {

	@Autowired
	CarinfoService carinfoService;
	@Autowired
	CategoryService  categoryService;
	@Autowired
	DriverInfoService driverInfoService;
	
	@RequestMapping("carinfoByCategoryId")
	public Object carinfoByCategoryId(ModelMap map,String queryid) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("queryId", queryid);
		
		List<CarinfoModel> carinfoList = carinfoService.selectCarinfoByCategoryId(queryid);
		List<DriverInfoModel> driverList = driverInfoService.selectByCategoryId(queryid);
		map.put("carinfo", carinfoList);
		map.put("driverList", driverList);
	return "carinfo/innerList";
	}
	
	@RequestMapping("carinfoByCategory")
	public Object carinfoByCategory(ModelMap map,@Param("ccname")String ccname) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ccname", ccname);
		
		List<CarinfoModel> carinfoList = carinfoService.selectCarinfoByCategoryName(ccname);
		
		map.put("carinfo", carinfoList);
		return "carinfo/innerList";
	}
	
	@RequestMapping("carinfAndCategory")
	public String carinfAndCategory(ModelMap map,@Param("ccname")String ccname) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ccname", ccname);
		
		List<CarinfoModel> carinfoList = carinfoService.selectAll();
		List<CategoryModel> categoryList = categoryService.selectAll();
		map.put("carinfo", carinfoList);
		map.put("categoryList", categoryList);
		return "carinfo/carinfoList";
	}
	
	@ResponseBody
	@RequestMapping("goto_carinfo_list")
	public Object goto_carinfo_list(CarinfoModel c) {
		
		List<CarinfoModel> carinfoList = new ArrayList<CarinfoModel>();
		carinfoList = carinfoService.selectAll();
		
		return carinfoList;
	}
	
	@ResponseBody
	@RequestMapping("/pageList")
	public Object pageList(int page,int rows) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("start", (page - 1) * rows);
		paramMap.put("size", rows);
		
		List<CarinfoModel> list = carinfoService.pageList(paramMap);
		int count = carinfoService.count();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", count);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public String deleteCategory(CarinfoModel c) {
		
		int i = carinfoService.delete(c);
		return i==1?"1":"0";
	}
	
	@ResponseBody
	@RequestMapping("deleteBatch")
	public Object deleteBatch(Datas datas) {
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("datas", datas.getIds());
		carinfoService.deleteBatch(paramMap);
		return "1";
	}
	
	@ResponseBody
	@RequestMapping("addOrUpdate")
	public Object addOrUpdate(CarinfoModel c) {
		if(c.getCid() == null){
				String uploadImage = MyFileUpload.uploadImage(c.getFile());
				c.setPhoto(uploadImage);
				c.setFile(null);
			carinfoService.insert(c);
			return "success";
		}else{
			CarinfoModel info = carinfoService.selectByPrimaryKey(c.getCid());
			info.setCcname(c.getCcname());
			info.setCcolor(c.getCcolor());
			info.setCmodel(c.getCmodel());
			info.setCnum(c.getCnum());
			info.setStatus(c.getStatus());
			info.setPhoto(c.getPhoto());
			String uploadImage = MyFileUpload.uploadImage(c.getFile());
			info.setPhoto(uploadImage);
			carinfoService.updateByPrimaryKey(info);
			return "success";
		}
	} 
}
