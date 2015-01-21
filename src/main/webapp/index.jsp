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
	dojo.require("dijit.form.TextBox");
	dojo.require("dijit.form.ValidationTextBox");
	dojo.require("dijit.form.Button");
	dojo.require("dijit.form.NumberSpinner");
	

	dojo.require("dtdg.foo.definedModel");
	
	//请求精灵模块
	dojo.require("dtdg.Genie");
</script>

<script type="text/javascript">
	$(function() {
		var handle = dojo.connect(dojo.byId("firstName"), "onclick", null,
				function(evt) {
					var context = {};
					dojo.setObject("com.example", "qiansheng", context);
					alert(context.com.example);
				});
	});
	
	/* function showDisplay() {
		var context = {};
		dojo.setObject("com.example.test", "qiansheng", context);
		alert(context.com.example.test);
	} */
	
	/* dojo.addOnLoad(function() {
		dojo.body.innerHTML = "gussess what? fibonacci(5) = " + dtdg.foo.definedModel.fibonacci(5);
		alert(dtdg.foo.definedModel.fibonacci(15));
	}); */
	
	/* dojo.addOnLoad(function() {
		var g = new dtdg.Genie();
		g.initialize();
	}); */
	
	//对象混入
	/* function Man() {
		this.x = 10;
	}
	
	function Myth() {
		this.y = 20;
	}
	
	function Legend() {
		this.z = 30;
	}
	
	var theMan = new Man();
	var theMyth = new Myth();
	var theLegend = new Legend();
	
	function mixObject() {};
	
	var minObjectInstance = new mixObject();
	
	dojo.mixin(minObjectInstance, theMan, theMyth, theLegend);
	
	function showDisplay() {
		alert(minObjectInstance.x + minObjectInstance.y + minObjectInstance.z);
	} */
	
	
	//部分应用参数
	/* function addThree(x, y, z) {
		alert(x + y + z);
	}
	
	//先应用两个参数
	f = dojo.partial(addThree, 100, 10);
	
	//然后再应用最后一个参数
	f = dojo.partial(f, 4);
	f(); */
	
	
	/* $(function() {
		for (var i=1; i<=7; i++) {
			var button = dojo.byId("button" + i);
			var handle = dojo.connect(button, "onclick", function(evt) {
				alert(i);
				dojo.disconnect(handle);
			}); 
		}
		
		for (var i=1; i<=7; i++) {
			(function() {
				var button = dojo.byId("button" + i);
				var current_i = i;
				var handle = dojo.connect(button, "onclick", 
					function(evt) {
						alert(current_i);
						dojo.disconnect(handle);
				});
			})();
		}
		
		
	});
	
	function a() {
		var i = 0;
		function b() {
			alert(++i);
		}
		return b;
	}
	var c = a();
	c();
	c(); */
	
	
	
	/********************发布订阅************************/
	/* function Foo(topic) {
		this.topic = topic;
		this.greet = function() {
			console.log("Hi, Im Foo");
			dojo.publish(topic);//Foo直接发布信息，但不针对某个具体的目标
		};
	}
	
	function Bar(topic) {
		this.topic = topic;
		this.greet = function() {
			console.log("Hi Im bar");
		};
		dojo.subscribe(topic, this, "greet");//订阅主题
	} 
	var foo = new Foo("/dtdg");
	var bar = new Bar("/dtdg");
	foo.greet();*/
	
	/**********json**********/
	/* var object = {a:1, b:2, c:3, d:4};
	var str = dojo.toJson(object, true)
	alert(str); */
	
	/* var d = new dojo.Deferred();
	d.addCallbacks(function() {
		console.log("the answer is : ", response);
		return response;
	});
	d.addCallbacks(function() {
		console.log("yes, indeed the answer is : ", response);
		return response;
	});
	d.addErrback(function() {
		console.log("an error occured: ", response);
		return response;
	}); */
	
	
	/* dojo.addOnLoad(function() {
		
		var d = dojo.xhrGet({
			url:"http://localhost:8080",
			timeout:500,
			load:function(response, inArgs) {
				console.log("Load response is: ", response);
				console.log("executing the callback chain now....");
				return response;
			},
			error:function(response, ioArgs) {
				console.log("Error!:", response);
				console.log("executing the errback chain now.....");
				return response;
			}
		});
		
		//添加几个回调函数
		d.addCallbacks(function() {
			console.log("the answer is : ", response);
			return response;
		});
		d.addCallbacks(function() {
			console.log("yes, indeed the answer is : ", response);
			return response;
		});
		d.addErrback(function() {
			console.log("an error occured: ", response);
			return response;
		});
		
	}); */
	
	dojo.addOnLoad(function() {
		var node = dojo.byId("refistration_form");
		var str = dojo.formToQuery(node);
		var strObject = dojo.formToObject(node);
		var json = dojo.formToJson(node);
		console.log(str);
		console.log(strObject);
		console.log(json);
	});
	
	/*$(function(){
          $.ajax({
		     url:"http://localhost:8090/Test/servlet/ProxyRequest?action=prox&callback=?",
		     dataType:'jsonp',
		     processData: false, 
		     type:'GET',
		     success:function(data){
		       alert(data.content);
		     },
		     error:function(XMLHttpRequest, textStatus, errorThrown) {
		       alert(XMLHttpRequest.status);
		       alert(XMLHttpRequest.readyState);
		       alert(textStatus);
		     }}); 
		     
	 });*/
	 
	 /* function Shape() {}
	 
	  dojo.extend(Shape, {
	 	centerX:12,
	 	centerY:34,
	 	color:"red"
	 });
	 
	 var s  = new Shape();
	 console.log(s.color + s.centerX + s.centerY);
	 
	 //定义子类
	 function Circle(centerX, centerY, color, radius) {
	 	this.base = Shape;
	 	this.base(centerX, centerY, color);
	 	this.radius = radius;
	 }
	 
	 Circle.prototype = new Shape();
	 
	 
	 
	 
	 
	 //创建实例
	 var c = new Circle(10, 20, "blue", 3);
	 
	 console.log("Circle: " + c.color + c.radius); */
	 
	 
	 /****************mixin********************/
	 /* var shape = {};//创建一个简单对象，作为混入的目标
	 var sh = dojo.mixin(shape,{
	 	centerX:3435,
	 	centerY:444,
	 	color:"orange"
	 });
	 console.log(sh.color);
	 
	 var rsh = dojo.mixin(shape, {
	 	radius:1234
	 });
	 
	 console.log("rsh: " + rsh.radius);
	 console.log("rsh: " + rsh.centerX); */
	 
	 
	 /*************通过委托实现继承**************/
	 /*
	 	读取radius属性时，由circle直接提供，因为该属性已经被混入其中了
	 	读取centerX， centerY， color属性时，则由被委托的shape提供，因为他们不在circle中
	 	读取其他属性则返回undeifned ，因为circle，shape中均不存在该属性
	 */
	 
	
	/*************base的dojo.declare模拟继承********************/
	
	//声明shapede构造函数
	/* dojo.declare(
		"Shape", //类型
		null, //没有超累，因为以null为占位符
		{
			//属性
			centerX:19,
			centerY:49,
			color:"blue",
			//执行new Shape时要调用的构造函数
			constructor:function(centerX, centerY, color) {
				this.centerX = centerX;
				this.centerY = centerY;
				this.color = color;
			}
		}
	);
	
	var s = new Shape(10, 20, "blue");
	console.log("dojo.declare: "  + s.color + "---" + s.centerX); */
	/*
		javascript函数的参数
		在许多的编程语言中，如果没有事先声明，都不能传递任意数量的参数
		但是在javascript中的函数可以接受任意个参数，如果接受的参数比声明的多，则会忽率多
		出来的参数，如果接受的参数比声明的少，那么缺少的参数的值就是javascript的一种类型：undefined
		
	*/
	
	
	//dojo.declare提供列外两种函数preamble和postscript
	//执行顺序为 preamble, constructor, postscript
	
	/* dojo.addOnLoad(function() {
		dojo.declare(
		"Foo",
		null,
		{
			preamble:function() {
				console.log("preamble: ", arguments);
			},
			constructor:function() {
				console.log("constructor: ", arguments);
			},
			postscript: function() {
				console.log("postscript: ", arguments);
			}
		}
		);
		
		var f = new Foo("asdfsdfasd");
	}); */
	
	
	
	
	
	/******************在子类中重写超类的方法************************/
	/* dojo.addOnLoad(function() {
		dojo.declare("Foo", null, {
			constructor: function() {
				console.log("Foo Constructor: ", arguments);
			},
			custom: function() {
				console.log("Foo custom ", arguments);
			}
		});
		
		dojo.declare("Bar", Foo, {
			constructor:function() {
				console.log("bar constructor: ", arguments);
			},
			custom: function() {
				//自动调用Foo的custom方法并传入相同的参数，如果有必要的话，当然可以修改参数
				this.inherited(arguments);
				//如果没有这条调用语句，Foo.custom将永远不会被调用
				console.log("Bar custom, " + arguments);
			}
		});
		
		var bar = new Bar(100);
		bar.custom(1,2,3,4);
	}); */
	
	
	/*******************多继承************************/
	dojo.addOnLoad(function() {
		dojo.declare("Tiger", null, {
			_name:null,
			_species:null,
			constructor: function(name) {
				this._name = name;
				this._species = "tiger";
				console.log("Created ", this._name, "the ", this._species);
			}
		});
		
		dojo.declare("Lion", null,{
			_name: null,
			_species: null,
			_zhangsan:null,
			constructor:function(name) {
				this._name = name;
				this._species = "lion444";
				console.log("Create ", this._name, "the ", this._species);
			}
		});
		
		dojo.declare("Liger", [Tiger,Lion], {
			_name: null,
			_species: null,
			_zhangsan:null,
			construtor: function(name, zhangsan) {
				this._name = name;
				this._species = "liger";
				this._zhangsan = zhangsan;
				console.log("Create ", this._name, "the ", this._species);
			}
		});
		
		var lucy = new Liger("Lucy");
		console.log(lucy);
	});
	 
	 
		
</script>
</head>

<body>
	just user the form below to sign-up for our great offers:
	<br />
	<br />
	<br />
	<form id="refistration_form" class="tundra">
			FirstName: <input type="text" maxlength="25" name="first" id="firstName"
			dojoType="dijit.form.TextBox" value="zhansan"/><br /> 
			lastName: <input type="text" value="san"
			maxlength="25" name="last" /><br /> email: <input type="text"
			maxlength="25" name="email" /><br />
		<button onclick="alert('Boor')">sign up!</button>
	</form>
	<button width="20" onclick="showDisplay();">ceshi</button>
	
	<div id="nodes">
		<button id="button1">button1</button>
		<button id="button2">button2</button>
		<button id="button3">button3</button>
		<button id="button4">button4</button>
		<button id="button5">button5</button>
		<button id="button6">button6</button>
	</div>
</body>
</html>


























