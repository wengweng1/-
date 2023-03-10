<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="layui/css/layui.css" />
    <link rel="stylesheet" href="css/master.css" />
    <link rel="stylesheet" href="css/gloable.css" />
    <link rel="stylesheet" href="css/nprogress.css" />
    <link rel="stylesheet" href="css/blog.css" />
    <title>详情页面</title>
</head>
<style>
*{
    margin: 0;
    padding: 0;
}
ul,ol{list-style: none;} /*去掉无序列表的小黑点*/
body{
    background-color: rgb(235, 235, 235);

}
.house{
    width: 100%;
    height: 948px;
    background-color: rgb(235, 235, 235);
}
.header{
    width: 100%;
    height: 100px;

    background-color: rgb(255, 255, 255);
}
.detail{
    width: 1200px;
    height: 648px;
    background-color: rgb(255, 255, 255);
    margin:100px auto 0px;
}

.footer{
    width: 100%;
    height: 100px;
    margin-top: 50px;
    background-color: rgb(255, 255, 255);
    display: flex;
    align-items: center;
    justify-content: center;
}
.left{
    width: 600px;
    height: 648px;
    display: flex;
    align-items: center;
    justify-content: center;
    float: left;
}
.left img{
    width: 500px;
    height: 500px;
}
.right{
    width: 600px;
    height: 648px;
    float: left;
}
.layout{
    width: 600px;
    height: 40px;
    /* background-color: rgb(146, 146, 146); */
    line-height: 40px;
    margin-top: 30px;
}
.goodsname{
    margin-top: 90px;
    font-size: 26px;
    color: rgba(255, 103, 0, 1);
}
.btn button{
    width: 80px;
    height: 40px;
    background-color:rgba(255, 103, 0, 1);
    color: aliceblue;
    border: none;
}
.btn button:hover{
    background-color:rgba(255, 103, 0, 0.81);
}
.footer ul{
    width: 1240px;
    height: 50px;
    /* background-color: bisque; */
}
.footer ul li{
    width: 400px;
    height: 50px;
    margin-left: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-bottom: 3px solid rgba(225, 225, 225, 1);
    float: left;
}
.claim{
    width: 400px;
    height: 300px;
    background-color: rgb(240, 240, 240);
    position: absolute;
    margin-left: 41%;
    margin-top: -700px;
    z-index: 2;
    display: none;
}
.clabox{
    width: 380px;
    height: 240px;
    background-color: #fff;
    margin-left: 10px;
    margin-top: 10px;
}
.claimlayout{
    width: 380px;
    height: 50px;
    /* background-color: antiquewhite; */
    line-height: 50px;
    font-size: 20px;
    margin-top: 0px;
    margin-left: 10px;
}
.butn button{
    width: 80px;
    height: 40px;
    background-color:rgba(255, 103, 0, 1);
    color: aliceblue;
    border: none;
    margin-left: 70px;
}
.butn button:hover{
    background-color:rgba(255, 103, 0, 0.81);
}
.clue{
    width: 400px;
    height: 300px;
    background-color: rgb(240, 240, 240);
    position: absolute;
    margin-left: 41%;
    margin-top: -700px;
    z-index: 3;
    display: none;
}
.clue input{
    width: 360px;
    height: 240px;
    margin-left: 20px;
    margin-top: 10px;
}
.clue button{
    width: 80px;
    height: 40px;
    background-color:rgba(255, 103, 0, 1);
    color: aliceblue;
    border: none;
    margin-left: 75px;
    margin-top: 3px;
}
.clue button:hover {
    background-color:rgba(255, 103, 0, 0.81);
}
</style>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<body>
    <div class="house">
            <header class="gird-header">
                <div class="header-fixed">
                  <div class="header-inner">
                    <a href="javascript:void(0)" class="header-logo" id="logo">Lost & Found</a>
              
                    <nav class="nav" id="nav">
                      <ul>
                          <li><a href="index.jsp">首页</a></li>
                          <li><a href="<%=request.getContextPath()%>/LostServlet?op=getlist">失物信息</a></li>
                          <li><a href="<%=request.getContextPath()%>/FoundServlet?op=getlist">招领信息</a></li>
                          <li><a href="AddGoods.jsp">发布</a></li>
                          <c:if test="${empty sessionScope.admin}">
                              <li><a href="<%=request.getContextPath()%>/LostServlet?op=getlistbyname&name=${sessionScope.user[0].u_name}">个人中心</a></li>
                          </c:if>
                          <c:if test="${empty sessionScope.user}">
                              <li><a href="<%=request.getContextPath()%>/LostServlet?op=getlistbyname&name=${sessionScope.admin[0].a_name}">个人中心</a></li>
                          </c:if>
                        <!-- <li><a href="feedback.html">反馈</a></li> -->
                        <!-- <li><a href="notic.html">公告</a></li>-->
                      </ul>
                   </nav>
                    <!-- <div id="hello_user">
                        <a href="logReg.html" class="blog-user" >
                                 <i class="fa fa-qq"></i>
                            <button class="layui-btn layui-btn-primary" >
                                登录 / 注册
                                <i class="layui-icon layui-icon-more-vertical layui-font-12"></i>
                            </button>
                        </a>
                    </div> -->
              
                  </div>
                </div>
            </header>
        <!-- *************************************************************** -->
        <div class="detail">
            <div class="left">
                <img src="<%=basePath%>/${sessionScope.foundGoodsList[0].f_img}" alt="">
            </div>
            <div class="right">
                <div class="layout goodsname">[寻物招领]</div>
                <div class="layout">物品类别:${sessionScope.foundGoodsList[0].f_typename}</div>
                <div class="layout">启事详情:${sessionScope.foundGoodsList[0].f_sort}</div>
                <div class="layout">丢物地点:${sessionScope.foundGoodsList[0].f_place}</div>
                <div class="layout">丢失时间:${sessionScope.foundGoodsList[0].f_time}</div>
                <div class="layout btn">
                    <button onclick="popDiv()">联系归还</button>
                    <!-- <button onclick="clue()">提供线索</button> -->
                </div>
            </div>
        </div>
        <div class="footer">
            <ul>
                <li>友情链接</li>
                <li>关于我们</li>
                <li>联系我们</li>
            </ul>
        </div>
    </div>

    <div id="claim" class="claim">
        <div class="clabox">
            <div class="claimlayout name">联系姓名:${sessionScope.foundGoodsList[0].f_founder}</div>
            <div class="claimlayout phone">联系电话:${sessionScope.foundGoodsList[0].f_telephone}</div>
            <div class="claimlayout address">联系地址:地球</div>
            <div class="claimlayout">请尽快联系失主取回失物</div>
        </div>
        <div class="claimlayout butn">
            <button onclick="closePop()">好的</button>
            <button onclick="closePop()">取消</button>
        </div>
    </div>

    <div id="clue" class="clue">
        <input type="text"><br>
        <button onclick="closeclue()">提交</button>
        <button onclick="closeclue()">取消</button>
    </div>

    <script>
        function popDiv(){
            var popBox = document.getElementById("claim");
            popBox.style.display = "block";
       }
      
       function closePop(){
            let popDiv = document.getElementById("claim");
            popDiv.style.display = "none";
       }
       function clue(){
            var popBox = document.getElementById("clue");
            popBox.style.display = "block";
       }
      
       function closeclue(){
            let popDiv = document.getElementById("clue");
            popDiv.style.display = "none";
       }
    </script>
    <script src="layui/layui.all.js"></script>
    <script src="js/axios.js"></script>
    <script src="js/config.js"></script>

    <script src="layui/layui.js"></script>
    <script src="js/ppl/gloable.js"></script>
    <script src="js/plugins/nprogress.js"></script>
<!--    <script>NProgress.start();</script>-->

<!--&lt;!&ndash;    <script src="js/ppl/article.js"></script>&ndash;&gt;-->
<!--    <script>-->
<!--        window.onload = function () {-->
<!--            NProgress.done();-->
<!--        };-->
<!--    </script>-->

<!-- <script src="js/jquery.min.js"></script>-->
<!-- <script src="js/ppl/common.js"></script>-->
</body>
</html>