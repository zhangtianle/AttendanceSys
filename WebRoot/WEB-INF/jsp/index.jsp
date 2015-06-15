<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Index</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.2/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.2/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.2/demo.css">
	<script type="text/javascript" src="js/jquery-easyui-1.4.2/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    	<div class="easyui-layout" style="width:100%;height:100%;">
		<div data-options="region:'north'" style="height:30px;line-height:25px;color:#E7E7E7;font-size:14px;padding-left:35px;">考勤系统</div>
		<div data-options="region:'south',split:true" style="height:50px;"></div>
		<div data-options="region:'west',split:true" title="West" style="width:100px;height:100%;"></div>
		<div data-options="region:'center'" style="width:100%;height:100%;"></div>
		</div>
  </body>
</html>
