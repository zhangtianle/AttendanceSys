<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'msg.jsp' starting page</title>
    
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
    <table>
    <tr >
    <td>输入短信内容(%%):</td>
    <td style="width:100px"></td>
    <td>预览</td>
    </tr >
    <tr>
    <td><textarea id="input" style="height:150px;width:350px" >${msg}</textarea></td>
    <td style="width:100px"></td>
    <td><textarea id="preview" disabled style="height:150px;width:350px"></textarea></td>
    </tr>
    <tr>
    <td><button onclick="pre()">预览</button> <button onclick="update()">提交</button></td>
    </tr>
    </table>
    
  </body>
  
  <script type="text/javascript">
  function pre(){
	 var a= document.getElementById('preview');
	 var b= document.getElementById('input');
	 var str = b.value
	 var l = str.indexOf("%");
     
     var before = str.substr(0, l);
     var after = str.substr(l+1,str.length);
     str = before+'name'+after
	 a.value=str;
  }
  
  function update(){
	  
	  var b= document.getElementById('input');
		 str = b.value
		 var l = str.indexOf("%");
	     var before = str.substr(0, l);
	     var after = str.substr(l+1,str.length);
	     str = [{"msg":before+after}];
	    	    
	     $.ajax({
				url : "msgUpdate.do",
				type : "post",
				dataType : 'json',
				contentType : 'application/json',
				data : JSON.stringify(str),
				//data:str,
				success : function() {
						alert("success");
				}
			});
	     
	     
  }
  
  
  
  </script>
</html>
