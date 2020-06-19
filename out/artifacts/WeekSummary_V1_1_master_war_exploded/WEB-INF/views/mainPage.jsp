<%--
  Created by IntelliJ IDEA.
  User: zwz
  Date: 2020/2/10 0010
  Time: 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//    request.getSchema()可以返回当前页面使用的协议:  http
//    request.getServerName()可以返回当前页面所在的服务器的名字:  localhost
//    request.getServerPort()可以返回当前页面所在的服务器使用的端口: 8080;
//    request.getContextPath()可以返回当前页面所在的应用的名字.如 http://localhost:8080/zwz/hello.jsp返回 /zwz

    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;

//    获取现在的系统时间
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String nowDate = sdf.format(date);
%>

<%--

            主界面 当登入界面  登入成功之后  会跳转到该主界面

--%>

<html>

    <head>
        <%-- 网页标题--%>
        <title>周总结云系统</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <%-- 导入CSS、JS文件--%>
            <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
            <link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css"/>
            <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>


    </head>

    <body class="layui-layout-body">

        <%-- body的唯一子div--%>
        <div class="layui-layout layui-layout-admin">

<%--  =================================  分割线  ================================= --%>

            <%--  头部标题栏 显示标题和下拉框--%>
            <div class="layui-header">

                <%-- 第一部分 绿字--%>
                <div class="layui-logo" style="font-size: 17px;">
                    <strong>ACM&nbsp;周总结云盘</strong>
                </div>

                <%-- 第二部分 白字--%>
                <ul class="layui-nav layui-layout-left">
                    <li class="layui-nav-item"><a href="<%=basePath%>/users/page.do" style="text-decoration: none;"><strong>首页</strong></a></li>
                </ul>

                <%--第三部分 三个下拉框--%>
                <ul class="layui-nav layui-layout-right">
                    <li class="layui-nav-item">
                        <a href="javascript:;" style="text-decoration: none;">
                            <img src="<%=basePath%>/static/img/avatar.jpg" class="layui-nav-img">
                            <strong>${sessionScope.name}</strong>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a onclick="alert('敬请期待!');" style="text-decoration: none;"><strong>基本资料</strong></a></dd>
                            <dd><a onclick="alert('敬请期待!');" style="text-decoration: none;"><strong>安全设置</strong></a></dd>
                            <hr/>
                            <dd><a href="<%=basePath%>/users/outLogin.do" style="text-decoration: none;;"><strong>退出登录</strong></a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a style="text-decoration: none">
                            <span class="fa fa-github"></span>
                            <strong>关于作者</strong>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="https://blog.csdn.net/qq_41464123" target="_blank" style="text-decoration: none;"><strong>CSDN博客</strong></a></dd>
                            <hr/>
                            <dd><a href="https://github.com/yuyaozwz" target="_blank" style="text-decoration: none;"><strong>github</strong></a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item"><a href="<%=basePath%>/users/outLogin.do" style="text-decoration: none;;"><strong>退出</strong></a></li>
                </ul>

            </div>
            <%-- 头部标题栏结束--%>

<%--  =================================  分割线  ================================= --%>

            <%--    主页左侧选项卡区域 --%>
            <div class="layui-side layui-bg-black">
                <div class="layui-side-scroll">

                    <ul class="layui-nav layui-nav-tree"  lay-filter="test">

                        <%-- 大类1 文章管理--%>
                        <li class="layui-nav-item">
                            <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;周总结管理</strong></a>
                            <dl class="layui-nav-child">
                                <dd><a href="javascript:;" onclick="javascript: toSummaryManage();" style="text-decoration: none;"><strong>周总结列表</strong></a></dd>
                                <dd><a href="javascript:;" onclick="javascript: toSummaryWrite();" style="text-decoration: none;"><strong>周总结撰写</strong></a></dd>
                                <dd><a href="javascript:;" onclick="javascript: toSummaryTrash();" style="text-decoration: none;"><strong>回收站</strong></a></dd>
                            </dl>
                        </li>

                        <%-- 大类2 关于我们--%>
                        <li class="layui-nav-item">
                            <a href="javascript:;"  onclick="javascript: toAboutUs();" style="text-decoration: none;"><strong><span class="fa fa-twitter fa-fw"></span>&nbsp;&nbsp;&nbsp;关于我们</strong></a>
                        </li>

                        <%-- 大类3 项目指南--%>
                        <li class="layui-nav-item">
                            <a href="javascript:;"  onclick="javascript: toCallUs();" style="text-decoration: none;"><strong><span class="fa fa-send-o fa-fw"></span>&nbsp;&nbsp;&nbsp;项目指南</strong></a>
                        </li>

                    </ul>

                </div>
            </div>
            <%--  左侧区域结束--%>

<%--  =================================  分割线  ================================= --%>

            <!-- 内容主体区域 -->
            <div class="layui-body">

                <div id="content">

                    <%-- 主标题--%>
                    <div style="font-size: 45px;color: #1D9D73;margin-top: 250px;" class="text-center">
                        <strong>元培ACM实验室&nbsp;&nbsp;&nbsp;周总结云管理系统 V1.1</strong>
                    </div>
                    <br><br>
                    <%-- 副标题--%>
                    <p class="text-center">
                        <strong style="color: #1D9D73;"><br>不积跬步,无以至千里,不积小流,无以成江海。<br><br>将来的你,一定会感激现在努力的自己!</strong>
                    </p>

                </div>

            </div>

            <%-- 底部区域--%>
            <div class="layui-footer">
                <!-- 底部固定区域 -->
                <strong>© 绍兴文理学院元培学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---->&nbsp;&nbsp;&nbsp;&nbsp;计算机1701 郑为中&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---->&nbsp;&nbsp;&nbsp;完成时间:2020年2月</strong>
                <strong class="layui-layout-right">当前系统日期：<%=nowDate%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
            </div>

        </div>

    </body>

    <script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
    <script src="<%=basePath%>/static/layui/layui.js"></script>
    <script src="<%=basePath%>/static/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        // 获取菜单列表
        layui.use('element', function(){
            var element = layui.element;
        });

        // 这三个方法用于点击左侧 文章列表 等选项卡 的时候, 主页面 跳转到相应的内容
        function toSummaryWrite() {
            document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/summary/toSummaryWrite.do\" width=\"100%\" height=\"100%\"></object>";
        }
        function toSummaryManage() {
            document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/summary/toSummaryManage.do\" width=\"100%\" height=\"100%\"></object>";
        }
        function toSummaryTrash() {
            document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/summary/toSummaryTrash.do\" width=\"100%\" height=\"100%\"></object>";
        }
        function toAboutUs() {
            document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/summary/toAboutUs.do\" width=\"100%\" height=\"100%\"></object>";
        }
        function toCallUs() {
            document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/summary/toCallUs.do\" width=\"100%\" height=\"100%\"></object>";
        }
    </script>

</html>