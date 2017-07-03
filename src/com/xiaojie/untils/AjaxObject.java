package com.xiaojie.untils;

import java.util.List;

public class AjaxObject<T> {
	private Integer code;//code=100表示正确，否则错误
	private String msg;
	private List<T> list;
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
}
