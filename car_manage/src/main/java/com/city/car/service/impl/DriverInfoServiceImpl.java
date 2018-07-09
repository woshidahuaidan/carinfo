package com.city.car.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.city.car.mapper.DriverInfoMapper;
import com.city.car.model.DriverInfoModel;
import com.city.car.service.DriverInfoService;

@Service
public class DriverInfoServiceImpl implements DriverInfoService{

	@Autowired
	DriverInfoMapper driverInfoMapper;

	public List<DriverInfoModel> selectAll() {
		return driverInfoMapper.selectAll();
	}

	public int insert(Map<String, Object> paramMap) {
		return driverInfoMapper.insert(paramMap);
	}

	public int insert1(DriverInfoModel d) {
		return driverInfoMapper.insert1(d);
	}

	public DriverInfoModel selectByPrimaryKey(Integer did) {
		return driverInfoMapper.selectByPrimaryKey(did);
	}

	public int updateByPrimaryKey(DriverInfoModel driver) {
		return driverInfoMapper.updateByPrimaryKey(driver);
	}

	public int deleteBatch(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return driverInfoMapper.deleteBatch(paramMap);
	}

	public int delete(DriverInfoModel d) {
		// TODO Auto-generated method stub
		return driverInfoMapper.delete(d);
	}

	public List<DriverInfoModel> pageList(Map<String, Object> paramMap) {
		return driverInfoMapper.pageList(paramMap);
	}

	public int count(Map<String, Object> paramMap) {
		return driverInfoMapper.count(paramMap);
	}

	public void passStatus(Map<String, Object> paramMap) {
		driverInfoMapper.passStatus(paramMap);
	}

	public List<DriverInfoModel> selectByCategoryId(Integer id) {
		// TODO Auto-generated method stub
		return driverInfoMapper.selectByCategoryId(id);
	}

	public List<DriverInfoModel> selectByCategoryId(String queryid) {
		// TODO Auto-generated method stub
		return driverInfoMapper.selectByCategoryId(queryid);
	}
}
