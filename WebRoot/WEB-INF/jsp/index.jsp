<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<script type="text/javascript">
$(function() {

	//tree setting
	$('#tree').tree({
		url:'tree_data.json',
		onSelect: addTab,
		
    })

    function addTab(node){
		   if ($('#frame').tabs('exists',node.text)) {
               $('#frame').tabs('select', node.text);
           } else {
        	   url = "";
        	   //switch tabs
        	   if(node.text=="考勤后台管理") return ;
        	   if(node.text=="学生信息管理") url="stulist";
        	   if(node.text=="打卡信息管理") url="gtattinfo";
        	   if(node.text=="短信编辑") url="msg";
        	   if(url=="") return;
        	    var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'.do" style="width:100%;height:100%;"></iframe>';    
		$('#frame').tabs('add',{
			title: node.text,
			selected: true,
			closable:true,
			content:content

		
		});
          }
	}
	
	$('#frame').tabs({
		onSelect:updateTab
		
	})
	function updateTab(tilte){
		var tab = $('#frame').tabs('getSelected');
	} 
});
</script>
</head>


<body style="margin:0;height:100%">

	<!--layout-->
	<div class="easyui-layout" style="width:100%;height:100%;">

		<!--top-->
		<div data-options="region:'north'"
			style="height:30px;line-height:25px;color:#E7E7E7;font-size:14px;padding-left:35px;
      		border-top:1px solid #1D438B;background:url('image/top.jpg') repeat-x bottom;">考勤系统</div>
		
		<!-- left -->
		<div data-options="region:'west',split:false"  style="width:15%;height:100%;">
			<div class="easyui-panel" style="height:100%">
		      <ul id="tree"  data-options="method:'get',animate:true,lines:true"></ul>
	        </div>
		</div>

		<!-- main -->
		<div data-options="region:'center'" style="width:85%;height:100%;">
		
		<!-- tabs -->
			<div id="frame"  style="width:100%;height:100%">
			<div title="我的主页" style="width:100%;height:100%">
			<iframe style="background:url('image/index.jpg') no-repeat;background-position: 250px 200px;background-color:rgb(43,110,154);height:100%;width:100%"></iframe>
			</div>
			</div>
			</div>
		

        <!-- footer -->
		<div data-options="region:'south',split:false" style="height:50px;text-align:center"  >
		<P>
			Copy Right@2015  睿廓思工作室
		</P> 
		</div>	
		
</body>
</html>
