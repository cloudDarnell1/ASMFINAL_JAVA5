package com.may.entity;

public class ResponseDTO {
	String msg;// thong diep voi error
	Boolean error;
	
	public ResponseDTO(String msg, Boolean error) {
		super();
		this.msg = msg;
		this.error = error;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Boolean getError() {
		return error;
	}

	public void setError(Boolean error) {
		this.error = error;
	}

}
