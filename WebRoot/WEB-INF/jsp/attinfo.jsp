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
	  
  <body style="width:100%;height:98%;margin:0;padding:1px">
	
	<div id="tb" style="height:auto;margin:0";background-color:"#CCC">
		<a href="addStu.do" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" >新增学生</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="return delscfm()">删除</a>
		  <div id="search" style="padding:2px;font-size:12px;">
    	<span>学生姓名:</span><input id="name" style="line-height:20px;border:1px solid #ccc">&nbsp;&nbsp;&nbsp;&nbsp;
    	<span>卡号:</span><input id="cardID" style="line-height:20px;border:1px solid #ccc">
    	<a href="javascript:void(0)" class="easyui-linkbutton" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch()">Search</a>
    	
    	            
    </div>  
    </div>
  <table id="dg"  style="width:100%;height:100%" data-options="method:'get',toolbar:'#tb'"></table>	
  
 </body>
	  <script type="text/javascript">
      
  $(function(){
	    
	    $('#dg').datagrid({
	        url:'getattinfo.do',
	        pagination: true,
	        rownumbers: true,
	        pageNumber:1,
	        columns: [[
					  { field:'ck',checkbox:true},
	                   { field: 'name', title: '姓名', width: 100,align:'center'},
	                   { field: 'cardID', title: '卡号', width: 100,align:'center'},
	                   { field: 'op', title: '操作', width: 100,align:'center'},
	                  ]], 
	        pageSize:10,
	        pageList: [5,10,15,20],
	        singleSelect:false,  //支持多选
	        
	        /*rowStyler:function(index){
				if (index%2==0){
					return 'background-color:#CCC';
				}
				},*/
	        
	   });
	    
	    var p = $('#dg').datagrid('getPager');
	    $(p).pagination({
	        beforePageText: '第',//页数文本框前显示的汉字 
	        afterPageText: '页    共 {pages} 页',
	        displayMsg: '共 {total} 条数据',
	    }); 
	    
	   
	  
	   
 
 
  })
  
 function delcfm() {
      if (!confirm("确认要删除？")) {
          window.event.returnValue = false;
          //return false;
      }
  }
  
  function delscfm(){ 
	  if (!confirm("确认要删除？")) {
          window.event.returnValue = false;
      }
  
      var rows = $('#dg').datagrid('getChecked');
      if(rows.length == 0){
    	  alert("没有选中的学生")
    	  window.event.returnValue = false;
      }
      
      var stus = [];
      for(var i=0; i<rows.length; i++){
      	str= rows[i].op;
      	var l = str.indexOf("?")+7;
      	var d =str.substr(l, 1);
      	if(str.substr(l+1, 1)!='"'){
        	d  = d+''+str.substr(l+1, 1);      		
      	
      	}
      	
      	var stu ={"name":rows[i].name,"cardID":rows[i].cardID,"id":d};
      	stus.push(stu);
      	
      }
  	
      
      $.ajax({

			url : "dels.do",
			type : "post",
			dataType : 'json',
			contentType : 'application/json',
			data : JSON.stringify(stus),
			success : function(data) {
				//$.ligerDialog.alert(data.update, function() {
					// 修改成功返回查看页面
					//back();
					alert("success");

				

			}
		});
				
 }
      
  function doSearch(){
  	$('#dg').datagrid('load',{
  		name: $('#name').val(),
  		cardID: $('#cardID').val()
  	});
  }
  
  
 </script>
  
	
  
</html>
