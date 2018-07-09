package com.city.car.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.city.car.mapper.UserMapper;
import com.city.car.model.PermissionModel;
import com.city.car.model.RoleModel;
import com.city.car.model.UserModel;
import com.city.car.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;
	
	public UserModel selectLogin(UserModel us) {
		return userMapper.selectLogin(us);
	}

	public List<PermissionModel> queryPermissionsByUser(UserModel dbUser) {
		return userMapper.queryPermissionsByUser(dbUser);
	}

	public List<UserModel> pageList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return userMapper.pageList(paramMap);
	}

	public int count() {
		// TODO Auto-generated method stub
		return userMapper.count();
	}

	public void deleteBatch(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		userMapper.deleteBatch(paramMap);
	}

	public int delete(UserModel u) {
		// TODO Auto-generated method stub
		return userMapper.delete(u);
	}

	public int updateByPrimaryKey(UserModel info) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKey(info);
	}

	public UserModel selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(id);
	}

	public int insert(UserModel u) {
		// TODO Auto-generated method stub
		return userMapper.insert(u);
	}

	public List<RoleModel> selectRole(RoleModel r) {
		// TODO Auto-generated method stub
		return userMapper.selectRole(r);
	}

	public int insertRole(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return userMapper.insertRole(paramMap);
	}

}
