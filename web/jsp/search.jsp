<%--
  Created by IntelliJ IDEA.
  User: justin
  Date: 2018/12/23
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/header.jsp"%>

<!-- Datatables -->
<link href="${pageContext.request.contextPath }/statics/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/statics/css/buttons.bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/statics/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/statics/css/responsive.bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/statics/css/scroller.bootstrap.min.css" rel="stylesheet">

<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>APP管理页面</h3>
            </div>

            <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <form action="" name="goto">
                    <div class="col-md-4">
                        <input id="bef" class="col-md-3"  type="text" name="name" class="form-control"
                                <c:if test="${!empty t1}">value="${t1}" </c:if>
                        />
                        <div class="col-md-1"></div>
                        <input id="find" type="submit" value="查询" class="btn btn-success col-md-2" >
                    </div>
                    <div class="col-md-4">
                        <div class="col-md-2">状态</div>
                        <div class="col-md-3">
                            <select name="state" class="form-control">
                                <option value="0">--请选择--</option>
                                <option value="1">待审核</option>
                                <option value="2">审核通过</option>
                                <option value="3">不通过</option>
                                <option value="4">上架</option>
                                <option value="5">下架</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="col-md-2">平台</div>
                        <div class="col-md-3">
                            <select name="flatformId" class="form-control">
                                <option value="0">--请选择--</option>
                                <option value="1">苹果</option>
                                <option value="2">安卓</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-12"></div>
                    <div class="col-md-4">
                        <div class="col-md-2">一级</div>
                        <div class="col-md-3">
                            <select id="at1" class="form-control">
                                <option value="0">--请选择--</option>
                                <c:forEach items="${sessionScope.appType}" var="list">
                                    <c:if test="${list.parentId==0}">
                                        <option value="${list.id}">
                                                ${list.atName}
                                        </option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="col-md-2">二级</div>
                        <div class="col-md-3">
                            <select id="at2" class="form-control">
                                <option value="0">--请选择--</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="col-md-2">三级</div>
                        <div class="col-md-3">
                            <select id="at3" name="type" class="form-control">
                                <option value="0">--请选择--</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2><br/></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <c:if test="${sessionScope.user.TId==1}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="/developer/replyDoApp">增加</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <p class="text-muted font-13 m-b-30"><br/></p>
                        <table id="datatable" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>软件名称</th>
                                <th>APK名称</th>
                                <th>软件大小(单位:M)</th>
                                <th>所属平台</th>
                                <th>所属分类(一级分类、二级分类、三级分类)</th>
                                <th>状态</th>
                                <th>下载次数</th>
                                <th>操作</th>
                            </tr>
                            </thead>


                            <tbody>
                            <c:forEach items="${app}" var="list">
                                <tr>
                                    <td>${list.aiName}</td>
                                    <td>${list.APKName}</td>
                                    <td>${list.appSize}M</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${list.flatformId==1}">苹果</c:when>
                                            <c:when test="${list.flatformId==2}">安卓</c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:forEach items="${appType}" var="type">
                                            <c:if test="${type.id==list.atId}">
                                                <c:forEach items="${appType}" var="type1">
                                                    <c:if test="${type.parentId==type1.id}">
                                                        <c:forEach items="${appType}" var="type2">
                                                            <c:if test="${type2.id==type1.parentId}">
                                                                ${type2.atName} -> ${type1.atName} -> ${type.atName}
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <c:forEach items="${state}" var="state">
                                            <c:if test="${list.sId==state.id}">
                                                ${state.SName}
                                            </c:if>
                                        </c:forEach>
                                        <%--<c:choose>
                                            <c:when test="${list.sId==1}">待审核</c:when>
                                            <c:when test="${list.sId==2}">审核通过</c:when>
                                            <c:when test="${list.sId==3}">审核未通过</c:when>
                                            <c:when test="${list.sId==4}">已上架</c:when>
                                            <c:when test="${list.sId==5}">已下架</c:when>
                                        </c:choose>--%>
                                    </td>
                                    <td>${list.downloads}</td>
                                    <td>
                                        <!-- Split button -->
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-danger">操作</button>
                                            <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                <span class="caret"></span>
                                                <span class="sr-only">Toggle Dropdown</span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="/user/appDetail/${list.id}">详情</a>
                                                </li>
                                                <c:choose>
                                                    <c:when test="${sessionScope.user.TId==1}">
                                                        <c:if test="${sessionScope.user.id==list.AId}">
                                                            <li>
                                                                <c:choose>
                                                                    <c:when test="${list.sId==2}">
                                                                        <a href="/developer/updateState/${list.id}/4">上架</a>
                                                                    </c:when>
                                                                    <c:when test="${list.sId==4}">
                                                                        <a href="/developer/updateState/${list.id}/5">下架</a>
                                                                    </c:when>
                                                                    <c:when test="${list.sId==5}">
                                                                        <a href="/developer/updateState/${list.id}/4">上架</a>
                                                                    </c:when>
                                                                </c:choose>
                                                            </li>
                                                            <li>
                                                                <a href="/developer/delApp/${list.id}">删除</a>
                                                            </li>
                                                        </c:if>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li>
                                                            <c:if test="${list.sId==1}">
                                                                <a href="/administrator/passApp/${list.id}/2">通过</a>
                                                                <a href="/administrator/passApp/${list.id}/3">不通过</a>
                                                            </c:if>
                                                            <c:if test="${list.sId==3}">
                                                                <a href="/administrator/passApp/${list.id}/2">通过</a>
                                                            </c:if>
                                                            <c:if test="${list.sId==2}">
                                                                <a href="/administrator/passApp/${list.id}/3">不通过</a>
                                                            </c:if>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div style="float: right">
                    <P>
                    <c:if test="${sessionScope.pages.now!=1}">
                        <a href="/user/search1/1">首页</a>
                        <a href="/user/search1/${sessionScope.pages.now-1}">上一页</a>
                    </c:if>
                    <span>${sessionScope.pages.now}<span>/</span>${sessionScope.pages.num}</span>
                    <c:if test="${sessionScope.pages.now!=sessionScope.pages.num}">
                        <a href="/user/search1/${sessionScope.pages.now+1}">下一页</a>
                        <a href="/user/search1/${sessionScope.pages.num}">尾页</a>
                    </c:if>
                    </P>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->

