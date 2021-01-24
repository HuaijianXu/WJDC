<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="widtr=device-widtr, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>Insert title here</title>
</head>
<%
    String username = (String) session.getAttribute("user");
    String jgmc = (String) session.getAttribute("jgmc");
    String sfzh = (String) session.getAttribute("sfzh");
    String name = (String) session.getAttribute("name");
    String txdz = (String) session.getAttribute("txdz");
    String yzbm = (String) session.getAttribute("yzbm");
    String gddh = (String) session.getAttribute("gddh");
    String yddh = (String) session.getAttribute("yddh");
    String dzxx = (String) session.getAttribute("dzxx");
%>
<body>
<div>
    <form action="" method="post">
        <table class="table table-hover table-striped table-bordered table-sm">
            <tr>
                <td>用户名</td>
                <td><input type="text" name="username" value="<%=username%>"></td>
            </tr>
            <tr>
                <td>姓名</td>
                <td><input type="text" name="name" value="<%=name%>"></td>
            </tr>
            <tr>
                <td>身份证号</td>
                <td><input type="text" name="sfzh" readonly="readonly" value="<%=sfzh%>"></td>
            </tr>
            <tr>
                <td>通讯地址</td>
                <td><input type="text" name="txdz" value="<%=txdz%>"></td>
            </tr>
            <tr>
                <td>邮政编码</td>
                <td><input type="text" name="yzbm" value="<%=yzbm%>"></td>
            </tr>
            <tr>
                <td>固定电话</td>
                <td><input type="text" name="gddh" value="<%=gddh%>"></td>
            </tr>
            <tr>
                <td>移动电话</td>
                <td><input type="text" name="yddh" value="<%=yddh%>"></td>
            </tr>
            <tr>
                <td>电子信箱</td>
                <td><input type="text" name="dzxx" value="<%=dzxx%>"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>