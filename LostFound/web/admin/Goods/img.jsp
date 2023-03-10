<%--
  Created by IntelliJ IDEA.
  User: 25004
  Date: 2022/11/29
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
        String img = request.getParameter("img");
    %>
</head>
<body>
<img src="<%=basePath+"/"+img%>" width="100%" height="100%" />
</body>
</html>
