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
<%
    Object message = request.getAttribute("message");
    if(message!=null && !"".equals(message)){
%>
<script type="text/javascript">
    alert("<%=request.getAttribute("message")%>");
</script>
<%} %>
<body>
<div>
    <table class="table table-hover table-striped table-bordered table-sm" id="resultshow">
        <tr>
            <th>用户名</th>
            <th>姓名</th>
            <th>角色</th>
            <th>操作</th>
        </tr>
        <%ArrayList<User> list=(ArrayList<User>)request.getAttribute("list");%>
        <c:forEach var="l" items="<%=list %>" varStatus="i">
            <tr>
                <td>${l.getUsername() }</td>
                <td>${l.getName() }</td>
                <td>
                    <input type="radio" name="powerid${l.getUsername()}" value="2" <c:if test="${l.getPowerid()==2}"> checked="checked"</c:if>>形式审核员
                    <input type="radio" name="powerid${l.getUsername()}" value="3" <c:if test="${l.getPowerid()==3}"> checked="checked"</c:if>>部门审核员
                    <input type="radio" name="powerid${l.getUsername()}" value="4" <c:if test="${l.getPowerid()==4}"> checked="checked"</c:if>>普通用户
                </td>
                <td>
                    <a href="#" onclick="edit(${l.getUsername()})">确认</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    function edit(username) {
        var arr = document.getElementsByName("powerid"+username);
        var powerid;
        for (var i = 0;i<arr.length;i++)
            if (arr[i].checked)
                powerid=arr[i].value;
        window.location="PowerManage?method=edit_role&username="+username+"&powerid="+powerid;
    }
</script>
</html>