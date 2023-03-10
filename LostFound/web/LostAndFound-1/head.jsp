<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="gird-header">
  <div class="header-fixed">
    <div class="header-inner">
      <a href="javascript:void(0)" class="header-logo" id="logo">Lost & Found</a>
<%
  String basebath = request.getContextPath();
%>
      <nav class="nav" id="nav">
        <ul>
          <li><a href="index.jsp">首页</a></li>
          <li><a href="<%=basebath%>/LostServlet?op=getlist">失物信息</a></li>
          <li><a href="<%=basebath%>/FoundServlet?op=getlist">招领信息</a></li>
          <li><a href="AddGoods.jsp">发布</a></li>
        <c:if test="${empty sessionScope.admin}">
          <li><a href="<%=basebath%>/LostServlet?op=getlistbyname&name=${sessionScope.user[0].u_name}">个人中心</a></li>
        </c:if>
        <c:if test="${empty sessionScope.user}">
            <li><a href="<%=basebath%>/LostServlet?op=getlistbyname&name=${sessionScope.admin[0].a_name}">个人中心</a></li>
        </c:if>
          <!-- <li><a href="feedback.html">反馈</a></li> -->
          <!-- <li><a href="notic.html">公告</a></li>-->
        </ul>
      </nav>
    </div>
  </div>
</header>

<script src="js/ppl/head.js"></script>
