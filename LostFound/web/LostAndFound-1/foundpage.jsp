<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width" />
    <meta name="author" content="blog.piplong.cn" />
    <meta name="robots" content="all" />
    <title>寻物&amp;招领</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="layui/css/layui.css" />
    <link rel="stylesheet" href="css/master.css" />
    <link rel="stylesheet" href="css/gloable.css" />
    <link rel="stylesheet" href="css/nprogress.css" />
    <link rel="stylesheet" href="css/blog.css" />
	<style>
        .btn{
			margin-top: 10px;
			width: 480px;
			height: 150px;
			margin-left: 322px;
			position: absolute;
			z-index: 2;
			background-color: rgba(85, 80, 96,0);
			/* border: 1px solid rgba(68, 68, 68,0.3); */
			line-height: 40px;
			color: rgb(85, 80, 96);
		}
		.style:hover{
			 background-color: rgba(0,0,0,0.1);
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

		    <div class="col-content">

		        <div class="inner">

					<c:forEach var="found" items="${sessionScope.foundGoodsList}">
						<article class="article-list bloglist" id="LAY_bloglist" >
							<!--js插入-->
							<section class="article-item zoomIn article">
								<div class="fc-flag">失物招领</div>
								<h5 class="title" >
								<span >
									<a   class="layui-btn layui-btn-radius layui-btn-sm layer-demolist" href="javascript:;" id="test1${obj.id}" onmouseover="show('test1${obj.id}')" data-tooltip="暂未找到">寻物启事</a>
								</span>

								</h5>
								<div class="time">
									<span class="day">${found.f_time}</span>
								</div>
								<div class="content">

									<a href="detail.jsp?postId=${found.f_id}" target="_blank" class="cover img-light">
										<img src="<%=basePath%>/${found.f_img}" alt="">
									</a>
									<p class="layui-btn layui-btn-primary layui-border-red">地址信息：${found.f_place}</p>
									<br>
									<p  class="btn">&nbsp;&nbsp;&nbsp; 特征展示：${found.f_sort}</p>

								</div>
								<div class="read-more">
									<a href="<%=request.getContextPath()%>/FoundServlet?op=getmessage&postId=${found.f_id}" class="fc-black f-fwb" target="_blank">查看详情</a>
								</div>
								<aside class="f-oh footer">
									<div class="f-fl tags">
										<span class="fa fa-tags fs-16"></span>
										<a class="tag">${found.f_name}</a>
									</div>
									<div class="f-fl tags">
										<i class="layui-icon fa fa-tags fs-16">&#xe60e;</i>
										<a class="tag">${found.f_time}</a>
									</div>
									<div class="f-fr">
										<span class="ml20">
										<i class="fa fa-comments fs-16"></i>
										<a href="javascript:void(0)" class="num fc-grey">${found.f_telephone}</a>
									</span>
									</div>
								</aside>
							</section>
						</article>
					</c:forEach>
		        </div>
		    </div>

		    <div class="col-other">

		        <div class="inner">

					<div class="other-item" id="categoryandsearch">

			    		<div class="search">
					        <label class="search-wrap">
					            <input type="text" name="searchtxt" id="searchtxt" placeholder="输入关键字搜索" />
					            <span class="search-icon">
					                <i class="fa fa-search" onclick="selectPost()"></i>
					            </span>
					        </label>
			        		<ul class="search-result"></ul>
			    		</div>
						
			    		<ul class="category mt20" id="category">
							<c:forEach var="type" items="${sessionScope.typeList1}">
<%--								<li data-index="0" class="slider"></li>--%>
								<li class="style"><a href="<%=request.getContextPath()%>/FoundServlet?op=getbyid&id=${type.g_id}">${type.g_name}</a></li>
							</c:forEach>
			    		</ul>
					</div>
					<!--右边悬浮 平板或手机设备显示-->
					<!-- <div class="category-toggle"><i class="layui-icon">&#xe603;</i></div>
					<div class="article-category">
					    <div class="article-category-title"><i class="tags icon"></i>标签分类</div>
					            <a href="">失物招领</a>
					            <a href="">电脑&amp;手机</a>
					            <a href="">校园卡</a>
					            <a href="">身份证</a>
					            <a href="">其它</a>
					    <div class="f-cb">？123</div>
					</div> -->
					<!--遮罩-->
					<!-- <div class="blog-mask animated layui-hide"></div>
					<div class="other-item">
						<h5 class="other-item-title"><i class="bookmark icon"></i>状态类型</h5>
						<div class="inner">
							<dl class="vistor" id="bqDiv"> -->
								<!--js插入-->

							<!-- </dl>
						</div>
					</div> -->
					<!-- <div class="other-item">
					    <h5 class="other-item-title">最新启示</h5>
					    <div class="inner">
					        <ul class="hot-list-article">
					                <li> <a href="">紧急求助1</a></li>
					                <li> <a href="">紧急求助2</a></li>
					                <li> <a href="">紧急求助3</a></li>
					                <li> <a href="">紧急求助4</a></li>
					                <li> <a href="">紧急求助5</a></li>
					                <li> <a href="">紧急求助6</a></li>

					        </ul>
					    </div>
					</div> -->
					<!-- <div class="other-item">
					    <h5 class="other-item-title">置顶-十万火急</h5>
					    <div class="inner">
					        <ul class="hot-list-article">
					                <li> <a href="">猫不见了</a></li>
					                <li> <a href="">劳力士手表不见了</a></li>
					                <li> <a href="">小保底歪了</a></li>
					        </ul>
					    </div>
					</div> -->

		        </div>
		    </div>
		</div>
    </div>
	<div class="footerpage"></div>
	<script src="layui/layui.all.js"></script>
	<script src="js/axios.js"></script>
	<script src="js/config.js"></script>

    <script src="layui/layui.js"></script>
    <script src="js/ppl/gloable.js"></script>
    <script src="js/plugins/nprogress.js"></script>

<%--	<script src="js/ppl/article.js"></script>--%>

	<script src="js/jquery.min.js"></script>
	<script>$(function(){
		/*公共部分
         * 导航栏
         * footer CopyRight
         */
		$(".headerpage").load("head.jsp");
		$(".footerpage").load("foot.html");
	});</script>
	<script>
		function selectPost(){
			var searchtxt = document.getElementById("searchtxt").value
			console.log(searchtxt)
			$.ajax({
				url:"<%=request.getContextPath()%>/FoundServlet?op=searchtxt&name="+searchtxt,
				type:"post",
				success: function (res) {
					parent.window.location.reload();
				}
			})
		}
	</script>
</body>
</html>
