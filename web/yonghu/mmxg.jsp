<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<%HttpSession Session = request.getSession();%>
<body>
<table>
    <tr>
        <td>请输入原密码:</td>
        <td>
            <input type="password" id="oldpassword" name="oldpassword">
        </td>
    </tr>
    <tr>
        <td>请输入新密码:</td>
        <td>
            <input type="password" id="password" name="password">
        </td>
    </tr>
    <tr>
        <td>请确认新密码:</td>
        <td>
            <input type="password" id="repassword" name="repassword">
        </td>
    </tr>
    <tr>
        <td>
            <input type="button" value="修改" onclick="xg()">
        </td>
    </tr>
</table>
</body>
<script>
    function xg() {
        var oldpassword = document.getElementById("oldpassword").value;
        var password = document.getElementById("password").value;
        var repassword = document.getElementById("repassword").value;
        if (oldpassword==""||password==""||repassword=="")
        {
            alert("请输入信息");
        }
        else
        {
            if (oldpassword!="<%=Session.getAttribute("password")%>") {
                alert("原密码错误");
            }
            else {
                if (password!=repassword) {
                    alert("两次密码输入不一致");
                }
                else {
                    $.post(
                        "../Xgmm",
                        {
                            password: password,
                        },
                        function (data) {
                            if (data == "yes") {
                                alert("修改成功！");
                                window.location = "../templete/open.html";
                            } else
                                alert("修改失败！");
                        }
                    );
                }
            }
        }

    }
</script>
</html>
