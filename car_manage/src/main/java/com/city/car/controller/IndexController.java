package com.city.car.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.city.car.model.CarinfoModel;
import com.city.car.model.CategoryModel;
import com.city.car.model.DriverInfoModel;
import com.city.car.service.CarinfoService;
import com.city.car.service.DriverInfoService;

@Controller
public class IndexController {

	@Autowired
	CarinfoService carinfoService;
	@Autowired
	DriverInfoService driverInfoService;
	
	@RequestMapping("main")
	public String main(ModelMap map){
		List<CarinfoModel> carinfoList = carinfoService.selectAll();
		List<DriverInfoModel> driverList = driverInfoService.selectAll();
		map.put("carinfoList", carinfoList);
		map.put("driverList", driverList);
		return "main";
	}
	
	@RequestMapping("carinfo/carinfoList")
	public String carinfoList(){
		return "carinfo/carinfoList";
	}
	
	@RequestMapping("category")
	public String category(){
		return "category/category2";
	}
	
	@RequestMapping("insurance")
	public String insurance(){
		return "insurance/insurance";
	}
	
	@RequestMapping("driver")
	public String driver(){
		return "driver/driver";
	}
	
	@RequestMapping("carinfo")
	public String carinfo(){
		return "carinfo/carinfo";
	}
	
	@RequestMapping("useCar")
	public String useCar(){
		return "useCar/useCar";
	}
	
	@RequestMapping("maintain")
	public String maintain(){
		return "maintain/maintain";
	}
	
	@RequestMapping("illegal")
	public String illegal(){
		return "illegal/illegal";
	}
	
	@RequestMapping("user")
	public String user(){
		return "user/user";
	}
	
}
