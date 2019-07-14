<%--
  Created by IntelliJ IDEA.
  User: justin
  Date: 2018/12/23
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/header.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>APP信息</h3>
            </div>

            <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                        <br/>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2><br/></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown"></li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <form class="form-horizontal form-label-left" name="goto" action="" method="post">

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">名称 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" type="text"
                                           readonly  unselectable="on" value="${app.aiName}" name="aiName"  style="text-align: center">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">APK ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control col-md-7 col-xs-12"
                                           readonly  unselectable="on" value="${app.APKName}" name="APKName"  style="text-align: center">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">ROM ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control col-md-7 col-xs-12"
                                           readonly  unselectable="on" value="${app.supportROM}" name="supportROM"  style="text-align: center">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">界面语言 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control col-md-7 col-xs-12"
                                           readonly  unselectable="on" value="${app.interfaceLanguage}" name="interfaceLanguage"  style="text-align: center">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">大小 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control col-md-7 col-xs-12"
                                           readonly  unselectable="on" value="${app.appSize}M" name="appSize"  style="text-align: center">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">状态 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <c:forEach var="state" items="${state}">
                                        <c:if test="${state.id==app.sId}">
                                            <input type="text" class="form-control col-md-7 col-xs-12"
                                                   readonly  unselectable="on" value="${state.SName}" style="text-align: center" >
                                            <input name="sId" type="hidden" value="${app.sId}">
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">类型 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <c:forEach items="${appType}" var="type">
                                        <c:if test="${type.id==app.atId}">
                                            <c:forEach items="${appType}" var="type1">
                                                <c:if test="${type.parentId==type1.id}">
                                                    <c:forEach items="${appType}" var="type2">
                                                        <c:if test="${type2.id==type1.parentId}">
                                                            <input type="text" class="form-control col-md-7 col-xs-12"
                                                                   readonly  unselectable="on" style="text-align: center"
                                                                   value="${type2.atName} -> ${type1.atName} -> ${type.atName}">
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>

                                    <input type="hidden" name="atId" value="${app.atId}">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">平台 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <c:choose>
                                        <c:when test="${app.flatformId==1}">
                                            <input type="text" class="form-control col-md-7 col-xs-12"
                                                readonly  unselectable="on" value="苹果" style="text-align: center">
                                        </c:when>
                                        <c:when test="${app.flatformId==2}">
                                            <input type="text" class="form-control col-md-7 col-xs-12"
                                                   readonly  unselectable="on" value="安卓" style="text-align: center">
                                        </c:when>
                                    </c:choose>
                                    <input type="hidden" name="flatformId">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">简介 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea class="form-control col-md-7 col-xs-12"
                                              readonly  unselectable="on" name="appInfo">${app.appInfo}</textarea>
                                </div>
                            </div>

                            <c:forEach var="list" items="${version}">
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">版本 ：
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="col-md-3">${list.avName}</div>
                                        <div class="col-md-2">${list.versionSize}</div>
                                        <div class="col-md-2">${list.versionInfo}</div>
                                        <div class="col-md-2">
                                            <fmt:formatDate value="${list.creationDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </div>
                                        <a href="/user/download/${list.id}" class="btn btn-success">下载</a>
                                        <c:if test="${sessionScope.user.id==app.AId}">
                                            <a href="/developer/deleAppVersion/${list.id}" class="btn btn-success">删除</a>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>

                            <input type="hidden" value="${app.id}" name="id">
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3" style="text-align: center">
                                    <c:choose>
                                        <c:when test="${sessionScope.user.TId==1}">
                                            <c:if test="${sessionScope.user.id==app.AId}">
                                                <button type="submit" class="btn btn-success" onclick="change()">修改</button>
                                                <button type="submit" class="btn btn-success" onclick="dele()">删除</button>
                                                <button type="submit" class="btn btn-success" onclick="upload()">增加版本</button>
                                            </c:if>
                                            <button type="submit" class="btn btn-success" onclick="cancle()">取消</button>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${app.sId==1}">
                                                    <button type="submit" class="btn btn-success" onclick="pass()">通过</button>
                                                    <button type="submit" class="btn btn-success" onclick="unpass()">不通过</button>
                                                    <button type="submit" class="btn btn-success" onclick="cancle()">取消</button>
                                                </c:when>
                                                <c:when test="${app.sId==3}">
                                                    <button type="submit" class="btn btn-success" onclick="pass()">通过</button>
                                                    <button type="submit" class="btn btn-success" onclick="cancle()">取消</button>
                                                </c:when>
                                                <c:when test="${app.sId==2}">
                                                    <button type="submit" class="btn btn-success" onclick="unpass()">不通过</button>
                                                    <button type="submit" class="btn btn-success" onclick="cancle()">取消</button>
                                                </c:when>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                    <script>
                                        function change() {
                                            document.goto.action="/developer/replyUpdateApp";
                                            document.goto.submit();
                                        }
                                        function dele() {
                                            document.goto.action="/developer/delApp";
                                            document.goto.submit();
                                        }
                                        function pass() {
                                            document.goto.action="/administrator/passApp/${app.id}/2";
                                            document.goto.submit();
                                        }
                                        function unpass() {
                                            document.goto.action="/administrator/passApp/${app.id}/3";
                                            document.goto.submit();
                                        }
                                        function cancle() {
                                            document.goto.action="/user/index";
                                            document.goto.submit();
                                        }
                                        function down() {
                                            document.goto.action="/user/download";
                                            document.goto.submit();
                                        }
                                        function upload() {
                                            document.goto.action="/developer/replyDoAppVersion/${app.id}";
                                            document.goto.submit();
                                        }
                                    </script>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->

<%@include file="common/footer.jsp"%>