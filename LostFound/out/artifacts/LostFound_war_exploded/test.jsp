<%--
  Created by IntelliJ IDEA.
  User: 25004
  Date: 2022/11/24
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<script>
    function bb(){
        var waa = document.getElementsByName("aa")
        var str = [];
        for (i in waa){
            if (waa[i].checked){
                str.push(waa[i].value);
            }
        }
        $.ajax({
            url: '<%=request.getContextPath()%>/servlet',
            type: 'post',
            traditional: true,  //这里设置为true
                data: {
                    "id": str
                },
            success: function (res) {
                alert("请求成功")
            }
        })
    }

</script>
<input type="checkbox" name="aa" value="1">
<input type="checkbox" name="aa" value="2">
<input type="checkbox" name="aa" value="3">
<input type="checkbox" name="aa" value="4">
<button onclick="bb()">按钮</button>
</body>
</html>
