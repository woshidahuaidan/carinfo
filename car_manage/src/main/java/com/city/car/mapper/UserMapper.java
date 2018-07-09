package com.city.car.mapper;

import java.util.List;
import java.util.Map;
import com.city.car.model.PermissionModel;
import com.city.car.model.RoleModel;
import com.city.car.model.UserModel;

public interface UserMapper {

	UserModel selectLogin(UserModel us);

	List<PermissionModel> queryPermissionsByUser(UserModel dbUser);

	List<UserModel> pageList(Map<String, Object> paramMap);

	int count();

	void deleteBatch(Map<String, Object> paramMap);

	int delete(UserModel u);

	int updateByPrimaryKey(UserModel info);

	UserModel selectByPrimaryKey(Integer id);

	int insert(UserModel u);

	List<RoleModel> selectRole(RoleModel r);

	int insertRole(Map<String, Object> paramMap);
}
