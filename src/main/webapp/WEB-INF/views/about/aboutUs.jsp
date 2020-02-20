<%--
  Created by IntelliJ IDEA.
  User: zwz
  Date: 2020/2/10 0010
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
    <head>
        <title>关于我们</title>
    </head>

    <body>
    <!-- 内容主体区域 -->
    <div class="layui-body">

        <div id="content" align="center">

            <%-- 主标题--%>
            <div style="font-size: 45px;color: #1D9D73;margin-top: 30px;" class="text-center">
                <strong>ACM周总结云管理系统 V1.1</strong>
            </div>

            <%-- 副标题--%>
            <p class="text-center">
                <strong style="font-size: 27px;color: #1D9D73;"><br>
                    绍兴文理学院元培学院<br>
                    计算机1701&nbsp;郑为中<br>
                    暨&nbsp;元培ACM实验室&nbsp;2020年度(大三)寒假作业
                </strong>
            </p>

            <img src="<%=basePath%>/static/img/flowchart.png" />

        </div>

    </div>
    </body>
</html>
