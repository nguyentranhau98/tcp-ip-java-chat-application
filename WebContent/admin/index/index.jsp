<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.bean.News"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@include file="/templates/admin/inc/header.jsp" %>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">Trang Chủ</h2>
                                    <%
	                            	if(user.getRole().equals("Admin")) {
	                           		%>
                                    <div class="dropdown">
                                    <button class="au-btn-mod au-btn-icon au-btn--blue">
                                      <i class="zmdi zmdi-plus"></i>Thêm</button>
                                      <div class="dropdown-content">
									  	<div class="account-dropdown__item_mod">
                                            <a href="<%=request.getContextPath()%>/admin/user/add">
                                                <i class="zmdi zmdi-account-add" style="padding-right:10px;"></i> Người dùng mới</a>
                                        </div>
                                        <div class="account-dropdown__item_mod">
                                            <a href="<%=request.getContextPath()%>/admin/cat/add">
                                                <i class="zmdi zmdi-folder" style="padding-right:10px;"></i> Danh mục mới</a>
                                        </div>
                                        <div class="account-dropdown__item_mod">
                                            <a href="<%=request.getContextPath()%>/admin/new/add">
                                                <i class="zmdi zmdi-view-web" style="padding-right:10px;"></i> Tin tức mới</a>
                                        </div>
									  </div>
                                    </div>
                                    <%} %>
                                </div>
                            </div>
                        </div>
                        <%
	                        int nUser = (int)request.getAttribute("nUser");
	                		int nCat = (int)request.getAttribute("nCat");
	                		int nNew = (int)request.getAttribute("nNew");
	                		@SuppressWarnings("unchecked")
	                		ArrayList<News> latestNews = (ArrayList<News>)request.getAttribute("latestNews");
                        %>
                        <div class="row m-t-25">
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c1">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-accounts"></i>
                                            </div>
                                            <div class="text">
                                                <h2><%=nUser %></h2>
                                                <span>Người Dùng</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c2">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-folder"></i>
                                            </div>
                                            <div class="text">
                                                <h2><%=nCat %></h2>
                                                <span>Danh Mục</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c3">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-view-web"></i>
                                            </div>
                                            <div class="text">
                                                <h2><%=nNew %></h2>
                                                <span>Tin Tức</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
                                    <div class="au-card-title" style="background-image:url('images/bg-title-01.jpg');">
                                        <div class="bg-overlay bg-overlay--blue"></div>
                                        <h3>
                                            <i class="zmdi zmdi-account-calendar"></i>
                                            Ngày <script>document.write(new Date().getDate());</script>
                                             Tháng <script>document.write(new Date().getMonth() + 1);</script>
                                        	 Năm <script>document.write(new Date().getFullYear());</script>
                                        </h3>
                                    </div>
                                    <div class="au-task js-list-load">
                                        <div class="au-task__title">
                                            <p>Bài viết có thay đổi</p>
                                        </div>
                                        <div class="au-task-list">
                                        	<%
                                        		for(News latestNew:latestNews) {
                                        	%>
                                            <div class="au-task__item">
                                                <div class="au-task__item-inner">
                                                    <h5 class="task"><%=latestNew.getName() %></h5>
                                                    <%
														String date = new SimpleDateFormat("dd.MM.YYYY").format(latestNew.getDate_create().getTime());
                                                   		String hour = new SimpleDateFormat("HH:MM").format(latestNew.getDate_create().getTime());
													%>
                                                    <span class="time">Ngày <%=date %> lúc <%=hour %></span>
                                                </div>
                                            </div>
                                            <%} %>
                                        </div>
                                        <div class="au-message__footer">
                                       	</div>
                                    </div>
                                </div>
                            </div>
                        </div>
<script>
    document.getElementById("home").classList.add('active');
</script>
<%@include file="/templates/admin/inc/footer.jsp" %>                        