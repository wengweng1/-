<%--
  Created by IntelliJ IDEA.
  User: 25004
  Date: 2022/11/21
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width"/>
    <meta name="author" content="www.yanshisan.cn"/>
    <meta name="robots" content="all"/>
    <title>发布</title>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="layui/css/layui.css"/>
    <link rel="stylesheet" href="css/master.css"/>
    <link rel="stylesheet" href="css/gloable.css"/>
    <link rel="stylesheet" href="css/nprogress.css"/>
    <link rel="stylesheet" href="css/message.css"/>

    <style type="text/css">
        .layui-form-select {
            width: 160px;
        }
        img{
            max-width: 200px;
            max-height: 200px;
            min-height: 100px;
            min-width: 100px;
        }
    </style>
    <%
        String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
    %>
</head>
<body>
<div class="header"></div>
<div class="headerpage"></div>
<div class="doc-container" id="doc-container">
    <div class="container-fixed">
        <div class="container-inner">
            <section class="msg-remark">
                <h1>发布帖子</h1>
                <p>
                    寻物&nbsp;&&nbsp;招领——从这里开始！
                </p>
            </section>

            <form class="layui-form layui-col-space5" enctype= "multipart/form-data" method="post" action="" >
                <input type="hidden" id="img" name="img" >
                <div class="textarea-wrap message" id="from">
                        <div class="layui-form-item layui-form-pane">
                            <label class="layui-form-label">类型选择</label>
                            <div class="layui-input-block" id="flag">
                                <input type="radio" name="flag" value="0" title="失物启事" checked>
                                <input type="radio" name="flag" value="1" title="寻物启示">
                            </div>
                        </div>
                </div>
                <div class="textarea-wrap message" id="type">
                        <div class="layui-form-item layui-form-pane " id="typeDiv">
                             <label class="layui-form-label">物品类型</label>
                             <div class="layui-input-inline">
                            <select name="typeId" id="typeId" lay-verify="required" lay-search="">
                            <option value="">请选择</option>
                            </select>
                             </div>
                        </div>
                </div>
                <div class="textarea-wrap message" id="titles">
                        <div class="layui-form-item layui-form-pane">
                            <label class="layui-form-label">物品名称</label>
                            <div class="layui-input-block">
                                <input type="text" name="goodsname" id="goodsname" lay-verify="goodsname" autocomplete="off"
                                       placeholder="请输入物品名称,不超过20字" class="layui-input" maxlength="21">
                            </div>
                        </div>
                </div>
                <div class="textarea-wrap message" id="photo">
                    <div class="layui-form-item layui-form-pane">
                        <label class="layui-form-label">上传按钮</label>
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
                </div>
                <div class="textarea-wrap message" id="content">
                        <div class="layui-form-item layui-form-text layui-form-pane">
                            <label class="layui-form-label">详细描述</label>
                            <div class="layui-input-block">
                                <textarea name="desc" id="desc" placeholder="今日中午在一教1505遗失电脑转接口一个"
                                          class="layui-textarea"></textarea>
                            </div>
                        </div>
                </div>
                <div class="textarea-wrap message" >
                        <div class="layui-form-item layui-form-pane">
                            <label class="layui-form-label">地点信息</label>
                            <div class="layui-input-block">
                                <input type="text" name="lostaddress" id="lostaddress" lay-verify="address" autocomplete="off"
                                       placeholder="请输入地点信息" class="layui-input">
                            </div>
                        </div>
                </div>
                <div class="textarea-wrap message" id="time">
                <div class="layui-form-item layui-form-pane">
                    <label for="losttime" class="layui-form-label"><span>*</span>时间</label>
                    <div class="layui-input-block">
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input"  autocomplete="off" placeholder="" name="losttime" id="losttime">
                        </div>
                    </div>
                </div>
                </div>
                <div class="textarea-wrap message" id="people">
                <div class="layui-form-item layui-form-pane">
                    <label for="nikename" class="layui-form-label">
                        <span class="x-red">*</span>发布人</label>
                    <div class="layui-input-inline">
                        <c:if test="${empty sessionScope.admin}">
                        <input type="text" disabled id="nikename" name="nikename" value="${sessionScope.user[0].u_name}" required="" lay-verify="nikename" autocomplete="off" class="layui-input">
                        </c:if>
                       <c:if test="${empty sessionScope.user}">
                            <input type="text" disabled id="nikename" name="nikename" value="${sessionScope.admin[0].a_name}" required="" lay-verify="nikename" autocomplete="off" class="layui-input">
                        </c:if>
                    </div>
                    <span class="x-red">*</span></div>
                </div>
                    <div class="layui-form-mid layui-word-aux">
                </div>
                <div class="textarea-wrap message" id="phone1">
                <div class="layui-form-item layui-form-pane">
                    <label for="phone" class="layui-form-label">
                        <span class="x-red">*</span>联系电话</label>
                    <div class="layui-input-inline">
                        <input type="text" id="phone" name="phone" required="" lay-verify="phone"  autocomplete="off" class="layui-input"></div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span></div>
                </div>
                </div>
                <div class="textarea-wrap message " id="button">
                    <div class="actions" style="display: flex;align-items: center;justify-content: center;">
                        <button class="layui-btn" lay-filter="add" lay-submit="">发布</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="f-cb"></div>

    </div>
