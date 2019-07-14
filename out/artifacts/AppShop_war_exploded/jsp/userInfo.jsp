<%--
  Created by IntelliJ IDEA.
  User: justin
  Date: 2018/12/23
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/header.jsp"%>

<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>个人信息</h3>
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

                        <form class="form-horizontal form-label-left" action="" method="post" name="goto">
                            <input type="hidden" value="${sessionScope.user.id}">
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">账号 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" type="text"
                                           readonly  unselectable="on" value="${sessionScope.user.ACode}" style="text-align: center">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">密码 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control col-md-7 col-xs-12"
                                           readonly  unselectable="on" value="${sessionScope.user.APassword}" style="text-align: center">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">昵称 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control col-md-7 col-xs-12"
                                           readonly  unselectable="on" value="${sessionScope.user.AName}" style="text-align: center">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">邮箱 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="email" class="form-control col-md-7 col-xs-12"
                                           readonly  unselectable="on" value="${sessionScope.user.AEmail}" style="text-align: center">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">简介 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea class="form-control col-md-7 col-xs-12"
                                              readonly  unselectable="on">${sessionScope.user.AInfo}
                                    </textarea>
                                </div>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3" style="text-align: center">
                                    <button type="submit" class="btn btn-success" onclick="change()">修改</button>
                                    <button type="submit" class="btn btn-success" onclick="cancle()">取消</button>
                                </div>
                            </div>
                        </form>
                        <script>
                            function change() {
                                document.goto.action="/user/replyUpdateUser";
                                document.goto.submit();
                            }
                            function cancle() {
                                document.goto.action="/user/index";
                                document.goto.submit();
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->

<%@include file="common/footer.jsp"%>