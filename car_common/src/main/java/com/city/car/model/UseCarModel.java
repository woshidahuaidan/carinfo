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
public class UseCarModel {

	private Integer uid;
	private String ureason;
	/*@DateTimeFormat(pattern="MM/dd/yyyy")*/
	private Date utime;
	/*@DateTimeFormat(pattern="MM/dd/yyyy")*/
	private Date udate;
	private String uname;
	private int status;
	/*private CarinfoModel carinfo;
	private DriverInfoModel driver;*/
	private String cno;
	private String dname;
}
