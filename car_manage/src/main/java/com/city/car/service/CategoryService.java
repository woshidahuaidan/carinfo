package com.city.car.service;

import java.util.List;
import java.util.Map;

import com.city.car.model.CategoryModel;
import com.city.car.model.LevalModel;

public interface CategoryService {

	List<CategoryModel> selectAll();

	int insert(CategoryModel cc);

	int delete(CategoryModel cc);

	CategoryModel selectByPrimaryKey(int id);

	int updateByPrimaryKey(CategoryModel cc);

	List<CategoryModel> pageList(Map<String, Object> paramMap);

	int count();

	void deleteBatch(Map<String, Object> paramMap);

	List<LevalModel> selectLevel(LevalModel lm);

	int insertLevels(Map<String, Object> paramMap);


}
