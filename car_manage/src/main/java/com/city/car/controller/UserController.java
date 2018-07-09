package com.city.car.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.city.car.model.CategoryModel;
import com.city.car.model.InsuranceModel;
import com.city.car.model.RoleModel;
import com.city.car.model.UserModel;
import com.city.car.service.UserService;
import com.city.car.utils.Datas;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	UserService  userService;
	
	@ResponseBody
	@RequestMapping("addRole")
	public Object addRole(Integer id,Datas datas) {
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("role", datas.getS());
		paramMap.put("id", id);
		int i = userService.insertRole(paramMap);
		return i>0?"1":"0";
	}
	
	@ResponseBody
	@RequestMapping("roleList")
	public Object selectRole(RoleModel r) {
		
		List<RoleModel> roleList =  userService.selectRole(r);
		return roleList;
	}
	
	@ResponseBody
	@RequestMapping("/pageList")
	public Object pageList(int page,int rows) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("start", (page - 1) * rows);
		paramMap.put("size", rows);
		
		List<UserModel> list = userService.pageList(paramMap);
		int count = userService.count();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", count);
		return map;
	}

	@ResponseBody
	@RequestMapping("addOrUpdate")
	public Object addOrUpdate(UserModel u) {
		if(u.getId() == null){
			int i = userService.insert(u);
			return i>0?"1":"0";
		}else{
			UserModel info = userService.selectByPrimaryKey(u.getId());
			info.setName(u.getName());
			info.setPassword(u.getPassword());
			int i = userService.updateByPrimaryKey(info);
			return i>0?"1":"0";
		}
	} 
	
	@ResponseBody
	@RequestMapping("delete")
	public String deleteCategory(UserModel u) {
		
		int i = userService.delete(u);
		return i==1?"1":"0";
	}
	
	@ResponseBody
	@RequestMapping("deleteBatch")
	public Object deleteBatch(Datas datas) {
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("datas", datas.getIds());
		userService.deleteBatch(paramMap);
		return "1";
	}
}
