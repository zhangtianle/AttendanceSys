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

  </head>
  
  <body>
<form >
    <table >
    <tr>
    <td>姓名：</td><td><input type="text" id="name" value="" /></td>
    </tr>
    <tr>
    <td>卡号:</td><td><input type="text" id="name" value="" /></td>
    </tr>
    <tr>
    <td> 联系电话: </td><td><input type="text" id="name" value="" /></td>
    </tr>
	<input type="hidden" id="id" value="" />
    </table>
    <input type="button" value="修改" id="submit" onclick="return upcfm()"/>
    <input type="button" value="返回" id="back"   onclick="return back()"/>
    </form>
  </body>
  
  <script type="text/javascript">
  function upcfm() {
	if (!confirm("确认要删除？")) {
        //window.event.returnValue = false;
        return false;
    } 
	window.location.href = 'update.do';
	
}
  
  function back() {
	window.location.href = document.referrer;

}
</script>
</html>
