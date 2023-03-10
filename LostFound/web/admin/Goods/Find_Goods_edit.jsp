<%--
  Created by IntelliJ IDEA.
  User: 25004
  Date: 2022/11/21
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String basePath2=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>页面修改</title>
    <meta name="renderer" content="webkit">
    <%--    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
    <%--    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />--%>
    <link rel="stylesheet" href="<%=basePath%>admin/css/font.css">
    <link rel="stylesheet" href="<%=basePath%>admin/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>admin/js/xadmin.js"></script>
    <script type="text/javascript" src="<%=basePath%>admin/js/cookie.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>


<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form layui-col-space5" enctype= "multipart/form-data" method="post" action="">
            <input type="hidden" id="img" name="img" value="${foundGoods.f_img}">
            <input type="hidden" name="id" value="${foundGoods.f_id}">
            <input type="hidden" name="typeIds" id="typeIds" value="${foundGoods.f_feature}">
            <div class="layui-form-item">
                <label for="goodsname" class="layui-form-label">
                    <span class="x-red">*</span>物品名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="goodsname" name="goodsname" value="${foundGoods.f_name}" required="" autocomplete="off" class="layui-input"></div>
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
                    <textarea placeholder="请输入内容" id="desc" name="desc" class="layui-textarea" >${foundGoods.f_sort}</textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>物品图片
                </label>
                <div class="layui-input-inline">
                    <div class="layui-upload-drag" id="test10">
                        <i class="layui-icon"></i>
                        <p>点击上传，或将图片拖拽到此处修改</p>
                        <div class="layui-hide" id="uploadDemoView">
                            <hr>
                            <img src="<%=basePath2%>/${foundGoods.f_img}" alt="上传成功后渲染" style="max-width: 196px">
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="lostaddress" class="layui-form-label">
                    <span class="x-red">*</span>丢失地点</label>
                <div class="layui-input-inline">
                    <input type="text" id="lostaddress" name="lostaddress" value="${foundGoods.f_place}" required=""  autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span></div>
            </div>
            <div class="layui-form-item">
                <label for="losttime" class="layui-form-label"><span>*</span>丢失时间</label>
                <div class="layui-input-block">
                    <div class="layui-inline layui-show-xs-block">
                        <input class="layui-input"  autocomplete="off" value="${foundGoods.f_time}" placeholder="" name="losttime" id="losttime">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="nikename" class="layui-form-label">
                    <span class="x-red">*</span>发布人</label>
                <div class="layui-input-inline">
                    <input type="text" id="nikename" disabled name="nikename" value="${foundGoods.f_founder}" required="" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span></div>
            </div>
            <div class="layui-form-item">
                <label for="phone" class="layui-form-label">
                    <span class="x-red">*</span>联系电话</label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" name="phone" value="${foundGoods.f_telephone}" lay-verify="phone" required=""  autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span></div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="update" lay-submit="">修改</button></div>
        </form>
    </div>
</div>
<script>
    layui.use(['form','upload', 'layer','laydate'],
        function() {
            $ = layui.jquery;
            var form = layui.form,
                layer = layui.layer;
            var laydate = layui.laydate;
            var upload =layui.upload;
            //执行一个laydate实例
            laydate.render({
                elem: '#losttime' //指定元素
                ,trigger: 'click'
            });
            //通过ajax获取类别返现
            $.get("<%=request.getContextPath()%>/TypeServlet?op=getAll",{},function (data) {
                var list=data;
                var select=document.getElementById("typeId");
                var value=document.getElementById("typeIds").value;
                if(list!=null ){
                    for(var c in list){
                        var option=document.createElement("option");
                        option.setAttribute("value",list[c].g_id);
                        option.innerText=list[c].g_name;
                        select.appendChild(option);
                        if(list[c].g_id==value){
                            option.setAttribute("selected","selected");
                        }
                    }
                }
                form.render("select");
            },"json")

            upload.render({
                elem: '#test10'
                ,url: '<%=basePath%>FoundServlet?op=upload' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
                ,done: function(res){
                    layer.msg('上传成功');
                    layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', "<%=basePath2%>/images/"+res.msg);
                    //给隐藏域赋值
                    $("#img").val("images/"+res.msg);
                    console.log(res)
                }
            });
            //显示图片信息
            layui.$('#uploadDemoView').removeClass('layui-hide')
            //监听提交
            //监听提交
            form.on('submit(update)', function(data){
                /*
                   1、获取输入框的值信息
                   2、通过ajax请求向后端发送请求
                   3、根据响应反馈信息提示，并刷新主页
                 */
                var data=data.field;
                $.ajax({
                    url:"<%=basePath%>/FoundServlet?op=update",
                    type:"post",
                    data:data,
                    success:function(result){
                        if(result.code==0){
                            layer.alert("修改成功", {icon: 6},function () {
                                //关闭当前frame并且刷新
                                parent.window.location.reload();
                            });
                        }else{
                            layer.msg("不好意思，修改失败了...")
                        }
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
