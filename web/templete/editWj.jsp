<%@ page import="bean.Dcwj" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<title>Insert title here</title>
	<style type="text/css">
		.title{
			width:100%;
			text-align:center;
			margin-top:20px;
		}
		.left{
			width:16%;
			text-align:center;
			top:50%;
		}
		.right{
			width:30%;
			broder:1px solid;
			text-align:center;
			top:50%;
		}
		.write{
			border: 0;
			width: 100%;
			height: 100%;
			margin: 0;
			padding: 0;
		}
		.red{
			color: red;
		}
	</style>
</head>
<body>
<div class="title"><h2>河北省重大技术需求征集表</h2></div>
<%
	Object message = request.getAttribute("message");
	if(message!=null && !"".equals(message)){
%>
<script type="text/javascript">
	alert("<%=request.getAttribute("message")%>");
</script>
<%} %>
<%Dcwj dcwj=(Dcwj) request.getAttribute("wj"); %>
<script>
	window.onload = function () {
		var jgsx = document.getElementsByName("jgsx");
		for (var i = 0;i < jgsx.length;i++){
			if (jgsx[i].value == "<%=dcwj.getJgsx()%>"){
				jgsx[i].checked = true;
				break;
			}
		}
		var yjlx = document.getElementsByName("yjlx");
		for (var i = 0;i < yjlx.length;i++){
			if (yjlx[i].value == "<%=dcwj.getYjlx()%>"){
				yjlx[i].checked = true;
				if (i==0) {
					var htmltext = "";
					htmltext+=
							"        <td class='left'><span class='red'>*</span>学科分类</td>\n" +
							"        <td colspan='4'>\n" +
							"        <SELECT name='first' id='first_xkfl' onchange=\"set_second(this, document.getElementById('second_xkfl'),document.getElementById('third_xkfl'));\" class=login_text_input >\n" +
							"            <option value=请选择>请选择</option>\n" +
							"            <option value=哲学>哲学</option>\n" +
							"            <option value=经济学>经济学</option>\n" +
							"            </SELECT> \n" +
							"            <select id='second_xkfl' onchange=\"set_third(this, document.getElementById('third_xkfl'));\" class=login_text_input name=\"second\">\n" +
							"            <option value=请选择>请选择</option>\n" +
							"            </select>\n" +
							"            <select id='third_xkfl' class=login_text_input name='xkfl'>\n" +
							"            <option value=请选择>请选择</option>\n" +
							"            </select>\n" +
							"            </td>\n";
					$("#type").html(htmltext);
					$("#type1").html("");
					//学科分类显示
					firsts = new Array('哲学','经济学');
					firsts['哲学']=new Array('哲学');
					firsts['经济学']=new Array('理论经济学', '应用经济学');
					seconds = new Array('哲学','应用经济学','理论经济学');
					seconds['哲学']=new Array('马克思主义哲学','中国哲学','外国哲学','逻辑学','美学','宗教学','科学技术哲学');
					seconds['理论经济学']=new Array('政治经济学', '经济思想史','经济史', '西方经济学','世界经济', '人口、资源与环境经济学');
					seconds['应用经济学']=new Array('国民经济学', '区域经济学','财政学', '金融学','产业经济学', '国际贸易学','劳动经济学', '统计学','数量经济学', '国际经济');
					var first = document.getElementById("first_xkfl");
					var second = document.getElementById("second_xkfl");
					var third = document.getElementById("third_xkfl");
					var xkfl = "<%=dcwj.getXkfl()%>";
					third[0].text = xkfl;
					third[0].value = xkfl;
					var sv,fv;
					var i, ii;
					for (i=0;i<seconds.length;i++)
					{
						sv = seconds[i];
						for (ii=0;ii<seconds[sv].length;ii++)
						{
							if (seconds[sv][ii]==xkfl)
							{
								second[0].text = sv;
								second[0].value = sv;
								break;
							}
						}
					}
					sv = second[0].value;
					for (i=0;i<firsts.length;i++)
					{
						fv = firsts[i];
						for (ii=0;ii<firsts[fv].length;ii++)
						{
							if (firsts[fv][ii]==sv)
							{
								first[0].text = fv;
								first[0].value = fv;
								break;
							}
						}
					}
				}
				else {
					var htmltext="<td class='left'><span class='red'>*</span>需求技术所属领域（非基础研究填写）</td><td class='right' colspan='4'>"
							+"<input type='checkbox' name='xqjsssly' value='电子信息技术'>电子信息技术"
							+"<input type='checkbox' name='xqjsssly' value='光机电一体化'>光机电一体化"
							+"<input type='checkbox' name='xqjsssly' value='软件'>软件"
							+"<input type='checkbox' name='xqjsssly' value='生物制药技术'>生物制药技术"
							+"<input type='checkbox' name='xqjsssly' value='新材料及应用技术'>新材料及应用技术"
							+"<input type='checkbox' name='xqjsssly' value='先进制造技术'>先进制造技术"
							+"<input type='checkbox' name='xqjsssly' value='现代农业技术'>现代农业技术"
							+"<input type='checkbox' name='xqjsssly' value='新材料与高效节能技术'>新材料与高效节能技术"
							+"<input type='checkbox' name='qtjsms' value='其他'>其他</td>";
					var htmltext1= "<td class='left'><span class=\"red\">*</span>需求技术应用行业</td>\n" +
							"        <td colspan='4'>\n" +
							"        <SELECT name='first' id='first' onchange=\"set_second_yyhy(this, document.getElementById('second'),document.getElementById('third'));\" class=login_text_input >\n" +
							"            <option value=请选择>请选择</option>\n" +
							"            <option value=农林牧渔业>农林牧渔业</option>\n" +
							"            <option value=采矿业>采矿业</option>\n" +
							"            </SELECT> \n" +
							"            <select id='second' onchange=\"set_third_yyhy(this, document.getElementById('third'));\" class=login_text_input name='second'>\n" +
							"            <option value=请选择>请选择</option>\n" +
							"            </select>\n" +
							"            <select id='third' class=login_text_input name='xqjsyyhy'>\n" +
							"            <option value=请选择>请选择</option>\n" +
							"            </select>\n" +
							"            </td>\n";
					$("#type").html(htmltext);
					$("#type1").html(htmltext1);
					//应用行业显示
					firsts_yyhy = new Array('农林牧渔业','采矿业');
					firsts_yyhy['农林牧渔业']=new Array('农业','林业','畜牧业','渔业');
					firsts_yyhy['采矿业']=new Array('煤炭开采和洗选业','石油和天然气开采业','黑色金属矿采选业','有色金属矿采选业','非金属矿采选业');
					seconds_yyhy = new Array('农业','林业','畜牧业','渔业','煤炭开采和洗选业','石油和天然气开采业');
					seconds_yyhy['农业']=new Array('谷物种植','豆类、油料和薯类种植');
					seconds_yyhy['林业']=new Array('林木育种和育苗','造林和更新');
					seconds_yyhy['畜牧业']=new Array('牲畜饲养','家禽饲养');
					seconds_yyhy['渔业']=new Array('水产养殖','水产捕捞');
					seconds_yyhy['煤炭开采和洗选业']=new Array('烟煤和无烟煤开采洗选','褐煤开采洗选');
					seconds_yyhy['石油和天然气开采业']=new Array('石油开采','天然气开采');
					var first = document.getElementById("first");
					var second = document.getElementById("second");
					var third = document.getElementById("third");
					var xqjsyyhy = "<%=dcwj.getXqjsyyhy()%>";
					third[0].text = xqjsyyhy;
					third[0].value = xqjsyyhy;
					var sv,fv;
					var i, ii;
					for (i=0;i<seconds_yyhy.length;i++)
					{
						sv = seconds_yyhy[i];
						for (ii=0;ii<seconds_yyhy[sv].length;ii++)
						{
							if (seconds_yyhy[sv][ii]==xqjsyyhy)
							{
								second[0].text = sv;
								second[0].value = sv;
								break;
							}
						}
					}
					sv = second[0].value;
					for (i=0;i<firsts_yyhy.length;i++)
					{
						fv = firsts_yyhy[i];
						for (ii=0;ii<firsts_yyhy[fv].length;ii++)
						{
							if (firsts_yyhy[fv][ii]==sv)
							{
								first[0].text = fv;
								first[0].value = fv;
								break;
							}
						}
					}
				}
				break;
			}
		}
		var jsxqhzms = document.getElementsByName("jsxqhzms");
		for (var i = 0;i < jsxqhzms.length;i++){
			if (jsxqhzms[i].value == "<%=dcwj.getJsxqhzms()%>"){
				jsxqhzms[i].checked = true;
				break;
			}
		}
		var gjz = "<%=dcwj.getGjz()%>".split(" ");
		var gjz1 = document.getElementById("gjz1");
		var gjz2 = document.getElementById("gjz2");
		var gjz3 = document.getElementById("gjz3");
		var gjz4 = document.getElementById("gjz4");
		var gjz5 = document.getElementById("gjz5");
		gjz1.value = gjz[0];
		checkgjz1();
		gjz2.value = gjz[1];
		gjz3.value = gjz[2];
		gjz4.value = gjz[3];
		gjz5.value = gjz[4];
		var xqjsssly = document.getElementsByName("xqjsssly");
		var ssly = "<%=dcwj.getXqjsssly()%>";
		var arr = ssly.split(" ");
		var j = 0;
		for (var i = 0;i < xqjsssly.length;i++){
			if (xqjsssly[i].value == arr[j]){
				j++;
				xqjsssly[i].checked = true;
			}
		}
		var szdy = document.getElementById("szdy");
		szdy.value = "<%=dcwj.getSzdy()%>";
	};
