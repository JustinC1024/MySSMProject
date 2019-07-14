<%--
  Created by IntelliJ IDEA.
  User: justin
  Date: 2018/12/18
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
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
    <!-- Animate.css -->
    <link href="https://colorlib.com/polygon/gentelella/css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath }/statics/css/custom.min.css" rel="stylesheet">
</head>

<body class="login">
<div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form action="/developer/doDev" method="post">
                    <h1>${title}</h1>
                    <div>
                        <input type="text" class="form-control" name="aCode" placeholder="请输入账号" required="" />
                    </div>
                    <div>
                        <input type="text" class="form-control" name="aName" placeholder="请输入昵称" required="" />
                    </div>
                    <div>
                        <input type="password" class="form-control" name="aPassword" placeholder="请输入密码" required="" />
                    </div>
                    <div>
                        <input type="email" class="form-control" name="aEmail" placeholder="请输入邮箱" required="" />
                    </div>
                    <div>
                        <textarea class="form-control" name="aInfo" placeholder="请输入简介"  >

                        </textarea>
                    </div>
                    <span>${msg }</span>
                    <div>
                        <button type="submit" class="btn btn-success">提交</button>
                        <button type="reset" class="btn btn-default">重 填</button>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <div>
                            <p>©2018-APP信息管理平台-16软件2班-第七组</p>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>
</body>
</html>
