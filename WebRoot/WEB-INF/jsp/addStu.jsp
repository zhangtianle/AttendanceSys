<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'manager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript"
		src="js/jquery-easyui-1.4.2/jquery.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>

  </head>
  
  <body>
<form id="form1" >
    <table >
    <tr>
    
    `
    </table>
    <input type="button" value="添加" id="tj" onclick=" return upcfm()"/>
   
    <input type="button" name="button1" id="button1" value="返回" onclick="history.go(-1)"/>
</form>
  </body>
  
  <script type="text/javascript">
  function upcfm() {
	var student = {};
	var form = document.getElementById("form1");
	student.id = form.id.value;
	student.name = form.name.value;
	student.cardID = form.cardID.value;
	student.phone = form.phone.value;
	student.pname = form.pname.value;
	student.period = form.period.value;
	
	
	if (form.name.value ==null||form.name.value=="")
	  {alert("姓名不能为空");return false}
	if (form.cardID.value ==null||form.cardID.value=="")
	  {alert("卡号不能为空");return false}
	if (form.pname.value ==null||form.pname.value=="")
	  {alert("家长姓名不能为空");return false}
	if (form.phone.value ==null||form.phone.value=="")
	  {alert("电话不能为空");return false}
	if (form.period.value ==null||form.period.value=="")
	  {alert("剩余学时不能为空");return false}
	
	$.ajax({

		// 请求到某个servlet或者其它
		url : "addStu.do",
		// 传送的方式
		type : "post",
		// 传送数据
		contentType : 'application/json',
		data : JSON.stringify(student),
		success : function() {
			alert("添加成功");
		}
	});
	
		    	
}
  

</script>
</html>
