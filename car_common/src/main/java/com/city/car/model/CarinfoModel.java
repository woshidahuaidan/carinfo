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
public class CarinfoModel implements Serializable{
	     private Integer cid;
	     private String cmodel;
	     private String ccolor;
	     private int cnum;
	     private int status;
	     private String cno;
	     private String photo;
	     private Date createTime;
	     private String ccname;
	     private MultipartFile file;
	     private Integer id;
}
