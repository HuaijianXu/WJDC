<%@page import="java.util.ArrayList"%>
<%@ page import="bean.Dcwj" %>
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
    <style>
        .form-group{
            width:35%;
            float:left;
            margin-left:10px;
            margin-top:10px;
        }
        label{
            width:30%;
            float:left;
            margin-right:5px;
            margin-top:5px;
        }
        .form-control{
            width:60%;
        }
        .btn{
            width:100px;
            height:40px;
            border:0px;
            border-radius:5px;
            background-color: lightblue;;
            color:black;
            margin-left:20px;
            margin-top:10px
        }
    </style>
</head>
<%
    Object message = request.getAttribute("message");
    if(message!=null && !"".equals(message)){
%>
<script type="text/javascript">
    alert("<%=request.getAttribute("message")%>");
</script>
<%} %>
<script>
    i = 1;
    function insert() {
        if (i<17){
            i++;
            var newtr = tbl.insertRow();
            var newTd0 = newtr.insertCell();
            var newTd1 = newtr.insertCell();
            var newTd2 = newtr.insertCell();
            var newTd3 = newtr.insertCell();
            newTd0.innerHTML="<select id='xuanze"+i+"'name='xuanze'>" +
                "<option value='and'>并列</option>" +
                "<option value='or'>或</option>" +
                "<option value='not'>不含</option> "+
                "</select>";
            newTd1.innerHTML="<select id='type"+i+"'name='type'>" +
                "<option value='jgmc'>机构全称</option>" +
                "<option value='gkdw'>归口单位</option>" +
                "<option value='szdy'>所在单位</option>" +
                "<option value='frdb'>法人代表</option>" +
                "<option value='lxr'>联系人</option>" +
                "<option value='jgsx'>机构属性</option>" +
                "<option value='jsxqmc'>技术需求名称</option>" +
                "<option value='gjz'>关键字</option>" +
                "<option value='jhztz'>拟投入资金总额</option>" +
                "<option value='jsxqhzms'>技术需求解决方式</option>" +
                "<option value='yjlx'>科技活动类型</option>" +
                "<option value='xkfl'>学科分类</option>" +
                "<option value='xqjsssly'>需求技术所属领域</option>" +
                "<option value='xqjsyyhy'>需求技术应用行业</option>" +
                "<option value='glcs'>管理处室</option>" +
                "<option value='xssh'>形式审核是否通过</option>" +
                "<option value='bmsh'>部门审核是否通过</option>" +
                ">";
            newTd2.innerHTML="<input type='text' id='text"+i+"'name='text'>";
            newTd3.innerHTML="<select id='cipin"+i+"'name='cipin'>" +
                "<option value='='>精确</option>" +
                "<option value='like'>模糊</option>" +
                ">";
        }
    }
    function deltr() {
        if (i!=1){
            tbl.deleteRow(i-1);
            i--;
        }
    }
</script>
<body>
<form action="SearchWj?method=wjgl_user" method="post">
    <table id="tbl">
        <tr>
            <td>
                <select id="xuanze1" name="xuanze">
                <option value='and'>并列</option>
                <option value='not'>不含</option>
                </select>
            </td>
            <td>
                <select id='type1'name='type'>
                    <option value='jgmc'>机构全称</option>
                    <option value='gkdw'>归口单位</option>
                    <option value='szdy'>所在单位</option>
                    <option value='frdb'>法人代表</option>
                    <option value='lxr'>联系人</option>
                    <option value='jgsx'>机构属性</option>
                    <option value='jsxqmc'>技术需求名称</option>
                    <option value='gjz'>关键字</option>
                    <option value='jhztz'>拟投入资金总额</option>
                    <option value='jsxqhzms'>技术需求解决方式</option>
                    <option value='yjlx'>科技活动类型</option>
                    <option value='xkfl'>学科分类</option>
                    <option value='xqjsssly'>需求技术所属领域</option>
                    <option value='xqjsyyhy'>需求技术应用行业</option>
                </select>
            </td>
            <td>
                <input type='text' id='text1'name='text'>
            </td>
            <td>
                <select id='cipin1' name='cipin'>
                    <option value='='>精确</option>
                    <option value='like'>模糊</option>
                </select>
            </td>
        </tr>
        <input type="button" onclick="insert()" class="btn" value="添加">
        <input type="button" onclick="deltr()" class="btn" value="删除">
        <input type="submit" class="btn" value="查询">
    </table>
</form>
<div>
    <table class="table table-hover table-striped table-bordered table-sm" id="resultshow">
        <tr>
            <th>需求名称</th>
            <th>机构名称</th>
            <th>审核状态</th>
            <th>操作</th>
            <th>操作</th>
        </tr>
        <%ArrayList<Dcwj> list=(ArrayList<Dcwj>)request.getAttribute("list");%>
        <c:forEach var="l" items="<%=list %>" varStatus="i">
            <tr>
                <td><a href="showWj?id=${l.getWjid()}">${l.getJsxqmc() }</a></td>
                <td>${l.getJgmc() }</td>
                <td id="status${i.index+1 }"><c:if test="${l.getSfsh()==-1}"> 未审核 </c:if><c:if test="${l.getSfsh()==0}"> 形式审核未通过 </c:if><c:if test="${l.getSfsh()==1&&l.getBmsfsh()==-1}"> 形式审核已通过 </c:if><c:if test="${l.getBmsfsh()==0}"> 部门审核未通过 </c:if><c:if test="${l.getBmsfsh()==1}"> 已通过 </c:if></td>
                <td><a href="#" onclick="edit(${l.getWjid()},${i.index+1})">编辑</a></td>
                <td><a href="" onclick="deleteitem(${l.getWjid()},${i.index+1})">删除</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    function edit(wjid,index)
    {
        var status=$("#status"+index).text();
        if(status.trim()=="未审核")
        {
            window.location="editWjInfo?wjid="+wjid;
        }
        else
        {
            alert("问卷已被审核，不能进行修改！");
        }
    }
    function deleteitem(wjid,index)
    {
        var status=$("#status"+index).text();
        if(status.trim()=="未审核")
        {
            var msg ="确认删除吗？";
            if (confirm(msg)==true){
                $.post(
                    "deleteWj",
                    {
                        wjid:wjid
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
        else
        {
            alert("问卷已被审核，不能删除！");
        }
    }
</script>
</html>