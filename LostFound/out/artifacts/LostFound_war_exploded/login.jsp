<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html  class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/css/login.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/admin/lib/layui/layui.js" charset="utf-8"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .bbbb{
            float: right;
        }
    </style>
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">登录</div>
    <div id="darkbannerwrap"></div>
    <form method="post" class="layui-form" action="LoginServlet?opr=login">
        <input name="username" placeholder="用户名"  type="text" lay-verify="nikename" class="layui-input" >
        <hr class="hr15">
        <input name="password" lay-verify="password" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
        用户&nbsp&nbsp&nbsp<input type="radio" class="role" name="role" value="用户" checked>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        管理员&nbsp&nbsp&nbsp<input type="radio" class="role" name="role" value="管理员">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20" >
    </form>
    <a class="bbbb" href="register.jsp">去注册</a>
</div>

<script>
    $(function  () {
        layui.use('form', function(){
            var form = layui.form;
            form.verify({
                nikename: function(value) {
                    if (value.length < 5) {
                        return '用户名至少得5个字符啊';
                    }
                },
                password: [/(.+){5,12}$/, '密码必须5到12位'],
            });
        });
    })
</script>
<!-- 底部结束 -->
</body>
</html>