<!-- Datatables -->
<script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script src="../vendors/datatables.net-scroller/js/datatables.scroller.min.js"></script>
<script src="../vendors/jszip/dist/jszip.min.js"></script>
<script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
<script src="../vendors/pdfmake/build/vfs_fonts.js"></script>

<!-- Datatables -->
<script src="${pageContext.request.contextPath }/statics/js/jquery.min.js"></script>
<script>

    $(document).ready(function () {
        $(function(){

            $("#find").click(function () {
                if ($("#bef").val()==""){
                    document.goto.action="/user/index";
                    document.goto.submit();
                } else{
                    document.goto.action="/user/search";
                    document.goto.submit()
                }
                ;
            })

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
<script>
    $(document).ready(function() {
        var handleDataTableButtons = function() {
            if ($("#datatable-buttons").length) {
                $("#datatable-buttons").DataTable({
                    dom: "Bfrtip",
                    buttons: [
                        {
                            extend: "copy",
                            className: "btn-sm"
                        },
                        {
                            extend: "csv",
                            className: "btn-sm"
                        },
                        {
                            extend: "excel",
                            className: "btn-sm"
                        },
                        {
                            extend: "pdfHtml5",
                            className: "btn-sm"
                        },
                        {
                            extend: "print",
                            className: "btn-sm"
                        },
                    ],
                    responsive: true
                });
            }
        };

        TableManageButtons = function() {
            "use strict";
            return {
                init: function() {
                    handleDataTableButtons();
                }
            };
        }();

        $('#datatable').dataTable();

        $('#datatable-keytable').DataTable({
            keys: true
        });

        $('#datatable-responsive').DataTable();

        $('#datatable-scroller').DataTable({
            ajax: "js/datatables/json/scroller-demo.json",
            deferRender: true,
            scrollY: 380,
            scrollCollapse: true,
            scroller: true
        });

        $('#datatable-fixed-header').DataTable({
            fixedHeader: true
        });

        var $datatable = $('#datatable-checkbox');

        $datatable.dataTable({
            'order': [[ 1, 'asc' ]],
            'columnDefs': [
                { orderable: false, targets: [0] }
            ]
        });
        $datatable.on('draw.dt', function() {
            $('input').iCheck({
                checkboxClass: 'icheckbox_flat-green'
            });
        });

        TableManageButtons.init();
    });
</script>
<!-- /Datatables -->

<%@include file="common/footer.jsp"%>
