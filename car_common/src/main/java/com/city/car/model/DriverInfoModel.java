package com.city.car.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
public class DriverInfoModel implements Serializable{

	private Integer did;
	private String dname;
	private String sex;
	private Date birth;
	private String dno;
	private Date issueDate;
	private int level;
	private String organ;
	private int status;
	private Date createTime;
	private String files;
	private MultipartFile file;
		
}
