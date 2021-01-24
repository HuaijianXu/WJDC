<%@page import="bean.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
 <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
 <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<script>
	function checkGzdw(){
		var gzdw = document.getElementById("input_gzdw").value;
		if(gzdw =='' || typeof(gzdw) == 'undefined' ){
			var span = document.getElementById("spanGzdw");
			span.innerText="工作单位必填"
			span.style.color="red";
			return false;
		}
		else
		{
			var span = document.getElementById("spanGzdw");
			span.innerText="";
		}
	}
	//禁止输入特殊字符
	function changed(str){
		var name = $("input[name="+str+"]").val();
		var pattern = new RegExp("[`~!#$^&*()=|{}':;',\\[\\].<>/?~！#￥……&*（）——|{}【】‘；：”“'。，、？%]");
		if(name == ""){
			return;
		}
		if(name.match(pattern)){
			alert("请不要输入特殊字符!");
			$("input[name="+str+"]").val("");
		}
		return;
	}
</script>
<body>
	<div>
		<div>
			<%User user=(User)request.getAttribute("user"); %>
			<table>
				<tr>
					<td><span style="color: red">*</span>工作单位</td>
					<td>
						<input type="text" name="gzdw" value="" id="input_gzdw" onblur="checkGzdw()" oninput="changed('gzdw')"><span id="spanGzdw"></span>
					</td>
				</tr>
				<tr>
					<td><span style="color: red">*</span>姓名</td>
					<td><input type="text" name="name" value="<%=user.getName()%>" id="name" oninput="changed('name')">请填写真实姓名以便联系您</td>
				</tr>
				<tr>
					<td><span style="color: red">*</span>身份证号</td>
					<td><input type="text" name="sfzh" value="<%=user.getSfzh()%>" onblur="checkSfzh()"id="input_sfzh"><span id="spanSfzh"></span></td>
				</tr>
				<td>性别</td>
				<td>
					<input type="radio" name="sex" value="男">男<input type="radio" name="sex" value="女">女
				</td>
				<tr>
					<td>通讯地址</td>
					<td>
						<input type="text"name="txdz" id="txdz" value="<%=user.getTxdz()%>" oninput="changed('txdz')">
					</td>
				</tr>
				<tr>
					<td>邮政编码</td>
					<td>
						<input type="text" name="yzbm" value="<%=user.getYzbm()%>" id="yzbm">
					</td>
				</tr>
				<tr>
					<td>手机</td>
					<td>
						<input type="text"name="yddh" value="<%=user.getYddh()%>" id="yddh">
					</td>
				</tr>
				<tr>
					<td>固定电话</td>
					<td>
						<input type="text"name="gddh" value="<%=user.getGddh()%>" id="gddh">
					</td>
				</tr>
				<tr>
					<td>电子信箱</td>
					<td>
						<input type="text"name="dzxx" value="<%=user.getDzxx()%>" id="dzxx">
					</td>
				</tr>
				<tr>
					<input type="button" class="btn" value="确定修改" onclick="update()">
				</tr>
			</table>
		</div>
	</div>
</body>
<script>
	function update()
	{
		var username=<%=user.getUsername()%>;
		var gzdw=$("#input_gzdw").val();
		var name=$("#name").val();
		var sfzh=$("#input_sfzh").val();
		var txdz = $("#txdz").val();
		var yzbm = $("#yzbm").val();
		var yddh = $("#yddh").val();
		var gddh = $("#gddh").val();
		var dzxx = $("#dzxx").val();
		if(username=="")
			alert("请将空信息填写完整！");
		else
		{
			var msg ="确认修改？"; 
			if (confirm(msg)==true){
				$.post(
					"updateUserInfo",
					{
						username:username,
						gzdw: gzdw,
						name: name,
						sfzh: sfzh,
						txdz: txdz,
						yzbm: yzbm,
						yddh: yddh,
						gddh: gddh,
						dzxx: dzxx
					},
					function(data)
					{
						if(data=="yes")
						{
							alert("修改成功！");
							window.location="getAllUser";
						}
						else
							alert("操作失败！");
					}
				);
			}
			else{
				alert("操作取消！");
			}
		}
	}
</script>
</html>