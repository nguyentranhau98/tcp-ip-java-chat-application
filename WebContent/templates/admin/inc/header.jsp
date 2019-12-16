<%@page import="model.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Quản Lý Tin</title>
    <!-- Fontfaces CSS-->
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/templates/admin/images/icon/favicon.ico" />
    <link href="<%=request.getContextPath() %>/templates/admin/css/font-face.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath() %>/templates/admin/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath() %>/templates/admin/vendor/font-awesome-4.7.0/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath() %>/templates/admin/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <!-- Bootstrap CSS-->
    <link href="<%=request.getContextPath() %>/templates/admin/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">
    <!-- Vendor CSS-->
    <link href="<%=request.getContextPath() %>/templates/admin/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <!-- Main CSS-->
    <link href="<%=request.getContextPath() %>/templates/admin/css/theme.css" rel="stylesheet" media="all">
    <!-- JQUERY -->
	<script src="<%=request.getContextPath() %>/lib/js/jquery-3.2.1.min.js"></script>
	<!-- JVALIDATE -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/lib/js/jquery.validate.min.js"></script>
	<!-- CKEDITOR -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/lib/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/ckfinder/ckfinder.js"></script>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>

<body class="animsition">
    <div class="page-wrapper">
        <!-- MENU SIDEBAR-->
        <%@include file="/templates/admin/inc/sidebar.jsp" %>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
<header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <form class="form-header" action="<%=request.getContextPath() %>/admin/new/search" method="post">
                                <input class="au-input au-input--xl" type="text" required="required" name="searchInfo" placeholder="Tìm kiếm..." />
                                <button class="au-btn--submit" type="submit">
                                    <i class="zmdi zmdi-search"></i>
                                </button>
                            </form>
                            <%
				            	Users userInfo = null;
				            	if(session.getAttribute("userInfo") != null) {
				            		userInfo = (Users)session.getAttribute("userInfo");
				            %>
                            <div class="header-button">
                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="image">
                                            <img src="<%=request.getContextPath() %>/images/<%=userInfo.getAvatar() %>" alt="<%=userInfo.getFullname() %>" />
                                        </div>
                                        <div class="content">
                                            <a class="js-acc-btn" href="<%=request.getContextPath()%>/admin/user/index"><%=userInfo.getFullname() %></a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="info clearfix">
                                                <div class="image">
                                                    <a href="<%=request.getContextPath()%>/admin/user/index">
                                                        <img src="<%=request.getContextPath() %>/images/<%=userInfo.getAvatar() %>" alt="<%=userInfo.getFullname() %>" />
                                                    </a>
                                                </div>
                                                <div class="content">
                                                    <h5 class="name">
                                                        <a href="<%=request.getContextPath()%>/admin/user/index"><%=userInfo.getFullname() %></a>
                                                    </h5>
                                                    <span class="email"><%=userInfo.getRole() %></span>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__body">
                                                <div class="account-dropdown__item">
                                                    <a href="<%=request.getContextPath()%>/admin/user/index">
                                                        <i class="zmdi zmdi-account"></i>Tài khoản</a>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__footer">
                                                <a href="<%=request.getContextPath()%>/auth/logout">
                                                    <i class="zmdi zmdi-power"></i>Đăng xuất</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%} %>
                        </div>
                    </div>
                </div>
            </header>
</html>