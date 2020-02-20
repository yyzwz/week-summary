<%--
  Created by IntelliJ IDEA.
  User: zwz
  Date: 2020/2/10 0010
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--用于支持 c:if 标签--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%--
        这是周总结列表界面

        在主界面Page.jsp的 主体部分 调用

        通过SummaryController.java的findByPage()方法返回模型

--%>
<html>

    <head>

        <title>周总结列表</title>

        <%--导入CSS、JS文件--%>
        <link rel="stylesheet" href="<%=basePath%>/static/css/layui.css"/>
        <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
        <script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
        <script src="<%=basePath%>/static/layui/layui.all.js"></script>
        <script src="<%=basePath%>/static/js/bootstrap.min.js"></script>

    </head>

    <body>
        <div class="container" style="width: 90%;"><br/><br/>

            <%--  c:if语法:  test条件若为真 则显示 --%>
            <%--  ne   代表等于 --%>
            <%--  功能为: 根据某个属性值来筛选结果   功能未实现--%>

            <%--  批量删除 和 添加周总结 按钮--%>
            <c:if test="${sessionScope.identity_id ne 4}">

                <div class="layui-inline">

                    <button type="button" id="cleanBtnMore" class="layui-btn layui-btn-danger">批量删除</button>

                    <a href="<%=basePath%>/summary/toSummaryWrite.do"><button type="button" id="addBtn" class="layui-btn layui-btn">添加周总结</button></a>

                </div>

            </c:if><br/><br/>



            <%-- 显示全部周总结列表界面  开始--%>
            <%-- 显示全部周总结列表界面  开始--%>
            <%-- 显示全部周总结列表界面  开始--%>
            <div class="table-responsive">

                <%-- 周总结列表--%>
                <table class="table table-striped table-hover" id="countTable">

                    <%--  thead  表格列名--%>
                    <thead>
                        <tr>
                            <%-- 空出来的全选按钮 --%>
                            <th style="text-align: center"></th>

                            <th style="text-align:center;">周总结编号</th>
                            <th style="text-align: center">周数</th>
                            <th style="text-align: center">作者</th>
                            <th style="text-align: center">发表日期</th>
                            <c:if test="${sessionScope.identity_id ne 4}">
                                <th style="text-align: center">发布状态</th>
                                <th style="text-align: center">存在状态</th>
                                <th style="text-align: center;">操作</th>
                            </c:if>
                        </tr>
                    </thead>
                    <%--  thead  表格列名结尾--%>

                    <tbody style="text-align: center">

                        <%--  循环遍历传过来的数据  --%>
                        <c:forEach items="${requestScope.page.beanList}" var="summary">
                            <tr>

                                <%-- 周总结前面的勾选框--%>
                                <td><input name="s_id" value="${summary.s_id}" type="checkbox"/></td>

                                <%-- 周总结编号--%>
                                <td>${summary.s_id}</td>

                                 <%-- 周总结编号--%>
                                <td>${summary.s_intro}</td>

                                <%-- 周总结作者--%>
                                <td>${summary.s_author}</td>

                                <%-- 发表日期--%>
                                <td>${summary.s_date}</td>

                                <c:if test="${sessionScope.identity_id ne 4}">

                                    <%-- 是否发布--%>
                                    <td>
                                        <c:if test="${summary.s_publish eq 0}">
                                            未发布
                                        </c:if>
                                        <c:if test="${summary.s_publish eq 1}">
                                            已发布
                                        </c:if>
                                    </td>

                                    <%-- 是否已经删除--%>
                                    <td>
                                        <c:if test="${summary.s_status eq 0}">
                                            存在
                                        </c:if>
                                        <c:if test="${summary.s_status eq 1}">
                                            <label style="color: #FF5722">已删除</label>
                                        </c:if>
                                    </td>

                                    <%-- 三个操作按钮--%>
                                    <td>
                                        <a href="<%=basePath%>/summary/toSummaryView.do?s_id=${summary.s_id}" /><button type="button" class="layui-btn layui-btn-sm">查看</button>
                                        <a onclick="alert('敬请期待!');" /><button type="button" class="layui-btn layui-btn-sm layui-btn-normal">编辑</button></a>
                                        <button type="button" onclick="return clean(${summary.s_id});" class="layui-btn layui-btn-sm layui-btn-danger">删除</button>
                                    </td>

                                </c:if>

                                <%-- 未知按钮--%>
                                <c:if test="${sessionScope.identity_id eq 4}">
                                    <td>
                                        <a href="<%=basePath%>/summary/toSummaryView.do?s_id=${summary.s_id}" /><button type="button" class="layui-btn layui-btn-sm">查看周总结</button>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <%-- 显示第几页的末端表单--%>
            <form class="listForm" name="listForm" method="post" action="<%=basePath%>/summary/findByPage.do">
                <div class="row">
                    <div class="form-inline" style="margin-left: 15px;">
                        <label style="font-size:14px;margin-top:22px;">
                            <strong>共<b>${requestScope.page.totalCount}</b>条记录，共<b>${requestScope.page.totalPage}</b>页</strong>
                            &nbsp;
                            &nbsp;
                            <strong>每页显示</strong>
                            <select class="form-control" name="pageSize">
                                <option value="2"
                                        <c:if test="${requestScope.page.pageSize == 2}">selected</c:if> >2
                                </option>
                                <option value="3"
                                        <c:if test="${requestScope.page.pageSize == 3}">selected</c:if> >3
                                </option>
                                <option value="4"
                                        <c:if test="${requestScope.page.pageSize == 4}">selected</c:if> >4
                                </option>
                                <option value="5"
                                        <c:if test="${requestScope.page.pageSize == 5}">selected</c:if> >5
                                </option>
                            </select>
                            <strong>条</strong>
                            &nbsp;
                            &nbsp;
                            <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
                                                            class="form-control input-sm"
                                                            style="width:11%"/>&nbsp;<strong>页</strong>
                            &nbsp;
                            <button type="submit" class="btn btn-sm btn-info">GO!</button>
                        </label>
                        <ul class="pagination" style="float:right;">
                            <li>
                                <a href="<%=basePath%>/summary/findByPage.do?pageCode=1"><strong>首页</strong></a>
                            </li>
                            <li>
                                <c:if test="${requestScope.page.pageCode > 2}">
                                    <a href="<%=basePath%>/summary/findByPage.do?pageCode=${requestScope.page.pageCode - 1}">&laquo;</a>
                                </c:if>
                            </li>

                            <!-- 写关于分页页码的逻辑 -->
                            <c:choose>
                                <c:when test="${requestScope.page.totalPage <= 5}">
                                    <c:set var="begin" value="1"/>
                                    <c:set var="end" value="${requestScope.page.totalPage}"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="begin" value="${requestScope.page.pageCode - 1}"/>
                                    <c:set var="end" value="${requestScope.page.pageCode + 3}"/>

                                    <!-- 头溢出 -->
                                    <c:if test="${begin < 1}">
                                        <c:set var="begin" value="1"/>
                                        <c:set var="end" value="5"/>
                                    </c:if>

                                    <!-- 尾溢出 -->
                                    <c:if test="${end > requestScope.page.totalPage}">
                                        <c:set var="begin" value="${requestScope.page.totalPage -4}"/>
                                        <c:set var="end" value="${requestScope.page.totalPage}"/>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>

                            <!-- 显示页码 -->
                            <c:forEach var="i" begin="${begin}" end="${end}">
                                <!-- 判断是否是当前页 -->
                                <c:if test="${i == requestScope.page.pageCode}">
                                    <li class="active"><a href="javascript:void(0);">${i}</a></li>
                                </c:if>
                                <c:if test="${i != requestScope.page.pageCode}">
                                    <li>
                                        <a href="<%=basePath%>/summary/findByPage.do?pageCode=${i}">${i}</a>
                                    </li>
                                </c:if>
                            </c:forEach>

                            <li>
                                <c:if test="${requestScope.page.pageCode < requestScope.page.totalPage}">
                                    <a href="<%=basePath%>/summary/findByPage.do?pageCode=${requestScope.page.pageCode + 1}">&raquo;</a>
                                </c:if>
                            </li>
                            <li>
                                <a href="<%=basePath%>/summary/findByPage.do?pageCode=${requestScope.page.totalPage}"><strong>末页</strong></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </form>
            <%-- 显示第几页的末端表单 结尾--%>

        </div>

    </body>

    <script type="text/javascript">

        layui.use('element', function () {
            var element = layui.element;
        });

        //单片周总结的 删除 按钮的单击事件
        function clean(s_id){
            layer.open({
                title: '警告信息',//弹框标题
                content: '你确定要删除？（周总结将保存在回收站中）',
                btn: ['确定','取消'],
                btn1: function(index,layero){
                    $.ajax({
                        url: '<%=basePath%>/summary/clean.do',
                        type: 'POST',
                        data: {s_id: s_id},
                        success: function(data){
                            layer.open({
                                title: '提示信息',
                                content: '删除成功',
                                time: 2000
                            });
                            $("body").html(data);
                        },
                        error: function(){
                            layer.open({
                                title: '提示信息',
                                content: '删除失败'
                            });
                        }
                    });
                    layer.close(index);
                }
            });
        }

        // 批量删除 按钮的单击事件
        $("#cleanBtnMore").click(function(){
            alert("敬请期待！");
        });

    </script>
</html>
