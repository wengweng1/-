<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">

  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.1</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <script type="text/javascript" src="../js/cookie.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body class="">
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="demoTable">

        <div class="layui-inline">
          <input class="layui-input" name="user_name" placeholder="搜索用户名" id="user_name" autocomplete="off">
        </div>
        <button class="layui-btn"  data-type="reload">搜索</button>
      </div>
      <table class="layui-table" lay-data="{url:'<%=request.getContextPath()%>/DataServlet',page:true,toolbar: '#toolbarDemo',id:'test'}" lay-filter="test">
        <thead>
          <tr>
            <th lay-data="{type:'checkbox'}">ID</th>
            <th lay-data="{field:'u_id', width:80, sort: true}">ID</th>
            <th lay-data="{field:'u_name', width:120, sort: true, }">用户名</th>
            <th lay-data="{field:'u_telephone',minWidth: 100}">手机</th>
            <th lay-data="{field:'u_email',minWidth: 150}">邮箱</th>
            <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}">操作</th>
          </tr>
        </thead>
      </table>
    </div>
    <script type="text/html" id="barDemo">
      <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
      <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <script type="text/html" id="toolbarDemo">
      <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
        <button class="layui-btn layui-btn-danger" lay-event="getCheckData"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="xadmin.open('添加用户','./user_add.jsp',600,400)"><i class="layui-icon"></i>添加</button>
      </div>
    </script>
    <script>
      layui.use(['table','form'], function(){
        var form = layui.form;
        var table =layui.table;
        var $ = layui.$, active = {
          reload: function(){
            var user_name = $('#user_name');
            //执行重载
            table.reload('test', {
              page: {
                curr: 1 //重新从第 1 页开始
              }
              ,where: {
                  user_name: user_name.val()
              }
            },'data');
          }
        };
        $('.demoTable .layui-btn').on('click', function(){
          var type = $(this).data('type');
          active[type] ? active[type].call(this) : '';
        });
      });
    </script>
    <script>
    layui.use('table', function(){
      var table = layui.table;
      //得到数组id
      function getCheakIds(data){
        var arr = new Array();
        for (var i=0;i<data.length;i++){
          arr.push(data[i].u_id)
        }
        return arr.join(",")
      }
      function deletedByid(ids,index){
        $.ajax({
          url: '<%=request.getContextPath()%>/DataServlet?op=DeletedUser',
          type: 'post',
          traditional: true,  //这里设置为true
          data: {ids:ids},
          success: function (res) {
            layer.alert("删除成功", {icon: 6},function () {
              parent.window.location.reload();
            });
          }
        })
      }
      //头工具栏事件
      table.on('toolbar(test)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
          case 'getCheckData':
            var data = checkStatus.data;
            if (data.length==0){
              layer.msg("请选择你要删除的记录信息...")
            }
            else {
              var ids=getCheakIds(data)
              layer.confirm("您确定要删除吗？",function (index){
                  deletedByid(ids,index)
              })
            }
          break;
          case 'getCheckLength':
            var data = checkStatus.data;
            layer.msg('选中了：'+ data.length + ' 个');
          break;
          case 'isAll':
            layer.msg(checkStatus.isAll ? '全选': '未全选');
          break;
        };
      });
      //监听行工具事件
      table.on('tool(test)', function(obj){
        var data = obj.data;
        //console.log(obj)
        if(obj.event === 'del'){
          layer.confirm('真的删除行么?', function(index){
            //这里调用删除功能即可
            deletedByid(data.u_id,index);
            // layer.close(index);
          });
        } else if(obj.event === 'edit'){
          var index = layer.open({
            title: '修改账号',
            type: 2,
            shade: 0.2,
            shadeClose: true,
            maxmin : true,
            area: ['60%', '70%'],
            content: 'user_edit.jsp?id='+data.u_id,
          });
          $(window).on("resize", function () {
            layer.full(index);
          });
        }
      });
    });
    </script>
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>

</html>