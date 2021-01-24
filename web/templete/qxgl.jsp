<%@page import="bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="bean.Power" %>
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
            <th>角色</th>
            <th>需求征集权限</th>
            <th>需求管理权限</th>
            <th>用户信息权限</th>
            <th>用户修改权限</th>
            <th>形式审核权限</th>
            <th>部门审核权限</th>
            <th>统计查询权限</th>
            <th>操作</th>
        </tr>
        <%ArrayList<Power> list=(ArrayList<Power>)request.getAttribute("list");%>
        <c:forEach var="l" items="<%=list %>" varStatus="i">
            <tr hidden="hidden">
                <td><input type="text" name="powerid" value="${l.getPowerid()}"></td>
            </tr>
            <tr hidden="hidden"></tr>
            <tr>
                <td>${l.getStatus() }</td>
                <td>
                    <input type="checkbox" name="power${l.getPowerid() }" value="0" <c:if test="${l.getXqzj_qx()==0}"> checked="checked"</c:if>>
                </td>
                <td>
                    <input type="checkbox" name="power${l.getPowerid() }" value="0" <c:if test="${l.getXqgl_qx()==0}"> checked="checked"</c:if>>
                </td>
                <td>
                    <input type="checkbox" name="power${l.getPowerid() }" value="0" <c:if test="${l.getYhxx_qx()==0}"> checked="checked"</c:if>>
                </td>
                <td>
                    <input type="checkbox" name="power${l.getPowerid() }" value="0" <c:if test="${l.getYhxg_qx()==0}"> checked="checked"</c:if>>
                </td>
                <td>
                    <input type="checkbox" name="power${l.getPowerid() }" value="0" <c:if test="${l.getXssh_qx()==0}"> checked="checked"</c:if>>
                </td>
                <td>
                    <input type="checkbox" name="power${l.getPowerid() }" value="0" <c:if test="${l.getBmsh_qx()==0}"> checked="checked"</c:if>>
                </td>
                <td>
                    <input type="checkbox" name="power${l.getPowerid() }" value="0" <c:if test="${l.getTjcx_qx() ==0}"> checked="checked"</c:if>>
                </td>
                <td>
                    <a href="#" onclick="edit(${l.getPowerid()})">确认</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    function edit(powerid) {
        var arr = document.getElementsByName("power"+powerid);
        var power = new Array();
        for (var i=0;i<arr.length;i++)
        {
            if (arr[i].checked)
            {
                power[i]=arr[i].value;
            }
            else{
                power[i]=-1;
            }
        }
        window.location="PowerManage?method=edit_power&powerid="+powerid+"&power="+power;
    }
</script>
</html>