</script>
<script>
	//提交判断
	function check() {
		var jgmc = document.getElementById("jgmc").value;
		var txdz = document.getElementById("txdz").value;
		var szdy = document.getElementById("szdy").value;
		var dzyx = document.getElementById("dzyx").value;
		var frdb = document.getElementById("frdb").value;
		var lxr = document.getElementById("lxr").value;
		var yddh = document.getElementById("yddh").value;
		var jgjj = document.getElementById("jgjj").value;
		var jsxqmc = document.getElementById("jsxqmc").value;
		var qsxqnf = document.getElementById("qsxqnf").value;
		var jzxqnf = document.getElementById("jzxqnf").value;
		var zywt = document.getElementById("zywt").value;
		var jsgj = document.getElementById("jsgj").value;
		var yqmb = document.getElementById("yqmb").value;
		var gjz1 = document.getElementById("gjz1").value;
		var temp = false;
		var temp1 = false;
		var temp2 = false;
		var temp3 = false;
		var jgsx = document.getElementsByName("jgsx");
		var jsxqhzms = document.getElementsByName("jsxqhzms");
		var yjlx = document.getElementsByName("yjlx");
		for (var i = 0;i<jgsx.length;i++) {
			if (jgsx[i].checked==true)
			{
				temp = true;
				break;
			}
		}
		for (var i = 0;i<jsxqhzms.length;i++) {
			if (jsxqhzms[i].checked==true)
			{
				temp1 = true;
				break;
			}
		}
		for (var i = 0;i<yjlx.length;i++) {
			if (yjlx[i].checked==true)
			{
				temp2 = true;
				break;
			}
			else
			{
				temp2 = false;
			}
		}
		if (!temp||!temp1||!temp2||jgmc==""||txdz==""||szdy==""||dzyx==""||frdb==""||lxr==""||yddh==""||jgjj==""||jsxqmc==""||qsxqnf==""||jzxqnf==""||zywt==""||jsgj==""||yqmb==""||gjz1=="")
		{
			alert("请将必填信息填写完整");
			return false;
		}
		else{
			for (var i = 0;i<yjlx.length;i++) {
				if (yjlx[i].checked==true)
				{
					if (i==0)
					{
						var xkfl = document.getElementById("third_xkfl").value;
						if (xkfl==""||xkfl=="请选择")
						{
							alert("请将必填信息填写完整");
							return false;
						}
						else
						{
							var msg ="需求信息审核后不能修改！ 确定提交吗";
							if (confirm(msg)==true)
							{
								return true;
							}
							else
								return false;
						}
					}
					else
					{
						var xqjsssly = document.getElementsByName("xqjsssly");
						var xqjsyyhy = document.getElementById("third_yyhy").value;
						for (var j = 0;j<xqjsssly.length;j++) {
							if (xqjsssly[j].checked==true)
							{
								temp3 = true;
								break;
							}
							else
							{
								temp3 = false;
							}
						}
						if(!temp3||xqjsyyhy==""||xqjsyyhy=="请选择")
						{
							alert("请将必填信息填写完整");
							return false;
						}
						else
						{
							var msg ="需求信息审核后不能修改！ 确定提交吗";
							if (confirm(msg)==true)
							{
								return true;
							}
							else
								return false;
						}
					}
					break;
				}
			}
		}
	}
