<%--
  Created by IntelliJ IDEA.
  User: 25004
  Date: 2022/11/21
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <link href="https://cdn.bootcdn.net/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form layui-col-space5" enctype= "multipart/form-data" method="post" action="">
            <input type="hidden" id="img" name="img" >
            <div class="layui-form-item">
                <label for="goodsname" class="layui-form-label">
                    <span class="x-red">*</span>物品名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="goodsname" name="goodsname" required="" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">物品类型</label>
                <div class="layui-input-inline">
                    <select name="typeId" id="typeId" lay-verify="required" lay-search="">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label for="desc" class="layui-form-label">描述</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" id="desc" name="desc" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>物品图片
                </label>
                <div class="layui-input-inline">
                    <div class="layui-upload-drag" id="test10">
                        <i class="layui-icon"></i>
                        <p>点击上传，或将图片拖拽到此处</p>
                        <div class="layui-hide" id="uploadDemoView">
                            <hr>
                            <img src="" alt="上传成功后渲染" style="max-width: 196px">
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="lostaddress" class="layui-form-label">
                    <span class="x-red">*</span>丢失地点</label>
                <div class="layui-input-inline">
                    <input type="text" id="lostaddress" name="lostaddress" required=""  autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span></div>
            </div>
            <div class="layui-form-item">
                <label for="losttime" class="layui-form-label"><span>*</span>丢失时间</label>
                <div class="layui-input-block">
                    <div class="layui-inline layui-show-xs-block">
                        <input class="layui-input"  autocomplete="off" placeholder="" name="losttime" id="losttime">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="nikename" class="layui-form-label">
                    <span class="x-red">*</span>发布人</label>
                <div class="layui-input-inline">
                    <input type="text" disabled id="nikename" name="nikename" value="${sessionScope.admin[0].a_name}" required="" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span></div>
            </div>
            <div class="layui-form-item">
                <label for="phone" class="layui-form-label">
                    <span class="x-red">*</span>联系电话</label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" name="phone" required="" lay-verify="phone"  autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span></div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" lay-submit="">发布</button>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(['form', 'layer','upload','laydate'],
        function() {
            $ = layui.jquery;
            var form = layui.form,
                layer = layui.layer;
            var upload = layui.upload;
            var laydate = layui.laydate;
            //执行一个laydate实例
            laydate.render({
                elem: '#losttime' //指定元素
                ,trigger: 'click'
            });
            //自定义验证规则
            //通过ajax请求向后端获取类型名称数据并渲染到指定select位置
            $.get("<%=request.getContextPath()%>/TypeServlet?op=getAll",{},function (data) {
                var list=data;
                var select=document.getElementById("typeId");
                if(list!=null ){
                    for(var c in list){
                        var option=document.createElement("option");
                        option.setAttribute("value",list[c].g_id);
                        option.innerText=list[c].g_name;
                        select.appendChild(option);
                    }
                }
                form.render("select");
            },"json")

            upload.render({
                elem: '#test10'
                ,url: '<%=request.getContextPath()%>/FoundServlet?op=upload'
                ,done: function(res){
                    layer.msg('上传成功');
                    layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', "<%=basePath%>/images/"+res.msg);
                    //给隐藏域赋值
                    $("#img").val("images/"+res.msg);
                    console.log(res)
                }
            });

            //监听提交
            form.on('submit(add)', function(data){
                /*
                   1、获取输入框的值信息
                   2、通过ajax请求向后端发送请求
                   3、根据响应反馈信息提示，并刷新主页
                 */
                var data=data.field;
                $.ajax({
                    url:"<%=request.getContextPath()%>/FoundServlet?op=AddLost",
                    type:"post",
                    data:data,
                    success:function(result){
                        if(result.code==0){
                            layer.alert("增加成功", {icon: 6},function () {
                                //关闭当前网页
                                parent.window.location.reload();
                            });
                        }else{
                            layer.msg("不好意思，添加失败了...")
                        }
                    }
                })
                // console.log(data);
                // //发异步，把数据提交给php

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
