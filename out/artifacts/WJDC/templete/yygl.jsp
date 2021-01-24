<%@page import="bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>Insert title here</title>

</head>
<body>
<div>
    <table class="table table-hover table-striped table-bordered table-sm" id="resultshow">
        <tr align="center">
            <td><a href="./templete/addUser.jsp" >添加用户</a></td>
        </tr>
        <tr>
            <th>用户名</th>
            <th>密码</th>
            <th>姓名</th>
            <th>身份证号</th>
            <th>通讯地址</th>
            <th>邮政编码</th>
            <th>固定电话</th>
            <th>移动电话</th>
            <th>电子信箱</th>
            <th>用户状态</th>
            <th>操作</th>
            <th>操作</th>
            <th>操作</th>
        </tr>
        <%ArrayList<User> list=(ArrayList<User>)request.getAttribute("list");%>
        <c:forEach var="l" items="<%=list %>" varStatus="i">
            <tr>
                <td>${l.getUsername() }</td>
                <td>${l.getPassword() }</td>
                <td>${l.getName() }</td>
                <td>${l.getSfzh() }</td>
                <td>${l.getTxdz() }</td>
                <td>${l.getYzbm() }</td>
                <td>${l.getGddh() }</td>
                <td>${l.getYddh() }</td>
                <td>${l.getDzxx() }</td>
                <td id="status${l.getUsername() }">${l.getStatus() }</td>
                <td><a href="#" onclick="edit(${l.getUsername()})">编辑</a></td>
                <td><a href="getAllUser" onclick="pause(${l.getUsername()},${l.getStatus()})">暂停\释放</a></td>
                <td><a href="" onclick="deleteitem(${l.getUsername()})">删除</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    function edit(username)
    {
        window.location="editUserInfo?username="+username;
    }
    function pause(username,status)
    {
        var msg ="确认暂停/释放 此用户权限？";
        if (confirm(msg)==true){
            var method="pause";
            $.post(
                "users_do",
                {
                    method:method,
                    username:username,
                    status:status,
                },
                function(data)
                {
                    if(data=="no")
                        alert("操作失败！");
                    else
                    {
                        alert("操作成功！");
                    }
                },
                "text"
            );
        }
    }
    function deleteitem(username)
    {
        var msg ="确认删除？";
        if (confirm(msg)==true){
            var method="delete";
            $.post(
                "users_do",
                {
                    method:method,
                    username:username
                },
                function(data)
                {
                    if(data=="no")
                        alert("操作失败！");
                    else
                    {
                        alert("删除成功！");
                        //window.location="getAllUser";
                    }
                },
                "text"
            );
        }
    }

    function editPermission(i)
    {
        var id=$("#id"+i).text();
        window.location="editPermission?id="+id;
    }
</script>
</html>