</script>
<form action="${pageContext.request.contextPath}/wjUpdate" method="post" onsubmit="return check()">
	<table border="1" align="center" width="70%">
		<tr hidden="hidden">
			<td><input type="text" name="wjid" id="wjid" value="<%=dcwj.getWjid()%>"></td>
		</tr>
		<tr>
			<td class="left"><span class="red">*</span>机构全称</td>
			<td class="right"><input class="write" type="text" name="jgmc" id="jgmc" value="<%=dcwj.getJgmc()%>"></td>
			<td class="left">归口管理部门</td>
			<td colspan="2">
				<select style="width: 100%;border: 0">
					<option name="gkglbm" value=""></option>
					<option name="gkglbm" value="计财处">计财处</option>
					<option name="gkglbm" value="情报院">情报院</option>
					<option name="gkglbm" value="业务处">业务处</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="left"><span class="red">*</span>通讯地址</td>
			<td class="right"><input class="write" type="text" name="txdz" id="txdz" value="<%=dcwj.getTxdz()%>"></td>
			<td class="left"><span class="red">*</span>所在地域</td>
			<td colspan="2">
				<select name="szdy" id="szdy" style="width: 100%;border: 0">
					<option ></option>
					<option value=石家庄>石家庄</option>
					<option value=张家口>张家口</option>
					<option value=承德>承德</option>
					<option value=秦皇岛>秦皇岛</option>
					<option value=唐山>唐山</option>
					<option value=廊坊>廊坊</option>
					<option value=保定>保定</option>
					<option value=沧州>沧州</option>
					<option value=衡水>衡水</option>
					<option value=邢台>邢台</option>
					<option value=邯郸>邯郸</option>
					<option value=定州>定州</option>
					<option value=辛集>辛集</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="left">网址</td>
			<td class="right"><input class="write" type="text" name="dwwz" id="dwwz" value="<%=dcwj.getDwwz()%>"></td>
			<td class="left"><span class="red">*</span>电子信箱</td>
			<td colspan="2"><input class="write" type="text" name="dzyx" id="dzyx" value="<%=dcwj.getDzyx()%>"></td>
		</tr>
		<tr>
			<td class="left"><span class="red">*</span>法人代表</td>
			<td class="right"><input class="write" type="text" name="frdb" id="frdb" value="<%=dcwj.getFrdb()%>"></td>
			<td class="left">邮政编码</td>
			<td colspan="2"><input class="write" type="text" name="yzbm" id="yzbm" value="<%=dcwj.getYzbm()%>"></td>
		</tr>
		<tr>
			<td class="left"><span class="red">*</span>联系人</td>
			<td class="right"><input class="write" type="text" name="lxr" id="lxr" value="<%=dcwj.getLxr()%>"></td>
			<td class="left">固定电话</td>
			<td colspan="2"><input class="write" type="text" name="gddh" id="gddh" value="<%=dcwj.getGddh()%>"></td>
		</tr>
		<tr>
			<td class="left"><span class="red">*</span>手机</td>
			<td class="right"><input class="write" type="text" name="yddh" id="yddh" value="<%=dcwj.getYddh()%>"></td>
			<td class="left">传真</td>
			<td colspan="2"><input class="write" type="text" id="cz" name="cz"></td>
		</tr>
		<tr>
			<td class="left"><span class="red">*</span>机构属性</td>
			<td class="right" colspan="4">
				<input type="radio" value="企业" name="jgsx">企业
				<input type="radio" value="高等院校" name="jgsx">高等院校
				<input type="radio" value="研究机构" name="jgsx">研究机构
				<input type="radio" value="其他" name="jgsx">其他
			</td>
		</tr>
		<tr>
			<td colspan="5" border="0"><span class="red">*</span>机构简介（单位基本情况，研究基础等，限200字）</td>
		</tr>
		<tr>
			<td colspan="5" height="100px">
				<div class="formControls col-xs-8 col-sm-9">
					<!-- 核心代码 start-->
					<textarea name="jgjj" id="jgjj" cols="120" rows="5" class="textarea"><%=dcwj.getJgjj()%></textarea>
					<p class="textarea-numberbar"><em class="textarea-length"><%=dcwj.getJgjj().length()%></em>/
						<am>200</am>
					</p>
					<!-- 核心代码 end-->
				</div>
			</td>
		</tr>
		<tr>
			<td class="left"><span class="red">*</span>技术需求名称</td>
			<td class="right"><input class="write" type="text" name="jsxqmc" id="jsxqmc" value="<%=dcwj.getJsxqmc()%>"></td>
			<td class="left"><span class="red">*</span>需求时限</td>
			<td class="right" colspan="2"><input style="border: 0 ;width: 30%" type="text" name="qsxqnf" id="qsxqnf" value="<%=dcwj.getQsxqnf()%>">年-<input style="border: 0 ;width: 30%" type="text" name="jzxqnf" id="jzxqnf" value="<%=dcwj.getJzxqnf()%>">年</td>
		</tr>
		<tr>
			<td colspan="5" border="0"><span class="red">*</span>重大科技需求概述（主要内容，技术指标、预期经济和社会效益等，限500字）</td>
		</tr>
		<tr>
			<td colspan="5" height="150px">
				<div class="formControls col-xs-8 col-sm-9">
					<!-- 核心代码 start-->
					<textarea name="zywt" id="zywt" cols="120" rows="5" class="textarea" placeholder="1、主要问题（需要解决的重大技术问题，限500字以内）"
							  onKeyUp="Huitextarealength(this)"><%=dcwj.getZdkjxqgs()%></textarea>
					<p class="textarea-numberbar"><em class="textarea-length"><%=dcwj.getZdkjxqgs().length()%></em>/
						<am>500</am>
					</p>
					<!-- 核心代码 end-->
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="5" height="150px">
				<div class="formControls col-xs-8 col-sm-9">
					<!-- 核心代码 start-->
					<textarea name="jsgj" id="jsgj" cols="120" rows="5" class="textarea" placeholder="2、技术关键（所需的关键技术、主要指标，限500字以内）"
							  onKeyUp="Huitextarealength(this)"><%=dcwj.getZdkjxqgs2()%></textarea>
					<p class="textarea-numberbar"><em class="textarea-length"><%=dcwj.getZdkjxqgs2().length()%></em>/
						<am>500</am>
					</p>
					<!-- 核心代码 end-->
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="5" height="150px">
				<div class="formControls col-xs-8 col-sm-9">
					<!-- 核心代码 start-->
					<textarea name="yqmb" id="yqmb" cols="120" rows="5" class="textarea" placeholder="3、预期目标（技术创新性、经济社会效益，限500字以内）"
							  onKeyUp="Huitextarealength(this)"><%=dcwj.getZdkjxqgs3()%></textarea>
					<p class="textarea-numberbar"><em class="textarea-length"><%=dcwj.getZdkjxqgs().length()%></em>/
						<am>500</am>
					</p>
					<!-- 核心代码 end-->
				</div>
			</td>
		</tr>
		<tr>
			<td class="left"><span class="red">*</span>关键字</td>
			<td class="right" colspan="4">
				<input style="width: 15%" type="text" name="gjz1" id="gjz1" onblur="checkgjz1()">
				<input style="width: 15%" type="text" name="gjz2" id="gjz2" onblur="checkgjz2()" readonly="readonly">
				<input style="width: 15%" type="text" name="gjz3" id="gjz3" onblur="checkgjz3()" readonly="readonly">
				<input style="width: 15%" type="text" name="gjz4" id="gjz4" onblur="checkgjz4()" readonly="readonly">
				<input style="width: 15%" type="text" name="gjz5" id="gjz5" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td class="left"><span class="red">*</span>技术需求解决方式</td>
			<td class="right" colspan="4">
				<input type="radio" value="独立研发" name="jsxqhzms">独立研发
				<input type="radio" value="委托研发" name="jsxqhzms">委托研发
				<input type="radio" value="合作研发" name="jsxqhzms">合作研发
				<input type="radio" value="其他" name="jsxqhzms">其他
			</td>
		</tr>
		<tr>
			<td class="left"><span class="red">*</span>科技活动类型</td>
			<td class="right" colspan="4">
				<input type="radio" name="yjlx" onclick="type1()" value="基础研究">基础研究
				<input type="radio" name="yjlx" onclick="type2()" value="应用研究">应用研究
				<input type="radio" name="yjlx" onclick="type2()" value="试验发展">试验发展
				<input type="radio" name="yjlx" onclick="type2()" value="研究与试验发展成果应用">研究与试验发展成果应用
				<input type="radio" name="yjlx" onclick="type2()" value="技术推广与科技服务">技术推广与科技服务
			</td>
		</tr>
		<tr  id="type" align="center"></tr>
		<tr id="type1" align="center"></tr>
		<tr>
			<td colspan="5" align="center"><input type="submit" value="提交"></td>
		</tr>
	</table>