</div>
<div class="footerpage"></div>

<script src="layui/layui.all.js"></script>
<%--<script src="js/axios.js"></script>--%>
<script src="layui/layui.js"></script>

<%--<script src="js/config.js"></script>--%>
<%--<script src="https://cdn.bootcdn.net/ajax/libs/mustache.js/4.1.0/mustache.js"></script>--%>
<%--<script src="js/ppl/gloable.js"></script>--%>
<%--<script src="js/plugins/nprogress.js"></script>--%>
<%--<!-- <script>NProgress.start();</script> -->--%>
<%--<script src="js/ppl/issue.js"></script>--%>
<!-- <script>NProgress.start();</script> -->
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
                , trigger: 'click'
            });
            //自定义验证规则
            //通过ajax请求向后端获取类型名称数据并渲染到指定select位置
            $.get("<%=request.getContextPath()%>/TypeServlet?op=getAll", {}, function (data) {
                var list = data;
                var select = document.getElementById("typeId");
                if (list != null) {
                    for (var c in list) {
                        var option = document.createElement("option");
                        option.setAttribute("value", list[c].g_id);
                        option.innerText = list[c].g_name;
                        select.appendChild(option);
                    }
                }
                form.render("select");
            }, "json")

            upload.render({
                elem: '#test10'
                , url: '<%=request.getContextPath()%>/LostServlet?op=upload'
                , done: function (res) {
                    layer.msg('上传成功');
                    layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', "<%=basePath%>/images/" + res.msg);
                    //给隐藏域赋值
                    $("#img").val("images/" + res.msg);
                    console.log(res)
                }
            });

            //监听提交
            var isSubmit=false;
            form.on('submit(add)', function (data) {
                if(isSubmit) return false;
                isSubmit=true;
                /*
                   1、获取输入框的值信息
                   2、通过ajax请求向后端发送请求
                   3、根据响应反馈信息提示，并刷新主页
                 */
                var data = data.field;
                if(isSubmit) {
                    $.ajax({
                        url: "<%=request.getContextPath()%>/LostServlet?op=Add",
                        type: "post",
                        data: data,
                        success: function (result) {
                            // alert("发布成功")
                            layer.open({
                                type: 1
                                ,offset: ['200px', '500px'] //具体配置参考：http://doc/modules/layer.html#offset
                                ,id: 'layerDemo'+type //防止重复弹出
                                ,content: '<div style="padding: 20px 100px;">'+ "发布成功" +'</div>'
                                ,btn: '确定'
                                ,btnAlign: 'c' //按钮居中
                                ,shade: 0 //不显示遮罩
                                ,yes: function(){
                                    isSubmit=false;
                                    layer.closeAll();
                                    parent.window.location.reload();
                                }
                            });


                        }
                    })
                }
                    // console.log(data);
                    // //发异步，把数据提交给php
                // return false;
            });
        });
</script>
<script src="js/jquery.min.js"></script>
<script src="js/ppl/common.js"></script>
</body>
</html>