<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username = request.getParameter("username");
String password = request.getParameter("password");
String seetin = (String)request.getSession().getAttribute("remoteusername");
//out.println("session="+seetin);

Cookie[] coos =  request.getCookies();
String username1 = "";
String password1 = "";
Cookie cookie = null;
for(int i=0;i<coos.length;i++){
	cookie = coos[i];
	if(cookie.getName().equals("cooUserName")){
		username1 = cookie.getValue();
	}
	if(cookie.getName().equals("cooPassword")){
		password1 = cookie.getValue();
	}
}
System.out.println(username+"=====44==="+password);


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>主页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="JS/jquery-1.10.2.js"></script>
	<script type="text/javascript">
	</script>
  </head>
  
  <body>
  <hr>
  <ul class="nav nav-pills">
  <li class="active">
    <a href="javascript:void(0)">首页</a>
  </li>
  <li><a href="javascript:void(0)">退出</a></li>
  <li><a id="add" href="javascript:void(0)">添加用户</a></li>
  <!--li><a href="javascript:void(0)" onclick="">修改用户</a></li-->
  <li><a id="query" href="javascript:void(0)" >查询用户</a></li>
</ul>
  	<ul class="thumbnails">
  <li class="span4">
    <div class="thumbnail">
      <img data-src="holder.js/300x200" alt="">
      <h3>ESM 系统入口</h3>
      <p>无需再次登录点击即可直接进入.</p>
		<div class="hero-unit">
			  <h1>ESN</h1>
			  <p>ESM</p>
			  <p>
			    <a class="btn btn-primary btn-large" href="http://10.0.0.120:8080/ESM" target="_bank">
			      进入
			    </a>
			  </p>
		</div>
    </div>
  </li>
    <li class="span4">
    <div class="thumbnail">
      <img data-src="holder.js/300x200" alt="">
      <h3>3D²CMP平台 入口</h3>
      <p>无需再次登录点击即可直接进入.</p>
      		<div class="hero-unit">
			  <h1>3D²CMP</h1>
			  <p>3D²CMP</p>
			  <p>
			    <a class="btn btn-primary btn-large" href="http://10.0.0.120:8080/3d/assetinterface/loginRemote!login" target="_bank">
			      进入
			    </a>
			  </p>
		</div>
    </div>
  </li>
</ul>
<hr>
  	<table id='userinfo' class='table table-bordered'>
  		<thead>
	  			<tr>
	  				<th>用户名ID</th>
					<th>用户名</th>
					<th>真实姓名</th>
					<th>电子邮件</th>
					<th>办公电话</th>
					<th>用户职务</th>
					<th>部门</th>
					<th>创建人名称</th>
					<th>所属管理组</th>
					<th>操作</th>
	  			</tr>
		</thead>
		<tbody>
		</tbody>
  	</table>
  </body>
</html>
	<script type="text/javascript">
		$(function(){
			$("#add").click(function(){
  	  	  	  	var src = "porttal/porttal!addUser";
				$.post(src,function(data){
						alert(data);
						$("#query").trigger("click");
					})
				})
			$("#query").click(function(){
				//alert(99)
  	  	  	  	var src = "porttal/porttal!query";
  	  	  	  	var tr;
				$.post(src,function(data){
					var jsonObj = eval("(" + data + ")"); 
					//alert(data); 
					//alert(jsonObj.length);
					$("#userinfo tbody").html('');
		            for (var i = 0; i < jsonObj.length; i++) {  
						//获取返回的数据
						var uid = jsonObj[i].userId;
						var rackName = jsonObj[i].userName;
						var rmName = jsonObj[i].userTruename;
						var rmInner = jsonObj[i].userEmail;
						var rmip = jsonObj[i].userOffphone;
						var rmClass = jsonObj[i].userPost;
						var rmType = jsonObj[i].userDepartment;
						var rnUser = jsonObj[i].userCreatename;
						var rmHeight = jsonObj[i].groupName;
						//alert(rackName+"-"+rmName+"-"+rmInner+"-"+rmip+"-"+rmClass+"-"+rmType+"-"+rnUser+"-"+rmHeight);
						//alert(rmName);
		            	//处理数据
		            	tr+='<tr><td>'+uid+'</td><td>'+rackName+'</td>'
						+'<td>'+rmName+'</td>'
						+'<td>'+rmInner+'</td>'
						+'<td>'+rmip+'</td>'
						+'<td>'+rmClass+'</td>'
						+'<td>'+rmType+'</td>'
						+'<td>'+rnUser+'</td>'
						+'<td>'+rmHeight+'</td>'
						+'<td><a class="btn" onclick="del(\''+uid+'\')">删除</a></td>'
						+'</tr>'
						} 
						//alert(tr)
						$("#userinfo tbody").append(tr);
					})
				})


				
			});
			function del(uid){
				alert(uid);
			  	  	var src = "porttal/porttal!del";
					$.post(src,{uid:uid},function(data){
							alert(data);
							$("#query").trigger("click");
						})
				}
	</script>
