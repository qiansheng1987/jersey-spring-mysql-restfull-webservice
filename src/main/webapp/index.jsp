<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
	var bookRestUrl = "rest/bookmarks";
	function rest(restUrl, httpMethod, param, contenttype, datatype, callback) {
		alert("restUrl" + restUrl + " httpMethod:" + httpMethod + "  param" + param + " contentType:" + contenttype
		 + " datatype:" + datatype);
		$('#resultDiv').html("Loading...");

		//1.$.ajax带json数据的异步请求  
		$.ajax({
			url :restUrl,// 跳转到 action    
			data :param,
			contentType : contenttype,
			type:httpMethod,
			cache:false,
			dataType:datatype,
			success:function(data) {
				try {
					if (data === null || data === undefined) {
						$('#resultDiv').html("No result from server");
					} else {
						callback(data);
					}
				} catch (e) {
					$('#resultDiv').html(e);
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				 alert("XMLHttpRequest.status:" + XMLHttpRequest.status);
                 alert("XMLHttpRequest.readyState:" + XMLHttpRequest.readyState);
                 alert(textStatus);
				$('#resultDiv').html(errorThrown + " status=" + textStatus.status);
			}
		});
	}
	
	/*GET*/
	function getAllBook() {
		rest(bookRestUrl, 'GET', null, null, 'json', renderGetAll);
	}
	function getBookByQuery() {
		var url = $("#queryUrl").val();
		rest(bookRestUrl + url, 'GET', null, null, 'json', renderQueryGet);
	}
	function getBookByPath() {
		var url = $("#pathUrl").val();
		rest(bookRestUrl + url, 'GET', null, null, 'json', renderPathGet);
	}
	/*PUT*/
	function putBook() {
		var contentType = $("input[name='updateRadio']:checked").val();
		var putData;
		var idValue = $("#id").val();
		var nameValue = $("#putname").val();
		var descriptionValue = $("#description").val();
		var url = $("#puturl").val();
		if (contentType === "application/xml") {
			putData = "<book";
			putData += " id='" + idValue + "'";
			if (nameValue !== "") {
				putData += " name='" + nameValue + "'";
			}
			if (publisherValue !== "") {
				putData += " description='" + descriptionValue + "'";
			}
			
			if (url != "") {
				putData += " url='" + url + "'";
			}
			putData += "/>";
		} else {
			var book = new Object();
			book.id = idValue;
			if (nameValue !== "") {
				book.name = nameValue;
			}
			if (descriptionValue !== "") {
				book.description = descriptionValue;
			}
			if (url != "") {
				book.url = url;
			}
			putData = JSON.stringify(book);
		}
		rest(bookRestUrl + "/" + idValue, 'PUT', putData, contentType, 'json',
				renderPut);
	}
	/*POST*/
	function postBook() {
		var contentType = $("input[name='saveRadio']:checked").val();
		var postData;
		var nameValue = $("#name").val();
		var publisherValue = $("#insertdescription").val();
		var url = $("#url").val();
		if (contentType === "application/xml") {
			postData = "<book name='" + nameValue + "'/>";
		} else {
			postData = JSON.stringify({
				name : nameValue,
				description : publisherValue,
				url:url
			});
		}
		rest(bookRestUrl, 'POST', postData, contentType, 'json', renderPut);
	};
	/*DELETE*/
	function deleteBook() {
		var url = $("#delUrl").val();
		rest(bookRestUrl + url, 'DELETE', null, null, 'text', renderDelete);
	}
	/*Render DOM*/
	function renderGetAll(data) {
		var books = data.bookList.book;
		var result = "";
		for ( var i = 0; i < books.length; i++) {
			result += books[i].bookId + "-" + books[i].bookName + "-"
					+ books[i].publisher + "<br/>";
		}
		$('#resultDiv').html(result);
	}
	function renderQueryGet(data) {
		$('#resultDiv').html(
				"query result: " + data.bookId + "-" + data.bookName + "-"
						+ data.publisher);
	}
	
	
	function renderPathGet(data) {
		$('#resultDiv').html(
				"path result: " + data.id + "-" + data.name + "-" + data.description
						+ data.url);
	}
	function renderPut(data) {
		$('#resultDiv').html("DONE! name=" + data.name);
	}
	function renderDelete(data) {
		$('#resultDiv').html(data);
	}
</script>
  </head>
  
  <body>
    	<div id="resultDiv" style="border: 1px solid green;">测试结果</div>
	<h3>1 查询全部(没有分页功能)</h3>
	<input id="getButton3" type="button" value="GetAll"
		onclick="getAllBook();" />

	<h3>2 主键查询(query)</h3>
	<input type="text" id="queryUrl" name="queryUrl" value="/book?id=1"
		style="width: 200px" />
	<input id="getButton1" type="button" value="Get By Query"
		onclick="getBookByQuery();" />

	<h3>3 主键查询(path)</h3>
	<input type="text" id="pathUrl" name="pathUrl" value="/1"
		style="width: 200px" />
	<input id="getButton2" type="button" value="Get By Path"
		onclick="getBookByPath();" />

	<h3>4 更新</h3>
	<div>
		<p>
			book Id: <input type="text" id="id" name="id" /> book
			name: <input type="text" id="putname" name="name" />
			description: <input type="text" id="description" name="description" />
			url: <input type="text" id="puturl" name="url" />
		</p>
		<p>
			data format: <input id="jsonRadio0" type="radio" name="updateRadio"
				value="application/json" checked="checked" />json <input
				id="xmlRadio0" type="radio" name="updateRadio"
				value="application/xml" />xml
		</p>
		<input id="putButton" type="button" value="Update"
			onclick="putBook();" />
	</div>

	<h3>5 删除</h3>
	<div>
		<input type="text" id="delUrl" name="delUrl" value="/1"
			style="width: 200px" /> <input id="deleteButton" type="button"
			value="Delete" onclick="deleteBook();" />
	</div>

	<h3>6 新增</h3>
	<div>
		<p>
			book name: <input type="text" id="name" name="name" />
			description: <input type="text" id="insertdescription" name="description" />
			url: <input type="text" id="url" name="url" />
		</p>

		<p>
			data format: <input id="jsonRadio" type="radio" name="saveRadio"
				value="application/json" checked="checked" />json <input
				id="xmlRadio" type="radio" name="saveRadio" value="application/xml" />xml
		</p>
		<input id="createButton" type="button" value="Create"
			onclick="postBook();" />
	</div>
  </body>
</html>
