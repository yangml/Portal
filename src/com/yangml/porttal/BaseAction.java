package com.yangml.porttal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements ServletRequestAware,ServletResponseAware{
	private static final long serialVersionUID = 1L;
	private HttpServletRequest _request = null;
	private HttpServletResponse _response = null;
	public void setServletRequest(HttpServletRequest request) {
		this._request = request;
	}

	public void setServletResponse(HttpServletResponse response) {
		this._response = response;
	}
	public HttpServletRequest getRequest() {
		return _request;
	}
	public HttpServletResponse getResponse() {
		return _response;
	}

}
