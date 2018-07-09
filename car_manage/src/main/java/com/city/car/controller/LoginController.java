package com.city.car.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.city.car.model.PermissionModel;
import com.city.car.model.UserModel;
import com.city.car.service.UserService;
import com.city.car.utils.AJAXResult;

@Controller
public class LoginController {

	@Autowired
	UserService userService;
	
	@ResponseBody
	@RequestMapping("checkLogin")
	public Object checkLogin(UserModel us, HttpSession session) {
		AJAXResult result = new AJAXResult();
		
		UserModel dbUser = userService.selectLogin(us);
		if ( dbUser == null ) {
			result.setSuccess(false);
		} else {
			result.setSuccess(true);
			// 查询当前登录用户的权限菜单（许可）
			List<PermissionModel> permissions =
				userService.queryPermissionsByUser(dbUser);
			// 整合权限菜单
			Map<Integer, PermissionModel> permissionMap = new HashMap<Integer, PermissionModel>();
			for ( PermissionModel permission : permissions ) {
				permissionMap.put(permission.getId(), permission);
			}
			PermissionModel root = null;
			for ( PermissionModel permission : permissions ) {
				PermissionModel child = permission;
				if ( child.getPid() == 0 ) {
					root = permission;
				} else {
					System.out.println(child.getPid());
					PermissionModel parent = permissionMap.get(child.getPid());
					parent.getChildren().add(child);
				}
			}
			session.setAttribute("rootPermission", root);
			session.setAttribute("dbUser", dbUser);
			System.out.println(dbUser.getName());
		}
		return result;
	}
	
	
	@RequestMapping("doindex")
	public String doindex(UserModel us,ModelMap map){
		UserModel dbu = userService.selectLogin(us);
		if(dbu == null) {
			//登录不成功
			String msg  = "登录账号或密码不正确，请重新输入";
			map.put("msg", msg);
			System.out.println("ccccc");
			return "redirect:/login.do";
		}else {
			//登录成功
			map.put("dbu", dbu);
			return "index";
		}
	}
	
	@RequestMapping("domain")
	public String domain(UserModel us,ModelMap map){
		UserModel dbu = userService.selectLogin(us);
		if(dbu == null) {
			//登录不成功
			String msg  = "登录账号或密码不正确，请重新输入";
			map.put("msg", msg);
			System.out.println("ccccc");
			return "redirect:/login2.do";
		}else {
			//登录成功
			map.put("dbu", dbu);
			return "main";
		}
	}
	
	@RequestMapping("login")
	public String login(){
		return "login";
	}
	
	@RequestMapping("login2")
	public String login2(){
		return "login2";
	}
	
	@RequestMapping("exit")
	public String exit(HttpSession session){
		session.invalidate();
		return "redirect:/login.do";
	}
	
	@RequestMapping("exit2")
	public String exit2(HttpSession session){
		session.invalidate();
		return "redirect:/login2.do";
	}
	
@RequestMapping("index")
	public String index(){
		return "index";
	}
}
