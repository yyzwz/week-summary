<%--
  Created by IntelliJ IDEA.
  User: zwz
  Date: 2020/2/10 0010
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();
    String nowDate = sdf.format(date);
%>
<%--

        周总结草稿页面

        在主界面Page.jsp的 主体部分调用

        通过SummaryController.java的toSummaryWrite()方法返回模型

--%>
<html>

    <head>
        <title>Title</title>
        <link rel="stylesheet" href="<%=basePath%>/static/css/layui.css"/>
        <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="<%=basePath%>/static/editormd/editormd.min.css"/>

    </head>

    <body>
        <div class="container" style="width:80%;">

            <%-- 标题--%>
            <div style="margin-top: 60px;">
                <fieldset class="layui-elem-field layui-field-title">
                    <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 130px;border-bottom: none;">
                        <strong>周总结撰写</strong>
                    </legend>
                </fieldset>
            </div><br/>

            <!-- 编辑器的表单 -->
            <div class="layui-form">
                <form action="<%=basePath%>/" method="post">

                    <%--   1. 周总结作者    发布日期--%>
                    <div class="layui-inline" style="margin-left: -10px;">
                        <label class="layui-form-label" style="padding-left: 0;"><strong>作者</strong></label>
                        <div class="layui-input-inline" style="margin-left:-255px;">
                            <input type="text" name="s_author" id="s_author" value="${sessionScope.name}" class="layui-input"/>
                        </div>
                        <label class="layui-form-label" style="margin-left:169px;padding-left: 0;"><strong>发布日期</strong></label>
                        <div class="layui-input-inline" style="margin-left: 88px;">
                            <input type="text" name="s_date" id="s_date" value="<%=nowDate%>" class="layui-input" readonly="readonly"/>
                        </div>
                    </div>
                    <hr style="margin-top: 0;"/>


                    <%--   2. 周数 --%>
                    <div class="layui-inline" style="margin-left: -10px;padding-left: 0;">
                        <label class="layui-form-label" style="padding-left: 0;"><strong>周数</strong></label>
                        <div class="layui-input-inline" style="margin-left: -6px;width: 275px;">
                            <input type="text" name="s_intro" id="s_intro" placeholder="请用简短的文字描述一下周数吧！" class="layui-input"/>
                        </div>
                    </div><br/><br/>


                    <%--   3. 周总结内容 --%>
                    <label><strong>周总结内容</strong></label>
                    <!-- 添加Markdown的容器 -->
                    <div id="editormd">
                        <textarea class="editormd-markdown-textarea" name="editormd-markdown-doc"></textarea>
                        <textarea class="editormd-html-textarea" name="editormd-html-code"></textarea>
                    </div>


                    <%--   4. 两个按钮 --%>
                    <div class="layui-inline" style="margin-top: 20px;">
                        <button type="button" id="publishBtn" class="layui-btn">发布</button>
                        <button type="button" id="cleanBtn" class="layui-btn">清空</button>
                    </div>

                </form>
            </div>
            <br/><br/><br/>

        </div>
    </body>

    <!-- JQuery的配置 -->
    <script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
    <!-- 加载Layui的配置 -->
    <script src="<%=basePath%>/static/layui/layui.all.js"></script>
    <%--  Markdown富文本 --%>
    <script src="<%=basePath%>/static/editormd/editormd.min.js"></script>

    <script type="text/javascript">
        //  初始化layui部分
        layui.use('element', function(){
            var element = layui.element;
        });
        layui.use('laydate', function () {
            var laydate = layui.laydate;
            laydate.render({
                elem: '#s_date'
            });
        });

        // Markdown富文本编辑器部分
        var markdown;
        $(function(){
            markdown=editormd("editormd",{
                width: '100%',
                height: '80%',
                syncScrolling: 'single',
                path: '<%=basePath%>/static/editormd/lib/',
                saveHTMLToTextarea: true
            });
        });

        $("#cleanBtn").click(function () {
            markdown.setMarkdown("");
            // $("#s_intro").val() = "";
        });
        // 点击 发布按钮
        $("#publishBtn").click(function(){

            var s_id = $("#s_id").val();
            var s_author = $("#s_author").val();
            var s_intro = $("#s_intro").val();
            var s_content = markdown.getMarkdown();
            var s_date = $("#s_date").val();
            var s_publish = 1;
            var s_status = 0;
            // alert(s_author + s_intro + s_content );
            $.ajax({
                url: '<%=basePath%>/summary/save.do',
                type: 'POST',
                data: {
                    s_id: s_id,
                    s_author: s_author,
                    s_intro: s_intro,
                    s_content: s_content,
                    s_date: s_date,
                    s_publish: s_publish,
                    s_status: s_status

                },
                success: function(data){
                    $("body").html(data);
                },
                error: function(){
                    alert("提交错误");
                }
            });
        });

    </script>

</html>
