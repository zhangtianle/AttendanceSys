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
        	   //switch tabs
        	   //url=
        	    var content = '<iframe scrolling="auto" frameborder="0"  src="MyJsp.jsp" style="width:100%;height:100%;"></iframe>';    
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


<body style="margin:0">

	<!--layout-->
	<div class="easyui-layout" style="width:100%;height:100%;">

		<!--top-->
		<div data-options="region:'north'"
			style="height:30px;line-height:25px;color:#E7E7E7;font-size:14px;padding-left:35px;
      		border-top:1px solid #1D438B;background:url('image/top.jpg') repeat-x bottom;">考勤系统</div>
		<!-- left -->
		<div data-options="region:'west',split:false" title="West"
			style="width:15%;height:100%;">

			<!-- tree -->
			<!-- 
			<div class="easyui-panel" style="padding:5px">
				<ul class="easyui-tree">
					<li><span>后台管理</span>
						<ul>
							<li data-options="state:'closed'"><span>Photos</span>
								<ul>
									<li><span>Friend</span></li>
									<li><span>Wife</span></li>
									<li><span>Company</span></li>
								</ul></li>
							<li><span>Program Files</span>
								<ul>
									<li>Intel</li>
									<li>Java</li>
									<li>Microsoft Office</li>
									<li>Games</li>
								</ul></li>
							<li>index.html</li>
							<li>about.html</li>
							<li>welcome.html</li>
						</ul></li>
				</ul>
			</div> -->
			<div class="easyui-panel" style="height:100%">
		  <ul id="tree" class="easyui-tree" data-options="method:'get',animate:true,lines:true"></ul>
	    </div>
		</div>

		<!-- main -->

		<div data-options="region:'center'" style="width:85%;height:100%;">
		
		<!-- tabs -->

			<div id="frame" class="easyui-tabs" style="width:100%;height:100%">
			<div  title="我的主页" style="background-repeat:no-repeat;
			background-color:rgb(43,110,154);background-position: 150px 150px;height:100%;width:100%">
			123
			123
			123
			123
			123
			</div>
			</div>
			
		</div>
		

        <!-- footer -->
		<div data-options="region:'south',split:false" style="height:50px;text-align:center" >
		<P>
			<br />Copy Right@2015  睿廓思工作室
		</P>
		</div>	
		
</body>
</html>
