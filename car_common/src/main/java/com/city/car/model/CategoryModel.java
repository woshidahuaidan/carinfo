package com.city.car.model;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
public class CategoryModel {

	private Integer  id ;
	private String ccname;
	private Date createTime;
	
}
