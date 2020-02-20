<%--
  Created by IntelliJ IDEA.
  User: zwz
  Date: 2020/2/10 0010
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%--

        周总结回收站页面

        在主界面Page.jsp的 主体部分调用

        通过SummaryController.java的toSummaryTrash()方法返回模型

--%>
<html>
    <head>
        <title>回收站</title>

        <%-- 导入CSS、JS文件--%>
        <link rel="stylesheet" href="<%=basePath%>/static/css/layui.css"/>
        <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
        <script src="<%=basePath%>/static/layui/layui.all.js"></script>
        <script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>

    </head>


    <body>
        <div class="container" style="width: 95%;">

            <br/><br/>

            <%--首位标题--%>
            <fieldset class="layui-elem-field layui-field-title">
                <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 170px;border-bottom: none;"><strong>回收站信息列表</strong></legend>
            </fieldset>

            <br/><br/>

            <%--副标题--%>
            <h5 style="margin-top: -20px;">
                <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
                <span style="color: #299A74;"><strong>已经删除的周总结信息列表</strong></span>
            </h5>

            <hr/>

            <%--  两个按钮: 批量删除、添加周总结 --%>
            <div class="layui-inline">
                <button type="button" id="cleanBtnMore" class="layui-btn layui-btn-danger">批量删除</button>
                <a href="<%=basePath%>/summary/toSummaryWrite.do"><button type="button" id="addBtn" class="layui-btn layui-btn">添加周总结</button></a>
            </div>

            <br/><br/>

            <%-- 回收站列表--%>
            <div class="table-responsive">
                <table class="table table-striped table-hover" id="countTable">

                    <%-- 列名--%>
                    <thead>
                        <tr>
                            <th style="text-align: center"><input type="checkbox" id="all"></th>
                            <th style="text-align: center;">周总结编号</th>
                            <th style="text-align: center">周数</th>
                            <th style="text-align: center">作者</th>
                            <th style="text-align: center">发表日期</th>
                            <th style="text-align: center">发布状态</th>
                            <th style="text-align: center">存在状态</th>
                            <th style="text-align: center;">操作</th>
                        </tr>
                    </thead>

                    <%--列表内容信息--%>
                    <tbody style="text-align: center">
                        <c:forEach items="${requestScope.page.beanList}" var="summary">
                            <tr>
                                <td><input name="s_id" value="${summary.s_id}" type="checkbox"/></td>
                                <td>${summary.s_id}</td>
                                <td>${summary.s_intro}</td>
                                <td>${summary.s_author}</td>
                                <td>${summary.s_date}</td>
                                <td>
                                    <c:if test="${summary.s_publish eq 0}">
                                        未发布
                                    </c:if>
                                    <c:if test="${summary.s_publish eq 1}">
                                        已发布
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${summary.s_status eq 0}">
                                        存在
                                    </c:if>
                                    <c:if test="${summary.s_status eq 1}">
                                        <label style="color: #FF5722">已删除</label>
                                    </c:if>
                                </td>
                                <td>
                                    <button type="button" onclick="return restore(${summary.s_id})" class="layui-btn layui-btn-sm layui-btn-normal">恢复</button>
                                    <button type="button" onclick="return deletes(${summary.s_id});" class="layui-btn layui-btn-sm layui-btn-danger">删除</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>


            <%--分页组件  开始--%>
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
            <%-- 分页组件  结尾--%>

        </div>
    </body>

    <script type="text/javascript">
        layui.use('element', function () {
            var element = layui.element;
        });

        //彻底删除操作: 单篇周总结的删除按钮
        function deletes(s_id){
            layer.open({
                title: '警告信息',
                content: '你确定要永久删除吗？（此操作不可撤回）',
                btn: ['确定','取消'],
                btn1: function(index,layero){
                    $.ajax({
                        url: '<%=basePath%>/summary/delete.do',
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


        //单篇周总结的  恢复按钮
        function restore(s_id){
            layer.open({
                title: '提示信息',
                content: '你确定要恢复这篇周总结吗？（恢复后可对该周总结进行编辑操作）',
                btn: ['确定','取消'],
                btn1: function(index,layero){
                    $.ajax({
                        url: '<%=basePath%>/summary/restore.do',
                        type: 'POST',
                        data: {s_id: s_id},
                        success: function(data){
                            layer.open({
                                title: '提示信息',
                                content: '恢复周总结成功',
                                time: 2000
                            });
                            $("body").html(data);
                        },
                        error: function(){
                            layer.open({
                                title: '提示信息',
                                content: '恢复周总结信息失败'
                            });
                        }
                    });
                    layer.close(index);
                }
            });
        }

    </script>
</html>
