package com.city.car.utils;


import java.util.List;

public class Page<T> {

	private Integer pagesize;//每页个数
	private Integer totalno;//总页数
	private Integer pageno;//页数
	private Integer totalsize;//总个数
	private List<T> datas;//数据
	public Integer getPagesize() {
		return pagesize;
	}
	public void setPagesize(Integer pagesize) {
		this.pagesize = pagesize;
	}
	public Integer getTotalno() {
		return totalno;
	}
	public void setTotalno(Integer totalno) {
		this.totalno = totalno;
	}
	public Integer getPageno() {
		return pageno;
	}
	public void setPageno(Integer pageno) {
		this.pageno = pageno;
	}
	public Integer getTotalsize() {
		return totalsize;
	}
	public void setTotalsize(Integer totalsize) {
		if ( totalsize % pagesize == 0 ) {
    		totalno = totalsize / pagesize;
    	} else {
    		totalno = totalsize / pagesize + 1;
    	}
		this.totalsize = totalsize;
	}
	public List<T> getDatas() {
		return datas;
	}
	public void setDatas(List<T> datas) {
		this.datas = datas;
	}
	
}
