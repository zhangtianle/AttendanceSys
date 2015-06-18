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
	
  
  <body style="width:100%;height:98%;margin:0">
  <table id="dg" class="easyui-datagrid" title="Custom DataGrid Pager" style="width:100%;height:97%"
			data-options="singleSelect:true,pagination:true,method:'get'">
			
			<thead>
			<tr>
				<th data-options="field:'name',width:80">姓名</th>
				<th data-options="field:'cardID',width:100">卡号</th>
				<th data-options="field:'op',width:80,align:'right'">操作</th>
				
			</tr>
		</thead>
	</table>	
	  <script type="text/javascript">
      
  $(function(){
	    
	    $('#dg').datagrid({
	        url:'getstuinfo.do',
	        pagination: true,
	        rownumbers: true,
	        pageNumber:1,
	        columns: [[
	                   { field: 'name', title: '姓名', width: 100 },
	                   { field: 'cardID', title: '卡号', width: 100 },
	                   { field: 'op', title: '操作', width: 100 },
	                  ]], 
	        pageSize:10,
	        pageList: [5,10,15,20],
	        
	   });

	    var p = $('#dg').datagrid('getPager');
	    $(p).pagination({
	        beforePageText: '第',//页数文本框前显示的汉字 
	        afterPageText: '页    共 {pages} 页',
	        displayMsg: '共{total}条数据',
	    }); 
	    
     
	    $('#dg').datagrid({
	    	columns: [[
	                   { field: 'name', title: '姓名', width: 100 },
	                   { field: 'cardID', title: '卡号', width: 100 },
	                   { field: 'op', title: '操作', width: 100 },
	                  ]]
	    	}
	    );
        dg.datagrid('getPager').pagination({
            layout:['list','sep','first','prev','sep',$('#p-style').val(),'sep','next','last','sep','refresh']
        });
 
  })
 </script>
  
	
  </body>
</html>
