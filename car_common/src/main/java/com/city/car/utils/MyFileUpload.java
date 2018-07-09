package com.city.car.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public class MyFileUpload {

	public static String uploadImage(MultipartFile files) {
		String path = MyPropertyUtil.getProperty("myUpload.properties","path");
		String name="";
		try {
			if(!files.isEmpty()){
				String fileName = files.getOriginalFilename();
				System.out.println(fileName);
				 name = System.currentTimeMillis()+fileName;
				String uploadName = path+"/"+name;
		
				files.transferTo(new File(uploadName));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 

		return name;
	}

	public static List<String> uploadImages(MultipartFile[] file) {
		String path = MyPropertyUtil.getProperty("myUpload.properties","windowPath");

		List<String> list_image = new ArrayList<String>();

		for (int i = 0; i < file.length; i++) {

			if (!file[i].isEmpty()) {
				String originalFilename = file[i].getOriginalFilename();

				String name = System.currentTimeMillis() + originalFilename;
				String upload_name = path + "/" + name;

				try {
					file[i].transferTo(new File(upload_name));
					list_image.add(name);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}
		return list_image;
	}

	

}
















