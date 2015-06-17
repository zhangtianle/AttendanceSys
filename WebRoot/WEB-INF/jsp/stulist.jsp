<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'stulist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css"
	href="js/jquery-easyui-1.4.2/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="js/jquery-easyui-1.4.2/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="js/jquery-easyui-1.4.2/demo.css">
<script type="text/javascript"
	src="js/jquery-easyui-1.4.2/jquery.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
  </head>
  <script type="text/javascript">
      
  $(function(){
		  
  $('#dg').datagrid({
	  
  		//url:'getstuinfo.do',
  		url:datagrid_data1.json,
        /*columns:[[
            {field:'name',title:'Name',width:100},
            {field:'cardID',title:'CardID',width:100,align:'right'},
            {field:'op',title:'操作',width:100,align:'right'}
        ]]*/
        columns:[[
  		{field:'itemid',width:80,title:'Item ID'}
		]]
    });
  
  var pager = $('#dg').datagrid().datagrid('getPager');	// get the pager of datagrid
	pager.pagination({
		buttons:[{
			iconCls:'icon-search',
			handler:function(){
				alert('search');
			}
		},{
			iconCls:'icon-add',
			handler:function(){
				alert('add');
			}
		},{
			iconCls:'icon-edit',
			handler:function(){
				alert('edit');
			}
		}]
	});		

  })
 </script>
  
	
  
  <body style="width:100%;height:98%;margin:0">
			<table id="dg" class="easyui-datagrid" title="Basic DataGrid" style="width:100%;height:100%;
			data-options="rownumbers:true,singleSelect:true,pagination:true,method:'get'">		
	</table>	
  </body>
</html>
