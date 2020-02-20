<%--
  Created by IntelliJ IDEA.
  User: zwz
  Date: 2020/2/10 0010
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%--
    周总结插入成功之后打开的页面
--%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/layui.css"/>
</head>
    <body>

        <div class="container">

            <br><br>

            <h1 align="center">${message}</h1>

            <br><br><hr><br><br>

            <p>
                <h2 align="center">请点击左边选项卡返回</h2>
            </p>

        </div>

    </body>
</html>

<script>

    function toSummaryManage() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/summary/toSummaryManage.do\" width=\"100%\" height=\"100%\"></object>";
    }

</script>