package com.noisyle.crowbar.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.noisyle.crowbar.core.base.BaseModel;

@Entity
@Table(name="tp_new_cuisine_cat")
public class CuisineCat extends BaseModel {
	
	private static final long serialVersionUID = -3915579350404301395L;
	
	private String name;
	private Long cid;
	private Long sort;
	private String token;
	private String des;
	private Long parentid;
	private String logourl;
	private Long time;
	private Integer isfinal;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getCid() {
		return cid;
	}
	public void setCid(Long cid) {
		this.cid = cid;
	}
	public Long getSort() {
		return sort;
	}
	public void setSort(Long sort) {
		this.sort = sort;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public Long getParentid() {
		return parentid;
	}
	public void setParentid(Long parentid) {
		this.parentid = parentid;
	}
	public String getLogourl() {
		return logourl;
	}
	public void setLogourl(String logourl) {
		this.logourl = logourl;
	}
	public Long getTime() {
		return time;
	}
	public void setTime(Long time) {
		this.time = time;
	}
	public Integer getIsfinal() {
		return isfinal;
	}
	public void setIsfinal(Integer isfinal) {
		this.isfinal = isfinal;
	}
	
}
