package com.yangml.porttal;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.TimeZone;

import org.apache.http.client.ClientProtocolException;


import net.sf.json.JSONArray;


public class PorttalAction extends BaseAction{
	String uid="";
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String addUser() throws ClientProtocolException, IOException{
		PorttalDao ec = new PorttalDao();
		String url = "http://10.0.0.120:8080/3d/assetinterface/user!add";
		String json="{\"userName\":\"yangml\","+
				"\"pName\":\"sysadmin\","+
				"\"pId\":\"admin\","+
				"\"userPassword\":\"123\"}";
		
		//String json = ec.getUpdateAssetInfo();
		String res = ec.sendData(url, json);
		System.out.println("esm return:"+res);
		getResponse().setContentType("text/html;charset=utf-8");
		getResponse().getWriter().print(res);
		return null;
	}
	public String query() throws ClientProtocolException, IOException{
		PorttalDao ec = new PorttalDao();
		String url = "http://10.0.0.120:8080/3d/assetinterface/user!query";
		//开始时间
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss:SS"); 
		TimeZone t = sdf.getTimeZone(); 
		t.setRawOffset(0); 
		sdf.setTimeZone(t); 
		Long startTime = System.currentTimeMillis(); 
		String str = ec.getUserLog(url);
		System.out.println("action="+str.toString());
		getResponse().setContentType("text/html;charset=UTF-8");
		getResponse().getWriter().print(str);
		//结束时间
		Long endTime = System.currentTimeMillis(); 
		System.out.println("需要的时间" + sdf.format(new Date(endTime - startTime))); 
		return null;
	}
	public String del() throws ClientProtocolException, IOException{
		PorttalDao ec = new PorttalDao();
		String url = "http://10.0.0.120:8080/3d/assetinterface/user!remove";
		//String json="";
		
		//String json = ec.getUpdateAssetInfo();
		String res = ec.remove(url,uid);
		System.out.println("esm return:"+res);
		getResponse().setContentType("text/html;charset=utf-8");
		getResponse().getWriter().print(res);
		return null;
	}
}
