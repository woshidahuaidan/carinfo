package com.city.car.mapper;

import java.util.List;
import java.util.Map;

import com.city.car.model.DriverInfoModel;

public interface DriverInfoMapper {

	List<DriverInfoModel> selectAll();

	//int insert(List<String> img, DriverInfoModel d);

	int insert(Map<String, Object> paramMap);

	//int insert(String img, DriverInfoModel d);

	int insert1(DriverInfoModel d);

	DriverInfoModel selectByPrimaryKey(Integer did);

	int updateByPrimaryKey(DriverInfoModel driver);

	int deleteBatch(Map<String, Object> paramMap);

	int delete(DriverInfoModel d);

	List<DriverInfoModel> pageList(Map<String, Object> paramMap);

	int count(Map<String, Object> paramMap);

	void passStatus(Map<String, Object> paramMap);

	List<DriverInfoModel> selectByCategoryId(Integer id);

	List<DriverInfoModel> selectByCategoryId(String queryid);

	
}
