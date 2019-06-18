<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/19
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <link type="text/css" rel="stylesheet" href="<c:url value="/static/css/userCss/registerStyle.css"/>">
    <jsp:include page="../templates/base-lib.jsp"/>
</head>
<body>
<div class="main">
    <div class="nav ">
        <p>剑网三攻略网欢迎你</p>
        <ul>
            <li><a href="">休闲社区</a></li>
            <li><a href="">交易社区</a></li>
            <li><a href="">攻略社区</a></li>
            <li><a href="">公告社区</a></li>
            <li><a href="">资料站</a></li>
            <li><a href="">首页</a></li>
        </ul>
    </div>
    <div class="header">
        <h1>剑网三攻略注册</h1>
        <p>祝你游戏开心</p>
    </div>
    <div class="centers">
        <form>
            <div class="form-group">
                <input type="text" class="form-control" id="nickName" placeholder="网站呢称">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="userName" placeholder="用户名">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="password" placeholder="密码">
            </div>
            <div class="btn-group">
                <button type="button" id="submit_btn" class="btn btn-info">立即注册</button>
            </div>
        </form>
    </div>
    <div class="bottom">
        <div class="container">
            <div class="footer-navbar">
                <a href="#">GitHub仓库</a>
                <a href="#">关于我们</a>
            </div>
            <p class="footer-content">
                CopyRight © 2019 jx3strategystation<br>
                All rights reserved. jx3strategystation 版权所有
            </p>
        </div>
    </div>
</div>
<script src="<c:url value="/static/js/jquery.min.js"/>"></script>
<script>
    function register() {
        $.post("/v1/api/register", {
            "user.userName": $("#userName").val(),
            "user.nickName": $("#nickName").val(),
            "user.password": $("#password").val()
        }, function (data, status) {
            if (data.userId > 0) {
                alert("注册成功！");
            } else {
                alert("注册失败！")
            }
        });
    }

    $(function () {
        var errMsg;
        var nickC;
        var uNC;
        var pwdC;
        $.each($("input"), function (i, val) {
            $(val).blur(function () {
                if ($(val).attr("id") == "userName") {
                    $(".nameMsg").remove();
                    var userName = val.value;
                    var regName = /[a-zA-Z]\w{4,16}/
                    if (userName == "" || userName.trim() == "") {
                        errMsg = "<span class='nameMsg label label-danger' >用户名不能为空</span>";
                    } else if (!regName.test(userName)) {
                        errMsg = "<span class='nameMsg label label-danger'>由英文字母和数字组成的4-16位字符，以字母开头</span>";
                    } else {
                        errMsg = "<span class='nameMsg label label-success'>OK！</span>";
                        uNC = true;
                    }
                    $(this).parent().append(errMsg);
                } else if ($(val).attr("id") == "nickName") {
                    $(".nickMsg").remove();
                    var nickName = val.value;
                    var regName = /[\u4e00-\u9fa5]{2,6}/
                    if (nickName == "" || nickName.trim() == "") {
                        errMsg = "<span class='nickMsg label label-danger'>昵称不能为空</span>";
                    } else if (!regName.test(nickName)) {
                        errMsg = "<span class='nickMsg label label-danger'>由2-6个汉字组成</span>";
                    } else {
                        errMsg = "<span class='nickMsg label label-success' >OK！</span>";
                        nickC = true;
                    }
                    $(this).parent().append(errMsg);
                } else if ($(val).attr("id") == "password") {
                    $(".pwdMsg").remove();
                    var pwd = val.value;
                    var regPwd = /^\w{4,10}$/;
                    if (pwd == "" || pwd.trim() == "") {
                        errMsg = "<span class='pwdMsg label label-danger' >密码不能为空</span>";
                    } else if (!regPwd.test(pwd)) {
                        errMsg = "<span class='pwdMsg label label-danger' >格式错误</span>";
                    } else {
                        errMsg = "<span class='pwdMsg label label-success' >OK！</span>";
                        pwdC = true;
                    }
                    $(this).parent().append(errMsg);
                }
            });
        });
        $('#submit_btn').on('click', function () {
            if (uNC == true && pwdC == true && nickC == true) {
                $.post("/v1/api/register", {
                    "user.userName": $("#userName").val(),
                    "user.nickName": $("#nickName").val(),
                    "user.password": $("#password").val()
                }, function (data, status) {
                    if (data.userId > 0) {
                        alert("注册成功！");
                        window.location.replace("http://localhost:8080");
                    }
                    else {
                        alert("注册失败！")
                    }
                });
            }
        });
    });
</script>
</body>
</html>