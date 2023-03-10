<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.bootcdn.net/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <title>个人中心</title>
</head>
<style>
*{
    margin: 0;
    padding: 0;
}
ul,ol{list-style: none;} /*去掉无序列表的小黑点*/
a{text-decoration: none;color: #fff;}
a:link{color: rgb(0, 0, 0);}
a:active {color: rgb(0, 0, 0);}
a:hover{color: rgba(0, 0, 0, 0.6);}

.house{
    width: 100%;
    height: 2800px;
}

.headhouse{
    width: 100%;
    height: 1000px;
    /* background-color: aquamarine; */
    background: url('./img/bg9.jpg')  no-repeat ;
    background-size: 100% 100%
    /* background: 100% 100%; */
}
.headbox{
    width: 100%;
    height: 300px;
    background-color: rgba(24, 25, 57, 0);
}
.header{
    width: 100%;
    height: 60px;
    /* background-color: #fff; */
}
.header>ul:nth-child(1){
    width: 720px;
    height: 60px;
    float: left;
}
.header>ul:nth-child(1) li{
    width: 120px;
    height: 60px;
    display: flex;
    align-items: center;
    justify-content: center;
    float: left;
    color: #fff;
}
.header>ul:nth-child(1) li:nth-child(1){
    font-size: 30px;
}
.header>ul:nth-child(2){
    width: 360px;
    height: 60px;
    margin-left: 600px;
    float: left;
}
.header>ul:nth-child(2)>li{
    width: 120px;
    height: 60px;
    display: flex;
    align-items: center;
    justify-content: center;
    float: left;
    color: #fff;
}
.header>ul:nth-child(2)>li:nth-child(2),.header>ul:nth-child(2)>li:nth-child(3){
    font-size: 30px;
}


.headfoot{
    width: 100%;
    height: 700px;
    background-color: rgba(29, 26, 43, 0);
    display: flex;
    align-items: center;
    justify-content: center;
    /* background-image: -webkit-linear-gradient(135deg, hwb(172 29% 11%) 0%, #9920ed 100%); */
    transition: .8s;
}

.circlebox{
    width: 300px;
    height: 300px;
    position: absolute;
    z-index: 2;
    background-color: rgba(136, 169, 198,0);
    margin-left: 41%;
    margin-top: -800px;
}
.circle{
    width: 100px;
    height: 100px;
    background-color: rgba(255, 255, 255,0);
    margin-left: 100px;
    margin-top: 50px;
    border-radius: 90px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 76px;
    color: rgb(255, 255, 255);
    border: 1px solid #fff;

}
.id{
    margin-top: 20px;
    width: 160px;
    height: 40px;
    background-color: rgba(255, 255, 255,0);
    margin-left: 70px;
    border-radius: 90px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
    border: 1px solid #fff;
}
/* .headfoot>div:nth-child(1){
    width: 100%;
    height: 1px;
} */
.footicobox{
    width: 100%;
    height: 220px;
    /* margin-left: 340px; */
    margin-top: 100px;
    transition: .8s;
    /* background-image: -webkit-linear-gradient(135deg, hwb(172 29% 11%) 0%, #9920ed 100%); */
}
.call{
    width: 100%;
    height: 60px;
    display: flex;
    align-items: center;
    justify-content: center;
    /* background-image: -webkit-linear-gradient(135deg, hwb(172 29% 11%) 0%, #9920ed 100%); */
    color: rgb(68, 67, 67);
    font-size: 40px;
}
.footicobox>div:nth-child(2){
    width: 100%;
    height: 100px;
    /* background-color: #fff; */
    display: flex;
    align-items: center;
    justify-content: center;
}
.footicobox>div:nth-child(2)>div:nth-child(1){
    margin-left: -0px;
}

.footicobox>div:nth-child(3){
    width: 100%;
    height: 60px;
    display: flex;
    align-items: center;
    justify-content: center;
    /* background-color: rgb(239, 180, 180); */
}
.ico{
    width: 62px;
    height: 62px;
    float: left;
    margin-left: 155px;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 1px solid rgb(138, 138, 138);
    color: rgb(66, 66, 66);
    font-size: 36px;
    transition: .4s;
}
.ico:hover{
    background-image: -webkit-linear-gradient(135deg, hwb(172 29% 11%) 0%, #9920ed 100%);
    color: rgb(255, 255, 255);
}
.word{
    width: 230px;
    height: 40px;
    margin-left: 10px;
    /* background-color: #9920ed; */
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
}
.losthouse{
    width: 100%;
    height: 800px;
    /* background-color: rgba(245, 245, 245, 1); */
    background: url('./img/bg9.jpg')  no-repeat ;
    background-size: 100% 100%
}
.losthead{
    width: 100%;
    height: 60px;
}
.losthead>div{
    float: left;
}
.lr{
    width: 40%;
    height: 2px;
    background-color: rgb(181, 178, 178);
    margin-top: 29px;
}
.mid{
    width: 20%;
    height: 60px;
    background-color: #859185;
    display: flex;
    align-items: center;
    justify-content: center;
    color: rgb(237, 237, 237);
    font-size: 26px;
}
.lostgoodshouse{
    width: 1200px;
    height: 742px;
    background-color: rgba(255, 255, 255,0);
    /* border: 1px solid rgba(255, 255, 255,1); */
    margin: 0px auto 0px;
}
.goods{
    width: 280px;
    height: 360px;
    margin-left: 10px;
    margin-top: 8px;
    background-color: rgba(106,117,113,0.5);
    float: left;
    transition: 0.8s;
}
.goods:hover{
    transform: scale(1.02,1.04);
}
.goods img{
    width: 210px;
    height: 210px;
    margin-left: 35px;
}
.goodsname{
    width: 270px;
    height: 40px;
    /* background-color: #7d7980; */
    font-size: 24px;
    line-height: 40px;
    color: rgb(255, 255, 255);
    margin-left: 5px;
    float: left;
}
.feature{
    width: 270px;
    height: 70px;
    line-height: 35px;
    font-size: 16px;
    margin-left: 5px;
    color : #ffffff;
    /* background-color: #9920ed; */
    float: left;
}
.time{
    width: 100px;
    height: 30px;
    /* background-color: #9920ed; */
    display: flex;
    align-items: center;
    justify-content: center;
    float: left;
}
.detail{
    width: 60px;
    height: 30px;
    background-color: rgb(134, 187, 211);
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-left: 20px;
    float: left;
    border: none;
}
.footer{
    width: 1676px;
    height: 300px;
    background-color: rgb(63,63, 63);
}
.footer.footer div:nth-child(1){
    width: 1676px;
    height: 1px;
}
.footer div:nth-child(2){
    width: 400px;
    height: 60px;
    /* background-color: #000; */
    margin: 0px auto;
    list-style: none; 
    margin-top: 60px;
}
.footer div:nth-child(2) li{
    width: 60px;
    height: 60px;
    /* background-color: #000; */
    float: left;
    margin-left: 56px;
    display: flex;
    align-items: center;
    justify-content: center;/*居中*/
    font-size: 48px;
    color: #fff;
}
.footer div:nth-child(3){
    width: 400px;
    height: 100px;
    /* background-color: #000; */
    margin: 0px auto;
    list-style: none;
    margin-top: 20px;
}
.footer div:nth-child(3) li{
    /* background-color: #000; */
    width: 400px;
    height: 30px;
    margin-top: 20px;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;/*居中*/
    font-size: 20px;
}

.fa-outdent:hover{
    color: rgba(255, 255, 255,0.81);
}
.outdent ul{
    width: 120px;
    height: 120px;
    background-color: #fff;
    position: absolute;
    z-index: 2;
    margin-top: 180px;
    margin-left: -0px;
    font-size: 16px;
    display: none;
}
.outdent:hover ul{
    display: block;
}
.outdent li{
    width: 120px;
    height: 40px;
    font-size: 16px;
    color: rgba(4, 4, 4,0.9);
    /* background-color: #b9b2bf; */
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 10px;
}
.outdent li:hover{
    background-color: rgba(201, 195, 195, 0.81);
}
.lit a{
    color: #000;
}
</style>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<body>
    <div class="house">

        <div class="headhouse">

            <div class="headbox"> 
                <div class="header">
                    <ul>
                        <li><i class="fa fa-circle-o-notch" aria-hidden="true"></i></li>
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
                     </ul>
                     <ul>
                        <li>2022 SHOW</li>
                        <li><i class="fa fa-american-sign-language-interpreting" aria-hidden="true"></i></li>
                        
                        <li class="outdent">
                            <i class="fa fa-outdent" aria-hidden="true"></i>
                            <ul>
                                <li class="lit"><a href="<%=request.getContextPath()%>/LoginServlet?opr=tuichu">切换账号</a> </li>
                                <c:if test="${empty sessionScope.admin}">
                                    <li class="lit"><a href="javascript:void(0)" onclick="xiugai(${sessionScope.user[0].u_id})">修改密码</a> </li>
                                </c:if>
                                <c:if test="${empty sessionScope.user}">
                                    <li class="lit"><a href="javascript:void(0)" onclick="xiugai(${sessionScope.user[0].u_id})">修改密码</a> </li>
                                </c:if>
                            </ul>
                        </li>
                     </ul>
                </div>

            </div>

            <div class="headfoot">
                <div class="footicobox">
                    <div class="call"> CONTACT WAY</div>
                    <div>
<!--                        <div class="ico"><i class="fa fa-quora" aria-hidden="true"></i></div>-->
                        <div class="ico"><i class="fa fa-volume-control-phone" aria-hidden="true"></i></div>
                        <div class="ico"><i class="fa fa-optin-monster" aria-hidden="true"></i></div>
                    </div>
                    <div>
<!--                        <p class="word QQ">QQ:2500432076</p>-->
                        <c:if test="${empty sessionScope.admin}">
                        <p class="word phone">Tel:${sessionScope.user[0].u_telephone}</p>
                        <p class="word Email">Email:${sessionScope.user[0].u_email}</p>
                        </c:if>
                        <c:if test="${empty sessionScope.user}">
                            <p class="word phone">Tel:${sessionScope.admin[0].a_telephone}</p>
                            <p class="word Email">Email:${sessionScope.admin[0].a_email}</p>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="circlebox">
                <div class="circle"><i class="fa fa-user-o" aria-hidden="true"></i></div>
                <c:if test="${empty sessionScope.admin}">
                    <div class="id">${sessionScope.user[0].u_name}</div>
                </c:if>
                <c:if test="${empty sessionScope.user}">
                    <div class="id">${sessionScope.admin[0].a_name}</div>
                </c:if>
            </div>

        </div>
        <!-- /******************************************************/ -->

        <div class="losthouse">

            <div class="losthead">
                <div class="lr"></div>
                <div class="mid">我丢失的物品</div>
                <div class="lr"></div>
            </div>

            <div class="lostgoodshouse" >
                <c:forEach var="foundGoodsList2" items="${sessionScope.foundGoodsList2}">
                <div class="goods">
                    <img src="<%=basePath%>/${foundGoodsList2.f_img}" onclick="window.location.href='<%=request.getContextPath()%>/FoundServlet?op=getmessage&postId=${foundGoodsList2.f_id}'">
                    <div class="goodsname">[丢失]:${foundGoodsList2.f_name}</div>
                    <div class="feature">描述:${foundGoodsList2.f_sort}</div>
                    <div class="time">${foundGoodsList2.f_time}</div>
                    <button type="button" class="detail" onclick="bianji1(${foundGoodsList2.f_id})">修改</button>
                    <c:if test="${empty sessionScope.admin}">
                    <button class="detail" onclick="deleted1(${foundGoodsList2.f_id},'${sessionScope.user[0].u_name}')">删除</button>
                    </c:if>
                    <c:if test="${empty sessionScope.user}">
                        <button class="detail" onclick="deleted1(${foundGoodsList2.f_id},'${sessionScope.admin[0].a_name}')">删除</button>
                    </c:if>
                </div>
                </c:forEach>
<%--                <div class="goods"></div>--%>
<%--                <div class="goods"></div>--%>
<%--                <div class="goods"></div>--%>
<%--                <div class="goods"></div>--%>
<%--                <div class="goods"></div>--%>
<%--                <div class="goods"></div>--%>
<%--                <div class="goods"></div>--%>
            </div>
        </div>

        <div class="losthouse foundhouse">

            <div class="losthead  foundhead">
                <div class="lr"></div>
                <div class="mid">我发现的物品</div>
                <div class="lr"></div>
            </div>

            <div class="lostgoodshouse foundgoodshouse" >
                <c:forEach var="LostGoods" items="${sessionScope.lostGoodsList2}">
                <div class="goods">
                    <input id="id" hidden="hidden" value="${LostGoods.i_id}">
                    <img src="<%=basePath%>/${LostGoods.i_img}" onclick="window.location.href='<%=request.getContextPath()%>/LostServlet?op=getmessage&postId=${LostGoods.i_id}'">
                    <div class="goodsname">[招领]:${LostGoods.i_name}</div>
                    <div class="feature">特征:${LostGoods.i_sort}</div>
                    <div class="time">${LostGoods.i_time}</div>
                    <button class="detail"onclick="bianji(${LostGoods.i_id})">修改</button>
                    <c:if test="${empty sessionScope.admin}">
                        <button class="detail" onclick="deleted(${LostGoods.i_id},'${sessionScope.user[0].u_name}')">删除</button>
                    </c:if>
                    <c:if test="${empty sessionScope.user}">
                        <button class="detail" onclick="deleted(${LostGoods.i_id},'${sessionScope.admin[0].a_name}')">删除</button>
                    </c:if>
                    <!-- <button class="detail"><a href="detail.jsp">查看详情</a></button> -->
                </div>
                </c:forEach>
            </div>
        </div>

        <div class="footer">
            <div></div>
            <div>
                <li><i class="fa fa-telegram" aria-hidden="true"></i></li>
                <li><i class="fa fa-bars" aria-hidden="true"></i></li>
                <li><i class="fa fa-refresh" aria-hidden="true"></i></li>
            </div>
            <div>
                <li>we promise.</li>
                <li>we are eager to serve to every customer.</li>
            </div>
        </div>
    </div>
    <script src="layui/layui.all.js"></script>
    <script src="layui/layui.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script>
    function deleted(id,name){
        alert("确定删除吗？")
        var id=id;
        var name=name
        $.ajax({
            url:"<%=request.getContextPath()%>/LostServlet?op=Deleted1&ids="+id+"&name="+name,
            type:"post",
            success:function (){
                alert("删除成功")
                parent.window.location.reload();

            }
        })
    }
    function deleted1(id,name){
        alert("确定删除吗？")
        var id=id;
        var name=name
        $.ajax({
            url:"<%=request.getContextPath()%>/FoundServlet?op=Deleted1&name="+name+"&ids="+id,
            type:"post",
            success:function (){
                alert("删除成功")
                parent.window.location.reload();
            }
        })
    }
    function xiugai(id) {
        layui.use(['layer'], function () {
            var layer = layui.layer
            layer.open({
                title: '修改账号',
                type: 2,
                shade: 0.2,
                maxmin: true,
                shadeClose: true,
                offset:[70,350],
                area: ['60%', '70%'],
                content: 'useredit.jsp?id=' + id,
            });
            $(window).on("resize", function () {
                layer.full(index);
            });
        })
    }
    function bianji(id){
        debugger
        layui.use(['layer'], function () {
            var layer = layui.layer
            layer.open({
                title: '修改物品信息',
                type: 2,
                shade: 0.2,
                maxmin: true,
                shadeClose: true,
                offset:[70,350],
                area: ['60%', '70%'],
                content: '<%=request.getContextPath()%>/LostServlet?op=getByid&id=' + id,
            });
        })
    }
    function bianji1(id){
        layui.use(['layer'], function () {
            var layer = layui.layer
            layer.open({
                title: '修改物品信息',
                type: 2,
                shade: 0.2,
                maxmin: true,
                shadeClose: true,
                offset:[70,350],
                area: ['60%', '70%'],
                content: '<%=request.getContextPath()%>/FoundServlet?op=getByid&id=' + id,
            });
        })
    }
</script>

</body>
</html>