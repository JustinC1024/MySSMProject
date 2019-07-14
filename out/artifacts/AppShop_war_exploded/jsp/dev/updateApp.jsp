<%--
  Created by IntelliJ IDEA.
  User: justin
  Date: 2018/12/23
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/header.jsp"%>

<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3></h3>
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
                                           value="${app.aiName}" name="aiName">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">APK ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control col-md-7 col-xs-12"
                                           value="${app.APKName}" name="APKName">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">ROM ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control col-md-7 col-xs-12"
                                           value="${app.supportROM}" name="supportROM">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">界面语言 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control col-md-7 col-xs-12"
                                           value="${app.interfaceLanguage}" name="interfaceLanguage">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">大小 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control col-md-7 col-xs-12"
                                           value="${app.appSize}" name="appSize">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">类型 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">

                                    <select id="at1" class="form-control col-md-2 col-xs-12">
                                        <option value="0">--请选择--</option>
                                        <c:forEach items="${sessionScope.appType}" var="list">
                                            <c:if test="${list.parentId==0}">
                                                <option value="${list.id}"
                                                        <c:if test="${apptf.id==list.id}">selected="selected"</c:if>
                                                >
                                                    ${list.atName}
                                                </option>
                                            </c:if>
                                        </c:forEach>
                                    </select>

                                    <select id="at2" class="form-control col-md-2 col-xs-12">
                                        <option value="${appts.id}" selected="selected">${appts.atName}</option>
                                    </select>
                                    <select id="at3" name="atId" class="form-control col-md-2 col-xs-12">

                                        <c:forEach items="${sessionScope.appType}" var="list">
                                            <c:if test="${list.id==app.atId}">
                                                <option value="${app.atId}" selected="selected">${list.atName}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>

                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">平台 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                   <%-- <input type="text" class="form-control col-md-7 col-xs-12"
                                           value="${app.flatformId}" name="flatformId">--%>
                                    <select name="flatformId" class="form-control col-md-3 col-xs-12">
                                        <option value="0">请选择</option>
                                        <c:if test="${app.flatformId==1}">
                                            <option value="1" selected="selected">苹果</option>
                                            <option value="2">安卓</option>
                                        </c:if>
                                        <c:if test="${app.flatformId==2}">
                                            <option value="1">苹果</option>
                                            <option value="2" selected="selected">安卓</option>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">简介 ：
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea class="form-control col-md-7 col-xs-12"
                                               name="appInfo">${app.appInfo}</textarea>
                                </div>
                            </div>
                            <input type="hidden" value="${app.sId}" name="sId">
                            <input type="hidden" value="${app.id}" name="id">
                            <input type="hidden" name="aId" value="${app.AId}">
                            <input type="hidden" name="downloads" value="${app.downloads}">
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3" style="text-align: center">
                                    <button type="submit" class="btn btn-success" onclick="up()">提交</button>
                                    <button type="submit" class="btn btn-success" onclick="cancle()">取消</button>
                                </div>
                            </div>
                        </form>
                        <script>
                            function up() {
                                document.goto.action="/developer/updateApp";
                                goto.submit();
                            }
                            function cancle() {
                                document.goto.action="/user/appDetail/${app.id}";
                                goto.submit();
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->
<script src="${pageContext.request.contextPath }/statics/js/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $(function(){

            $("#at1").change(function(){
                var at1V = $("#at1").val();
                if(at1V != '' && at1V != null){
                    $.ajax({
                        type:"GET",//请求类型
                        url:"/user/appType",//请求的url
                        data:{typeNum:at1V},//请求参数
                        dataType:"json",//ajax接口（请求url）返回的数据类型
                        success:function(data){//data：返回数据（json对象）
                            $("#at2").html("");
                            var options = "<option value=\"\">--请选择--</option>";
                            for(var i = 0; i < data.length; i++){
                                options += "<option value=\""+data[i].id+"\">"+data[i].atName+"</option>";
                            }
                            $("#at2").html(options);
                        },
                        error:function(data){//当访问时候，404，500 等非200的错误状态码
                            alert("加载二级分类失败！");
                        }
                    });
                }else{
                    $("#at2").html("");
                    var options = "<option value=\"\">--请选择--</option>";
                    $("#at2").html(options);
                }
                $("#at3").html("");
                var options = "<option value=\"\">--请选择--</option>";
                $("#at3").html(options);
            });

            $("#at2").change(function(){
                var at2V = $("#at2").val();
                if(at2V != '' && at2V != null){
                    $.ajax({
                        type:"GET",//请求类型
                        url:"/user/appType",//请求的url
                        data:{typeNum:at2V},//请求参数
                        dataType:"json",//ajax接口（请求url）返回的数据类型
                        success:function(data){//data：返回数据（json对象）
                            $("#at3").html("");
                            var options = "<option value=\"\">--请选择--</option>";
                            for(var i = 0; i < data.length; i++){
                                options += "<option value=\""+data[i].id+"\">"+data[i].atName+"</option>";
                            }
                            $("#at3").html(options);
                        },
                        error:function(data){//当访问时候，404，500 等非200的错误状态码
                            alert("加载三级分类失败！");
                        }
                    });
                }else{
                    $("#at3").html("");
                    var options = "<option value=\"\">--请选择--</option>";
                    $("#at3").html(options);
                }
            });

        });
    });
</script>

<%@include file="../common/footer.jsp"%>