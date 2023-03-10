<%--
  Created by IntelliJ IDEA.
  User: 25004
  Date: 2022/11/21
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <input type="hidden" disabled id="g_id" name="g_id" required="" autocomplete="off" class="layui-input">
            <div class="layui-form-item">
                <label for="L_email" class="layui-form-label">
                    <span class="x-red">*</span>类名</label>
                <div class="layui-input-inline">
                    <input type="text" id="g_name" name="g_name" required="" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>请输入2-6个字符</div></div>
            <div class="layui-form-item">
            </div>

            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="update" lay-submit="">修改</button></div>
        </form>
    </div>
</div>
<script>layui.use(['form', 'layer','jquery'],
    function() {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;

        //自定义验证规则
        form.verify({
            nikename: function(value) {
                if (value.length < 2) {
                    return '类名至少得2个字符啊';
                }
                if (value.length > 6) {
                    return '类名最多6个字符啊';
                }
            },
        });

        <%
                 String id=request.getParameter("id");
               %>
        //通过ajax请求像后端获取对象信息
        $.ajax({
            url:"<%=request.getContextPath()%>/TypeServlet?op=getTypeByid",
            type:"post",
            traditional: true,  //这里设置为true
            data:{g_id:<%=id%>},
            success:function(result){
                $("#g_name").val(result.g_name);
                $("#g_id").val(result.g_id)
            }
        })

        //监听提交
        form.on('submit(update)', function(data){
            /*
               1、获取输入框的值信息
               2、通过ajax请求向后端发送请求
               3、根据响应反馈信息提示，并刷新主页
             */
            var data=data.field;
            $.ajax({
                url:"<%=request.getContextPath()%>/TypeServlet?op=updateSubmit",
                type:"post",
                data:data,
                success:function(result){
                    layer.alert("修改成功", {icon: 6},function () {
                        // //关闭当前frame
                        // // 可以对父窗口进行刷新
                        parent.window.location.reload();
                    });
                }
                ,
                error:function (message){
                    layer.msg("用户名不能重复")
                }
            })
            return false;
        });


    });</script>
<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>
