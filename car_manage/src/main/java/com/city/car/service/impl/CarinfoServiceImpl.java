package com.city.car.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.city.car.mapper.CarinfoMapper;
import com.city.car.model.CarinfoModel;
import com.city.car.model.DriverInfoModel;
import com.city.car.service.CarinfoService;

@Service
public class CarinfoServiceImpl implements CarinfoService {

	@Autowired
	CarinfoMapper carinfoMapper;
	
	public List<CarinfoModel> selectAll() {
		return carinfoMapper.selectAll();
	}

	public int insert(CarinfoModel c) {
		return carinfoMapper.insert(c);
	}

	public CarinfoModel selectByPrimaryKey(Integer cid) {
		return carinfoMapper.selectByPrimaryKey(cid);
	}

	public int updateByPrimaryKey(CarinfoModel info) {
		return carinfoMapper.updateByPrimaryKey(info);
	}

	public void deleteBatch(Map<String, Object> paramMap) {
		carinfoMapper.deleteBatch(paramMap);
	}

	public int delete(CarinfoModel c) {
		return carinfoMapper.delete(c);
	}

	public List<CarinfoModel> pageList(Map<String, Object> paramMap) {
		return carinfoMapper.pageList(paramMap);
	}

	public int count() {
		return carinfoMapper.count();
	}

	public List<CarinfoModel> selectCarinfoByCategoryName(String ccname) {
		return carinfoMapper.selectCarinfoByCategoryName(ccname);
	}

	public void selectByCarinfo(Integer cno) {
		// TODO Auto-generated method stub
		carinfoMapper.selectByCarinfo(cno);
	}

	public List<CarinfoModel> selectCarinfoByCategoryId(Integer id) {
		// TODO Auto-generated method stub
		return carinfoMapper.selectCarinfoByCategoryId(id);
	}

	public List<CarinfoModel> selectCarinfoByCategoryId(String id) {
		// TODO Auto-generated method stub
		return carinfoMapper.selectCarinfoByCategoryId(id);
	}

	public List<DriverInfoModel> driverByCarinfoId(String cno) {
		// TODO Auto-generated method stub
		return carinfoMapper.driverByCarinfoId(cno);
	}

}
