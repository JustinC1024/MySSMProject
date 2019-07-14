<%--
  Created by IntelliJ IDEA.
  User: justin
  Date: 2018/12/23
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Meta, title, CSS, favicons, etc. -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>${title}</title>

	<!-- Bootstrap -->
	<link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet">
	<!-- Font Awesome -->
	<link href="${pageContext.request.contextPath }/statics/css/font-awesome.min.css" rel="stylesheet">
	<!-- NProgress -->
	<link href="${pageContext.request.contextPath }/statics/css/nprogress.css" rel="stylesheet">
	<!-- jQuery custom content scroller -->
	<link href="${pageContext.request.contextPath }/statics/css/jquery.mCustomScrollbar.min.css" rel="stylesheet"/>

	<!-- Custom Theme Style -->
	<link href="${pageContext.request.contextPath }/statics/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
	<div class="main_container">
		<div class="col-md-3 left_col">
			<div class="left_col scroll-view">
				<div class="navbar nav_title" style="border: 0;">
					<a href="/user/appList" class="site_title"><i class="fa fa-paw"></i> <span>${sessionScope.title}</span></a>
				</div>

				<div class="clearfix"></div>

				<!-- menu profile quick info -->
				<div class="profile">
					<div class="profile_pic">
						<img src="images/img.jpg" alt="..." class="img-circle profile_img">
					</div>
					<div class="profile_info">
						<span>欢迎，</span>
						<h2>${sessionScope.user.AName}</h2>
					</div>
				</div>
				<!-- /menu profile quick info -->

				<br />

				<!-- sidebar menu -->
				<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
					<div class="menu_section">
						<h3><<br/></h3>
						<c:choose>
							<c:when test="${sessionScope.user.TId==1}">
								<ul class="nav side-menu">
									<li><a><i class="fa fa-home"></i> APP管理 <span class="fa fa-chevron-down"></span></a>
										<ul class="nav child_menu">
											<li><a href="/user/index">APP查看</a></li>
											<li><a href="/user/searchByAdmin/${sessionScope.user.id}">我的APP</a></li>
										</ul>
									</li>
									<li><a><i class="fa fa-edit"></i> 我的账号 <span class="fa fa-chevron-down"></span></a>
										<ul class="nav child_menu">
											<li><a href="/user/userInfo">个人信息</a></li>
										</ul>
									</li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul class="nav side-menu">
									<li><a><i class="fa fa-home"></i> APP管理 <span class="fa fa-chevron-down"></span></a>
										<ul class="nav child_menu">
											<li><a href="/user/index">APP查看</a></li>
										</ul>
									</li>
									<li><a><i class="fa fa-edit"></i> 我的账号 <span class="fa fa-chevron-down"></span></a>
										<ul class="nav child_menu">
											<li><a href="/user/userInfo">个人信息</a></li>
										</ul>
									</li>
									<li><a><i class="fa fa-desktop"></i> 用户管理 <span class="fa fa-chevron-down"></span></a>
										<ul class="nav child_menu">
											<li><a href="/administrator/admIndex">用户列表</a></li>
										</ul>
									</li>
								</ul>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<!-- /sidebar menu -->
			</div>
		</div>

		<!-- top navigation -->
		<div class="top_nav">
			<div class="nav_menu">
				<nav>
					<div class="nav toggle">
						<a id="menu_toggle"><i class="fa fa-bars"></i></a>
					</div>

					<ul class="nav navbar-nav navbar-right">
						<li class="">
							<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								<img src="images/img.jpg" alt="">${sessionScope.user.AName}
								<span class=" fa fa-angle-down"></span>
							</a>
							<ul class="dropdown-menu dropdown-usermenu pull-right">
								<li><a href="javascript:;"> 个人信息</a></li>
								<li><a href="/user/loginout"><i class="fa fa-sign-out pull-right"></i> 注销</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- /top navigation -->
