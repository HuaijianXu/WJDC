<%@page import="bean.Dcwj"%>
<%@page import="java.util.ArrayList"%>
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
    <nav class="navbar navbar-expand-sm bg-light">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="shownotChecked()">待审核&nbsp;&nbsp;&nbsp;</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="showChecked()">已审核</a>
            </li>
        </ul>
    </nav>
</div>
<div>
    <table class="table table-hover table-striped table-bordered table-sm">
        <tr>
            <th>需求名称</th>
            <th>机构名称</th>
            <th>审核结果</th>
            <th>操作</th>
        </tr>
        <%ArrayList<Dcwj> list=(ArrayList<Dcwj>)request.getAttribute("list"); %>
        <c:forEach var="l" items="<%=list %>" varStatus="i">
            <tr>
                <td>${l.getJsxqmc()}</td>
                <td>${l.getJgmc() }</td>
                <td id="status${i.index+1 }"><c:if test="${l.getSfsh()==-1}"> 未审核 </c:if><c:if test="${l.getSfsh()==0}"> 未通过 </c:if><c:if test="${l.getSfsh()==1}"> 已通过 </c:if></td>
                <td><a href="#" onclick="docheck(${i.index+1},${l.getWjid()})">审核</a></td>
            </tr>
        </c:forEach>
    </table>

</div>
</body>
<script>
    function shownotChecked()
    {
        window.location="${pageContext.request.contextPath}/checkDoc?type=notchecked";
    }
    function showChecked()
    {
        window.location="${pageContext.request.contextPath}/checkDoc?type=checked"
    }
    function docheck(index,id)
    {
        var status=$("#status"+index).text();
        if(status.trim()=="未审核")
        {
            window.location="${pageContext.request.contextPath}/doCheck?id="+id;
        }
        else
        {
            alert("不具备审核权限或已经审核！");
        }
    }
</script>
</html>