</form>
</body>
<script>
	//学科分类三级联动
	firsts = new Object();
	firsts['哲学']=new Array('哲学');
	firsts['经济学']=new Array('理论经济学', '应用经济学');
	firsts_yyhy = new Object();
	firsts_yyhy['农林牧渔业']=new Array('农业','林业','畜牧业','渔业');
	firsts_yyhy['采矿业']=new Array('煤炭开采和洗选业','石油和天然气开采业','黑色金属矿采选业','有色金属矿采选业','非金属矿采选业');
	seconds_yyhy = new Object();
	seconds_yyhy['农业']=new Array('谷物种植','豆类、油料和薯类种植');
	seconds_yyhy['林业']=new Array('林木育种和育苗','造林和更新');
	seconds_yyhy['畜牧业']=new Array('牲畜饲养','家禽饲养');
	seconds_yyhy['渔业']=new Array('水产养殖','水产捕捞');
	seconds_yyhy['煤炭开采和洗选业']=new Array('烟煤和无烟煤开采洗选','褐煤开采洗选');
	seconds_yyhy['石油和天然气开采业']=new Array('石油开采','天然气开采');
	function set_second(first, second,third) {
		var fv, sv;
		var i, ii;
		fv=first.value;
		sv=second.value;
		tv=third.value;
		second.length=1;
		third.length=1;
		if(fv=='请选择') return;
		if(typeof(firsts[fv])=='undefined') return;
		first[0].text = "";
		first[0].value = "";
		second[0].text = "";
		second[0].value = "";
		third[0].text = "";
		third[0].value = "";
		for(i=0; i<firsts[fv].length; i++)
		{
			ii = i+1;
			second.options[ii] = new Option();
			second.options[ii].text = firsts[fv][i];
			second.options[ii].value = firsts[fv][i];
		}
	}
	function set_second_yyhy(first, second,third) {
		var fv, sv;
		var i, ii;
		fv=first.value;
		sv=second.value;
		tv=third.value;
		second.length=1;
		third.length=1;
		if(fv=='请选择') return;
		if(typeof(firsts_yyhy[fv])=='undefined') return;
		first[0].text = "";
		first[0].value = "";
		second[0].text = "";
		second[0].value = "";
		third[0].text = "";
		third[0].value = "";
		for(i=0; i<firsts_yyhy[fv].length; i++)
		{
			ii = i+1;
			second.options[ii] = new Option();
			second.options[ii].text = firsts_yyhy[fv][i];
			second.options[ii].value = firsts_yyhy[fv][i];
		}
	}
	seconds = new Object();
	seconds['哲学']=new Array('马克思主义哲学','中国哲学','外国哲学','逻辑学','逻辑学','美学','宗教学','科学技术哲学');
	seconds['理论经济学']=new Array('政治经济学', '经济思想史','经济史', '西方经济学','世界经济', '人口、资源与环境经济学');
	seconds['应用经济学']=new Array('国民经济学', '区域经济学','财政学', '金融学','产业经济学', '国际贸易学','劳动经济学', '统计学','数量经济学', '国际经济');
	function set_third(second, third) {
		var sv,tv;
		var i, ii;
		sv=second.value;
		tv=third.value;
		third.length=1;
		if(sv=='0') return;
		if(typeof(seconds[sv])=='undefined') return;
		for(i=0; i<seconds[sv].length; i++)
		{
			ii = i+1;
			third.options[ii] = new Option();
			third.options[ii].text = seconds[sv][i];
			third.options[ii].value = seconds[sv][i];
		}
	}
	function set_third_yyhy(second, third) {
		var sv,tv;
		var i, ii;
		sv=second.value;
		tv=third.value;
		third.length=1;
		if(sv=='0') return;
		if(typeof(seconds_yyhy[sv])=='undefined') return;
		for(i=0; i<seconds_yyhy[sv].length; i++)
		{
			ii = i+1;
			third.options[ii] = new Option();
			third.options[ii].text = seconds_yyhy[sv][i];
			third.options[ii].value = seconds_yyhy[sv][i];
		}
	}
	function type1(){
		var htmltext = "";
		htmltext+=
				"        <td class='left'><span class='red'>*</span>学科分类</td>\n" +
				"        <td colspan='4'>\n" +
				"        <SELECT name='first' id='xkfl' onchange=\"set_second(this, document.getElementById('second_xkfl'),document.getElementById('third_xkfl')); WYL();\" class=login_text_input >\n" +
				"            <option value=请选择>请选择</option>\n" +
				"            <option value=哲学>哲学</option>\n" +
				"            <option value=经济学>经济学</option>\n" +
				"            <option value=法学>法学</option>\n" +
				"            <option value=教育学>教育学</option>\n" +
				"            </SELECT> \n" +
				"            <select id='second_xkfl' onchange=\"set_third(this, document.getElementById('third_xkfl')); WYL();\" class=login_text_input name=\"second\">\n" +
				"            <option value=请选择>请选择</option>\n" +
				"            </select>\n" +
				"            <select id='third_xkfl' class=login_text_input name='xkfl'>\n" +
				"            <option value=请选择>请选择</option>\n" +
				"            </select>\n" +
				"            </td>\n";
		$("#type").html(htmltext);
		$("#type1").html("");
	}
	function type2(){
		var htmltext="<td class='left'><span class='red'>*</span>需求技术所属领域（非基础研究填写）</td><td class='right' colspan='4'>"
				+"<input type='checkbox' name='xqjsssly' value='电子信息技术'>电子信息技术"
				+"<input type='checkbox' name='xqjsssly' value='光机电一体化'>光机电一体化"
				+"<input type='checkbox' name='xqjsssly' value='软件'>软件"
				+"<input type='checkbox' name='xqjsssly' value='生物制药技术'>生物制药技术"
				+"<input type='checkbox' name='xqjsssly' value='新材料及应用技术'>新材料及应用技术"
				+"<input type='checkbox' name='xqjsssly' value='先进制造技术'>先进制造技术"
				+"<input type='checkbox' name='xqjsssly' value='现代农业技术'>现代农业技术"
				+"<input type='checkbox' name='xqjsssly' value='新材料与高效节能技术'>新材料与高效节能技术"
				+"<input type='checkbox' name='qtjsms' value='其他'>其他</td>";
		var htmltext1= "<td class='left'><span class=\"red\">*</span>需求技术应用行业</td>\n" +
				"        <td colspan='4'>\n" +
				"        <SELECT name=\"first\" id='first_yyhy' onchange=\"set_second_yyhy(this, document.getElementById('second_yyhy'),document.getElementById('third_yyhy'));\" class=login_text_input >\n" +
				"            <option value=请选择>请选择</option>\n" +
				"            <option value=农林牧渔业>农林牧渔业</option>\n" +
				"            <option value=采矿业>采矿业</option>\n" +
				"            </SELECT> \n" +
				"            <select id='second_yyhy' onchange=\"set_third_yyhy(this, document.getElementById('third_yyhy'));\" class=login_text_input name=\"second\">\n" +
				"            <option value=0>请选择</option>\n" +
				"            </select>\n" +
				"            <select id='third_yyhy' class=login_text_input name='xqjsyyhy'>\n" +
				"            <option value=请选择>请选择</option>\n" +
				"            </select>\n" +
				"            </td>\n";
		$("#type").html(htmltext);
		$("#type1").html(htmltext1);
	}
	//设置关键字逐个录入
	function checkgjz1() {
		var gjz1 = document.getElementById("gjz1");
		var gjz2 = document.getElementById("gjz2");
		var gjz3 = document.getElementById("gjz3");
		var gjz4 = document.getElementById("gjz4");
		var gjz5 = document.getElementById("gjz5");
		if(gjz1.value==""){
			gjz2.readOnly = true;
			gjz3.readOnly = true;
			gjz4.readOnly = true;
			gjz5.readOnly = true;
		}else{
			gjz2.readOnly = false;
			gjz3.readOnly = true;
			gjz4.readOnly = true;
			gjz5.readOnly = true;
		}
	}
	function checkgjz2() {
		var gjz2 = document.getElementById("gjz2");
		var gjz3 = document.getElementById("gjz3");
		var gjz4 = document.getElementById("gjz4");
		var gjz5 = document.getElementById("gjz5");
		if(gjz2.value==""){
			gjz3.readOnly = true;
			gjz4.readOnly = true;
			gjz5.readOnly = true;
		}else{
			gjz3.readOnly = false;
			gjz4.readOnly = true;
			gjz5.readOnly = true;
		}
	}
	function checkgjz3() {
		var gjz3 = document.getElementById("gjz3");
		var gjz4 = document.getElementById("gjz4");
		var gjz5 = document.getElementById("gjz5");
		if(gjz3.value==""){
			gjz4.readOnly = true;
			gjz5.readOnly = true;
		}else{
			gjz4.readOnly = false;
			gjz5.readOnly = true;
		}
	}
	function checkgjz4() {
		var gjz4 = document.getElementById("gjz4");
		var gjz5 = document.getElementById("gjz5");
		if(gjz4.value==""){
			gjz5.readOnly = true;
		}else{
			gjz5.readOnly = false;
		}
	}
</script>
</html>