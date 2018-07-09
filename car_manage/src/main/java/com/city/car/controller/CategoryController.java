package com.city.car.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.city.car.model.CategoryModel;
import com.city.car.model.LevalModel;
import com.city.car.service.CategoryService;
import com.city.car.utils.Datas;

@Controller
@RequestMapping("category")
public class CategoryController {

	@Autowired
	CategoryService  categoryService;
	
	
	@ResponseBody
	@RequestMapping("addLevels")
	public Object addLevels(Integer id,Datas datas) {
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("levels", datas.getS());
		paramMap.put("id", id);
		int i = categoryService.insertLevels(paramMap);
		return i>0?"1":"0";
	}
	
	@ResponseBody
	@RequestMapping("levelList")
	public Object levelList(LevalModel lm) {
		List<LevalModel> levelList = categoryService.selectLevel(lm);
		return levelList;
	}
	
	@ResponseBody
	@RequestMapping("/pageList")
	public Object pageList(int page,int rows) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("start", (page - 1) * rows);
		paramMap.put("size", rows);
		
		List<CategoryModel> list = categoryService.pageList(paramMap);
		int count = categoryService.count();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", count);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("addOrUpdate")
	public Object addOrUpdate(CategoryModel cc) {
		if(cc.getId() == null){
			int i = categoryService.insert(cc);
			return i>0?"1":"0";
		}else{
			CategoryModel info = categoryService.selectByPrimaryKey(cc.getId());
			info.setCcname(cc.getCcname());
			int i = categoryService.updateByPrimaryKey(info);
			return i>0?"1":"0";
		}
	} 
	@ResponseBody
	@RequestMapping("insertC")
	public Object insertCategoryC(CategoryModel cc) {
		
		 categoryService.insert(cc);
		return "success";
	}
	@ResponseBody
	@RequestMapping("insert")
	public String insertCategory(CategoryModel cc) {
		
		int i = categoryService.insert(cc);
		return i==1?"1":"0";
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public String deleteCategory(CategoryModel cc) {
		
		int i = categoryService.delete(cc);
		return i==1?"1":"0";
	}
	
	@ResponseBody
	@RequestMapping("deleteBatch")
	public Object deleteBatch(Datas datas) {
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("datas", datas.getIds());
		categoryService.deleteBatch(paramMap);
		return "1";
	}
	
	@ResponseBody
	@RequestMapping("modify")
	public Object modify(int id) {
	
		CategoryModel info = categoryService.selectByPrimaryKey(id);
		return info;
	}
	
	@ResponseBody
	@RequestMapping("edit_category")
	public Object edit_sys_cat(CategoryModel cc) {
		
		categoryService.updateByPrimaryKey(cc);
		return "1";
	}
	
	@ResponseBody
	@RequestMapping("gotoCa")
	public Object goto_Ca(CategoryModel cc) {
		
		List<CategoryModel> list_ca = new ArrayList<CategoryModel>();
		list_ca = categoryService.selectAll();
		
		return list_ca;
	}
}
