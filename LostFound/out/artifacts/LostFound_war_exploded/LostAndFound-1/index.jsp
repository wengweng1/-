<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html lang="zh-Hans-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width" />
    <title>首页</title>
    <link href="layui/css/layui.css" rel="stylesheet" type="text/css">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="css/index_style.css" rel="stylesheet" type="text/css">
    <link href="css/animate.min.css" rel="stylesheet" type="text/css">
    <%
        String basepath=request.getContextPath();
    %>
</head>
<body>
    <div id="menu" class="hover_animation menu_open" data-mark="false">
        <span></span>
        <span></span>
        <span></span>
    </div>
    <div id="navgation" class="navgation navgation_close">
        <ul class="point">
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
<!--            <li><a href="notic.html">公告</a></li>-->
        </ul>
        <div class="logo"><a>Lost&nbsp;&&nbsp;Found</a></div>
    </div>
    <div class="section" id="section1">
        <div class="fp-tablecell">
            <div class="page1">
                <div class="nav wow zoomIn" data-wow-duration="2s">
                    <h1>猜猜我捡到了什么？</h1>
                    <p>新发布了一条失物招领：“我丢了一个她”</p>
                    <a class="layui-btn layui-btn-normal" style="margin-top: 20px" href="<%=basepath%>/LostServlet?op=getlist">Enter Lost&Found</a>
                </div>
                <a class="next wow fadeInUp" data-wow-duration="2s" id="next"></a>
            </div>
        </div>
    </div>
    <div class="section" id="section2">
        <div class="fp-tablecell">
            <div class="page2">
                <div class="warp-box">
                    <div class="new-article">
                        <div class="inner wow fadeInDown" data-wow-delay=".2s">
                            <h1>置顶帖子</h1>
                            <p>
                                如果你遗失/拾取物品十万火急
                                <br>可以联系管理员将其置顶，尽此微薄之力
                            </p>
                        </div>
                    </div>
                    <div class="layui-row" id="indexList">
                        <!-- js输入 -->
