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

<title>My JSP 'index.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="dojo-release-1.10.3/dojo-release-1.10.3/dijit/themes/tundra/tundra.css" />
<link rel="stylesheet" type="text/css"
	href="dojo-release-1.10.3/dojo-release-1.10.3/dojo/resources/dojo.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="dojo-release-1.10.3/dojo-release-1.10.3/dojo/dojo.js.uncompressed.js"
	djConfig="parseOnLoad:true, isDubug:true">
</script>
<script type="text/javascript">
	dojo.require("dojo.parser");
	dojo.require("dijit._Widget");
</script>
<script type="text/javascript">
	dojo.addOnLoad(function() {
		dojo.declare("dtdg.Foo", dijit._Widget, {
			constructor: function() {
				console.log("constructor");
			},
			postMixInProperties:function() {
				console.log("postMixInProperties");
			},
			postCreate: function() {
				console.log("postCreate");
			},
			//自定义逻辑
			talk:function() {
				console.log("I am alive!");
			},
			uninitialize: function() {
				console.log("uninitialize");
			}
		});
		
		var foo = dtdg.Foo();
		foo.talk();
		foo.destroyRecursive();
	});
</script>
</head>
<body class="tundra">
	<form>
		<input id="foo"/>
	</form>
</body>
</html>


























