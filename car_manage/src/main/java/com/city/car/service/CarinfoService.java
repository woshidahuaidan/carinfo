package com.city.car.service;

import java.util.List;
import java.util.Map;
import com.city.car.model.CarinfoModel;
import com.city.car.model.DriverInfoModel;

public interface CarinfoService {

	List<CarinfoModel> selectAll();

	int insert(CarinfoModel c);

	CarinfoModel selectByPrimaryKey(Integer cid);

	int updateByPrimaryKey(CarinfoModel info);

	void deleteBatch(Map<String, Object> paramMap);

	int delete(CarinfoModel c);

	List<CarinfoModel> pageList(Map<String, Object> paramMap);

	int count();

	List<CarinfoModel> selectCarinfoByCategoryName(String ccname);

	void selectByCarinfo(Integer cno);

	List<CarinfoModel> selectCarinfoByCategoryId(Integer id);

	List<CarinfoModel> selectCarinfoByCategoryId(String id);

	List<DriverInfoModel> driverByCarinfoId(String cno);

}