<!--                        <div class="layui-col-xs12 layui-col-sm4 layui-col-md4  wow fadeInUp" style="padding: 0 10px">-->
<!--                            <div class="single-news">-->
<!--                                <div class="news-head">-->
<!--                                    <img src="image/no.png">-->
<!--                                    <a href="#" class="link"><i class="fa fa-link"></i></a>-->
<!--                                </div>-->
<!--                                <div class="news-content">-->
<!--                                    <h4>-->
<!--                                        <a href="#">-->
<!--                                            拯救者R9000P丢失，重金悬赏！-->
<!--                                        </a>-->
<!--                                    </h4>-->
<!--                                    <div class="date">-->
<!--                                        2021年8月1日-->
<!--                                    </div>-->
<!--                                    <p>-->
<!--                                        在田径场跑步完发现主席台的电脑不见了，里面有很多珍贵学习资料！球球了-->
<!--                                    </p>-->
<!--                                    <a href="#" class="btn">-->
<!--                                        阅读更多-->
<!--                                    </a>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                        <div class="layui-col-xs12 layui-col-sm4 layui-col-md4  wow fadeInUp" data-wow-delay=".2s" style="padding: 0 10px">-->
<!--                            <div class="single-news">-->
<!--                                <div class="news-head">-->
<!--                                    <img src="image/gongyu.jpg">-->
<!--                                    <a href="#" class="link"><i class="fa fa-link"></i></a>-->
<!--                                </div>-->
<!--                                <div class="news-content">-->
<!--                                    <h4>-->
<!--                                        <a href="#">-->
<!--                                            四级准考证不见了，救急！-->
<!--                                        </a>-->
<!--                                    </h4>-->
<!--                                    <div class="date">-->
<!--                                        2021年8月2日-->
<!--                                    </div>-->
<!--                                    <p>-->
<!--                                        四级准考证不见了，明天考试，十万火急,附上准考证头像-->
<!--                                    </p>-->
<!--                                    <a href="#" class="btn">-->
<!--                                        阅读更多-->
<!--                                    </a>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                        <div class="layui-col-xs12 layui-col-sm4 layui-col-md4  wow fadeInUp" data-wow-delay=".4s" style="padding: 0 10px">-->
<!--                            <div class="single-news">-->
<!--                                <div class="news-head">-->
<!--                                    <img src="image/slk.jpg">-->
<!--                                    <a href="#" class="link"><i class="fa fa-link"></i></a>-->
<!--                                </div>-->
<!--                                <div class="news-content">-->
<!--                                    <h4>-->
<!--                                        <a href="#">-->
<!--                                            斗罗大陆全套手办不见了o(╥﹏╥)o-->
<!--                                        </a>-->
<!--                                    </h4>-->
<!--                                    <div class="date">-->
<!--                                        2021年8月3日-->
<!--                                    </div>-->
<!--                                    <p>-->
<!--                                        史莱克珍贵正版手办不见了，求好心人帮帮忙-->
<!--                                    </p>-->
<!--                                    <a href="#" class="btn">-->
<!--                                        阅读更多-->
<!--                                    </a>-->
<!--                                </div>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="section" id="section3">
        <div class="fp-tablecell">
            <div class="page3">
                <div class="warp-box">
                    <div class="warp">
                        <div class="inner">
                            <div class="links">
                                <ul>
                                    <li class="wow fadeInLeft"><a href="#">关于</a></li>
                                    <li class="wow fadeInRight"><a href="#">+友情链接</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="section" id="section4">
        <div class="fp-tablecell">
            <div class="page4">
                <div class="warp-box">
                    <div class="about">
                        <div class="inner">
                            <h1 class="wow fadeInLeft">FS</h1>
                            <p class="wow fadeInRight">
                                一个励志创新服务大众的团队
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer wow fadeInUp" id="contact">
        <div class="footer-top">
            <div class="container">
                <div class="layui-row">
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                        <div class="single-widget about">
                            <div class="footer-logo">
                                <h2>FS</h2>
                            </div>
                            <p>如此清秋何吝酒，这般明月不需钱!</p>
                            <div class="button">
                                <a href="http://blog.piplong.cn/" target="_blank" class="btn layui-btn layui-btn-normal">About Me</a>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                        <div class="single-widget">
                            <h2>相关链接</h2>
                            <ul class="social-icon">
                                <li class="active"><a href="#"><i class="fa fa-book"></i>博文</a></li>
                                <li class="active"><a href="#"><i class="fa fa-comments"></i>留言</a></li>
                                <li class="active"><a href="#"><i class="fa fa-share"></i>资源</a></li>
                                <li class="active"><a href="#"><i class="fa fa-snowflake-o"></i>日记</a></li>
                                <li class="active"><a href="#"><i class="fa fa-files-o"></i>归档</a></li>
                            </ul>                   
                        </div>
                    </div>
                    <div class="layui-col-xs12 layui-col-sm12 layui-col-md4">
                        <div class="single-widget contact">
                            <h2>联系我</h2>
                            <ul class="list">
                                <li><i class="fa fa-map"></i>地址: 成都职业技术学院</li>
                                <li><i class="fa fa-qq"></i>QQ: 2500432076 </li>
                                <li><i class="fa fa-envelope"></i>邮箱: 2500432076@qq.com</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright">
            <div class="container">
                <div class="layui-row">
                    <div class="layui-col-xs12 layui-col-sm12 layui-col-md12 text-center">
<!--                        <p>Copyright &copy; 2021-2021 嗡嗡 Secondary creation V1.0 蜀ICP备18008600号</p>-->
                    </div>
                </div>
            </div>
        </div>  
    </footer>
    <script src="js/config.js"></script>
    <script src="js/axios.js"></script>
    <script src="layui/layui.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/index.js"></script>

</body>
</html>