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
    <script src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
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
            background-color:lightblue;
            color:black;
            margin-left:20px;
            margin-top:10px
        }
    </style>
</head>
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
<form action="${pageContext.request.contextPath}/SearchWj?method=tongji" method="post">
    <table id="tbl">
        <tr>
            <td>
                <select id="xuanze1" name="xuanze">
                    <option value='and'>并列</option>
                    <option value='not'>不含</option>
                </select>
            </td>
            <td>
                <select id='type1' name='type'>
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
                <input type='text' id='text1' name='text'>
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
        <input type="button" onclick="show('szdy')" class="btn" value="所在地域">
        <input type="button" onclick="show('yjlx')" class="btn" value="研究类型">
        <input type="button" onclick="show('glcs')" class="btn" value="管理处室">
    </table>
</form>
<table>
    <tr>
        <td id="pie" style="width: 700px;height: 300px;"></td>
        <td id="bar" style="width: 700px;height: 300px;"></td>
        <td id="line" style="width: 700px;height: 300px;"></td>
    </tr>
</table>
<div id="test"></div>
<div>
    <table class="table table-hover table-striped table-bordered table-sm" id="tablelist">
        <tr>
            <th>需求名称</th>
            <th>机构名称</th>
        </tr>
        <%ArrayList<Dcwj> list=(ArrayList<Dcwj>)request.getAttribute("list");%>
        <c:forEach var="l" items="<%=list %>" varStatus="i">
            <tr>
                <td><a href="showWj?id=${l.getWjid()}">${l.getJsxqmc() }</a></td>
                <td>${l.getJgmc() }</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script type="text/javascript">
    function show(method) {
        var dt;
        $.ajax({
            url:"${pageContext.request.contextPath}/Echarts",
            async:false,
            type:"post",
            data:{
                method:method,
            },
            success:function (data) {
                dt = data;
                if (method=="szdy")
                {
                    var htmltext="<table class='table table-hover table-striped table-bordered table-sm' id='table'> <tr>\n" +
                        "            <th>所在地域</th>\n" +
                        "            <th>数量</th>\n" +
                        "        </tr>";
                }
                if (method=="yjlx")
                {
                    var htmltext="<table class='table table-hover table-striped table-bordered table-sm' id='table'> <tr>\n" +
                        "            <th>研究类型</th>\n" +
                        "            <th>数量</th>\n" +
                        "        </tr>";
                }
                if (method=="glcs")
                {
                    var htmltext="<table class='table table-hover table-striped table-bordered table-sm' id='table'> <tr>\n" +
                        "            <th>管理处室</th>\n" +
                        "            <th>数量</th>\n" +
                        "        </tr>";
                }
                for(var j=0;j<dt.length;j++)
                    htmltext+="<tr><td>"+dt[j].name+"</td><td>"+dt[j].value+"</td></tr>";
                htmltext+="</table>";
                $("#test").html(htmltext);
            },
            error:function () {
                alert('请求失败');
            },
            dataType:'json'
        });
        // 页面加载函数
        //进行echarts的初始化
        var myEcharts_pie = echarts.init(document.getElementById("pie"));
        var myEcharts_bar = echarts.init(document.getElementById("bar"));
        var myEcharts_line = echarts.init(document.getElementById("line"));
        var xd = new Array();
        var yd = new Array();
        for (var j=0;j<dt.length;j++) {
            xd.push(dt[j].name);
            yd.push(dt[j].value);
        }
        var option = {
            // 定义标题
            title : {
            },
            // 鼠标悬停显示数据
            tooltip:{
                show:true,
            },
            //图例
            legend : {
                data: xd
            },
            //数据
            series :[
                {
                    radius:['0%','60%'], //半径
                    label:{
                        normal:{
                            // 取消在原来的位置显示
                            show:false,
                            // 在中间显示
                            //position:'center'
                        },
                        // 高亮扇区
                        emphasis:{
                            show:true,
                            textStyle:{
                                fontSize:15,
                                fontWeight:'bold'
                            }
                        }
                    },
                    data:dt,
                    type:'pie',
                    //关掉南丁格尔图
                    //roseType:'radius'
                }
            ]
        };
        var option_bar = {
            title: {

            },
            tooltip: {
                show: true,
                trigger: 'axis'

            },
            legend: {
                data: ['数量']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                axisLabel:{
                    //横坐标上的文字斜着显示 文字颜色 begin
                    interval:0,
                    rotate:30,
                    margin:20,
                    textStyle:{color:"#ec6869" }
                    //横坐标上的文字换行显示 文字颜色end
                },
                data: xd
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name: '人数',
                    type: "bar",
                    stack: '总量',
                    data: yd,
                    barWidth:20,
                    barGap:'10%'
                }
            ]
        };
        var option_line = {
            title: {

            },
            tooltip: {
                show: true,
                trigger: 'axis'

            },
            legend: {
                data: ['数量']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                axisLabel:{
                    //横坐标上的文字斜着显示 文字颜色 begin
                    interval:0,
                    rotate:45,
                    margin:60,
                    textStyle:{color:"#ec6869" }
                    //横坐标上的文字换行显示 文字颜色end
                },
                data: xd
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name: '人数',

                    type: "line",
                    stack: '总量',
                    data: yd,
                    barWidth:20,
                    barGap:'10%'
                }
            ]
        };
        // 设置配置项
        myEcharts_pie.setOption(option);
        myEcharts_bar.setOption(option_bar);
        myEcharts_line.setOption(option_line);
        // 设置echarts的点击事件
        myEcharts_pie.on('click',function (params) {
            // 获取table下所有的tr
            let trs = $("#table tbody tr");
            for (let i = 0;i<trs.length;i++){
                // 获取tr下所有的td
                let tds = trs.eq(i).find("td");
                // 先把之前的标记的success去掉
                $("#table tbody tr").eq(i).removeClass('success');
                // 如果点击图示的名字和table下的某一个行的第一个td的值一样
                if (params.name == tds.eq(0).text()){
                    //设置success状态
                    $("#table tbody tr").eq(i).addClass('success');
                    // 跳转到页面指定的id位置
                    $("html,body").animate({scrollTop:$("#table tbody tr").eq(i).offset().top},500);
                }
            }
        });
        myEcharts_bar.on('click',function (params) {
            // 获取table下所有的tr
            let trs = $("#table tbody tr");
            for (let i = 0;i<trs.length;i++){
                // 获取tr下所有的td
                let tds = trs.eq(i).find("td");
                // 先把之前的标记的success去掉
                $("#table tbody tr").eq(i).removeClass('success');
                // 如果点击图示的名字和table下的某一个行的第一个td的值一样
                if (params.name == tds.eq(0).text()){
                    //设置success状态
                    $("#table tbody tr").eq(i).addClass('success');
                    // 跳转到页面指定的id位置
                    $("html,body").animate({scrollTop:$("#table tbody tr").eq(i).offset().top},500);
                }
            }
        });
        myEcharts_line.on('click',function (params) {
            // 获取table下所有的tr
            let trs = $("#table tbody tr");
            for (let i = 0;i<trs.length;i++){
                // 获取tr下所有的td
                let tds = trs.eq(i).find("td");
                // 先把之前的标记的success去掉
                $("#table tbody tr").eq(i).removeClass('success');
                // 如果点击图示的名字和table下的某一个行的第一个td的值一样
                if (params.name == tds.eq(0).text()){
                    //设置success状态
                    $("#table tbody tr").eq(i).addClass('success');
                    // 跳转到页面指定的id位置
                    $("html,body").animate({scrollTop:$("#table tbody tr").eq(i).offset().top},500);
                }
            }
        });
        // 当鼠标落在tr时，显示浮动
        $("#table tbody").find("tr").on("mouseenter",function () {
            // 获得当前匹配元素的个数
            let row = $(this).prevAll().length;
            // 获得当前tr下td的名字
            let name = $("#table tbody").find("tr").eq(row).find("td").eq(0).text();
            // 设置浮动
            myEcharts_pie.dispatchAction({ type: 'showTip',seriesIndex: 0, name:name});//选中高亮
        });
        // 当鼠标移开tr时候取消浮动
        $("#table tbody").find("tr").on("mouseleave",function () {
            // 获得当前匹配元素的个数
            let row = $(this).prevAll().length;
            // 获得当前tr下td的名字
            let name = $("#table tbody").find("tr").eq(row).find("td").eq(0).text();
            // 设置浮动
            myEcharts_pie.dispatchAction({ type: 'hideTip', name:name});//选中高亮
        });
    }
</script>
</html>