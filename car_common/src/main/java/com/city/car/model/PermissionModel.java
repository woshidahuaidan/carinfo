package com.city.car.model;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
public class PermissionModel {

	private Integer id,pid;
	private String name,url;
	private List<PermissionModel> children = new ArrayList<PermissionModel>();
	
}
