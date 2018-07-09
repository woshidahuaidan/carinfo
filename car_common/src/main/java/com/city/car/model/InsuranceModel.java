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
public class InsuranceModel {

	private Integer sid;
	private  String stype;
	private Double smoney;
	private String scharact;
	private String company;
	private Date createTime;
	private Date modifyTime;
	private String cno;
}
