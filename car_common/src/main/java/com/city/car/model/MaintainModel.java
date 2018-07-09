package com.city.car.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
public class MaintainModel {

	private Integer mid;
	private Date mtime;
	private String maddr;
	private Double mmoney;
	private String mreason;
	private Date createTime;
	/*private CarinfoModel carinfo;
	private DriverInfoModel driver;*/
	private String cno;
	private String dname;
}
