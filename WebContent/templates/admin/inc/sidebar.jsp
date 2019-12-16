<%@page import="model.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="<%=request.getContextPath() %>" style="font-size: 2.0em;">
                	<span style="padding: 0em 0.5em; border-radius: 100%; border: 2px solid #008AFD;">SPORT</span>NEWS
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li id="home" class="">
                            <a href="<%=request.getContextPath()%>/admin/index">
                                <i class="fas fa-home"></i>TRANG CHỦ</a>
                        </li>
                        <li id="categories" class="">
                            <a href="<%=request.getContextPath()%>/admin/cat/index">
                                <i class="fas fa-folder"></i>QUẢN LÝ DANH MỤC</a>
                        </li>
                        <li id="news" class="">
                            <a href="<%=request.getContextPath()%>/admin/new/index">
                                <i class="fas fa-newspaper"></i>QUẢN LÝ TIN TỨC</a>
                        </li>
                        <li id="users" class="">
                            <a href="<%=request.getContextPath()%>/admin/user/index">
                                <i class="fas fa-users"></i>QUẢN LÝ NGƯỜI DÙNG</a>
                        </li>
                       	<%	
                       		Users user = (Users)session.getAttribute("userInfo");
                       	%>
                    </ul>
                </nav>
            </div>
        </aside>
</html>