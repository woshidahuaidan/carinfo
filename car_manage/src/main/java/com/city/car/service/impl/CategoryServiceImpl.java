package com.city.car.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.city.car.mapper.CategoryMapper;
import com.city.car.model.CategoryModel;
import com.city.car.model.LevalModel;
import com.city.car.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryMapper categoryMapper;
	
	public List<CategoryModel> selectAll() {
		return categoryMapper.selectAll();
	}

	public int insert(CategoryModel cc) {
		return categoryMapper.insert(cc);
	}

	public int delete(CategoryModel cc) {
		return categoryMapper.delete(cc);
	}

	public CategoryModel selectByPrimaryKey(int id) {
		return categoryMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKey(CategoryModel cc) {
		return categoryMapper.updateByPrimaryKey(cc);
	}

	public List<CategoryModel> pageList(Map<String, Object> paramMap) {
		return categoryMapper.pageList(paramMap);
	}

	public int count() {
		return categoryMapper.count();
	}

	public void deleteBatch(Map<String, Object> paramMap) {
		categoryMapper.deleteBatch(paramMap);
	}

	public List<LevalModel> selectLevel(LevalModel lm) {
		return categoryMapper.selectLevel(lm);
	}

	public int insertLevels(Map<String, Object> paramMap) {
		return categoryMapper.insertLevels(paramMap);
	}

}
