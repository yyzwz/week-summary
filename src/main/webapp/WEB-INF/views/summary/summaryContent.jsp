<%--
  Created by IntelliJ IDEA.
  User: zwz
  Date: 2020/2/10 0010
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    Date date = new Date();
    String nowDate = sdf.format(date);
%>

<%--

            单篇周总结的查看详细功能

            通过周总结列表中  单篇周总结的查看按钮进入

            通过SummaryController.java的toSummaryView()方法返回模型

--%>
<html>

    <head>
        <title>文章详情</title>

        <%--  导入CSS、JS文件--%>
        <link rel="stylesheet" href="<%=basePath%>/static/css/layui.css"/>
        <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="<%=basePath%>/static/editormd/editormd.min.css"/>
        <script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
        <script src="<%=basePath%>/static/layui/layui.js"></script>
        <!-- Markdwon富文本 -->v
        <script src="<%=basePath%>/static/editormd/lib/marked.min.js"></script>
        <script src="<%=basePath%>/static/editormd/lib/prettify.min.js"></script>
        <script src="<%=basePath%>/static/editormd/lib/raphael.min.js"></script>
        <script src="<%=basePath%>/static/editormd/lib/underscore.min.js"></script>
        <script src="<%=basePath%>/static/editormd/lib/sequence-diagram.min.js"></script>
        <script src="<%=basePath%>/static/editormd/lib/flowchart.min.js"></script>
        <script src="<%=basePath%>/static/editormd/lib/jquery.flowchart.min.js"></script>
        <script src="<%=basePath%>/static/editormd/editormd.min.js"></script>

    </head>

    <body>
        <div class="container" style="width:80%;">

            <br/><br/>

            <%--文章标题--%>
            <h3><center>『 ${summary.s_intro} 』</center></h3>
            <br/>

            <%--文章内容--%>
            <div id="content">
                <textarea>${summary.s_content}</textarea>
            </div>
            <hr style="height: 3px;border: none;background-color: #ddd;background-image: repeating-linear-gradient(-45deg, #fff, #fff 4px, transparent 4px, transparent 8px);"/>


            <%--文章三个属性div--%>
            <div style="border-left: 3px solid #f44336;"><br/>

                <%--作者--%>
                <div style="margin-bottom:8px;">
                     &nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-size:18px;">本文作者：&nbsp;&nbsp;</strong>
                     <span style="font-size:16px;">${summary.s_author}</span>
                </div>

                <%--发表时间--%>
                <div style="margin-bottom:8px;">
                    &nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-size:18px;">发表时间：&nbsp;&nbsp;</strong>
                    <span style="font-size:16px;">${summary.s_date}</span>
                </div>

                <%--版权--%>
                <div>
                    &nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-size:18px;">版权声明：&nbsp;&nbsp;</strong>
                    <span style="font-size:16px;">本项目所有解释权归<strong>郑为中</strong>所有</span>
                </div><br/>

            </div>

            <br/><br/><br/><br/><br/><br/><br/><br/>

        </div>
    </body>

    <script type="text/javascript">
        layui.use('element', function () {
            var element = layui.element;
        });

        // Markdown富文本
        var markdown;
        $(function(){
            markdown = editormd.markdownToHTML('content',{
                htmlDecode: "style,script,iframe",
                syncScrolling: 'single',
                emoji: true,
                taskList: true,
                tex: true,
                flowChart: true,
                sequenceDiagram: true,
                codeFold: true
            });
        });

    </script>

</html>
