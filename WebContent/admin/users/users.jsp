<%@page import="model.bean.Users"%>
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
                        	 <h3 class="title-5 m-b-35">Danh Sách Người Dùng</h3>
                        	 <%
                            	if(user.getRole().equals("Admin")) {
                           	 %>
                                <div class="table-data__tool">
                                    <div class="table-data__tool-right">
                                        <button onclick="window.location.href='<%=request.getContextPath()%>/admin/user/add'" class="au-btn au-btn-icon au-btn--green au-btn--small">
                                            <i class="zmdi zmdi-plus"></i>Thêm người dùng mới</button>
                                            <%
												if(request.getParameter("msg") != null) {
													int msg = Integer.parseInt(request.getParameter("msg"));
													switch(msg) {
														case 1: out.print("Thêm thành công!");
														break;
														case 2: out.print("Sửa thành công!");
														break;
														case 3: out.print("Xóa thành công!");
														break;
														case 0: out.print("Có lỗi trong quá trình xử lý!");
														break;
													}
												}
											%>
                                    </div>
                                </div>
                                <%} %>
                        <%
	                        int numberOfPages = (Integer)request.getAttribute("numberOfPages");
	                    	int currentPage = (Integer)request.getAttribute("currentPage");
                        	@SuppressWarnings("unchecked")
                        	ArrayList<Users> userList = (ArrayList<Users>) request.getAttribute("userList");
                        	if(userList != null && userList.size() > 0) {
                        		for(Users objUser:userList) {
                        %>
                            <div class="col-md-4" style="float:left; padding-left:unset; padding-right:20px;width: 320px; height: 380px;">
                                <div class="card">
                                    <div class="card-header">
                                    	<i class="fas fa-user"></i>
                                    	<a href=""><strong class="card-title pl-2">Username: <%=objUser.getUsername() %></strong></a>
                                    </div>
                                    <div class="card-body">
                                        <div class="mx-auto d-block">
                                            <img class="mx-auto d-block" style="width:200px; height:150px;" src="<%=request.getContextPath() %>/images/<%=objUser.getAvatar() %>" alt="Card image cap">
                                            <h5 class="text-sm-center mt-2 mb-1"><%=objUser.getFullname() %></h5>
                                            <div class="location text-sm-center">
                                                <i class="fas fa-address-card"></i> <%=objUser.getRole() %></div>
                                        </div>
                                        <hr>
                                        <div class="card-text text-sm-center">
                                        	<%
	                                        	if("Admin".equals(userInfo.getRole())) {
	                                        %>
                                            <a href="<%=request.getContextPath()%>/admin/user/edit?id=<%=objUser.getId()%>">
                                                <i class="fas fa-edit pr-1"></i>
                                            </a>
                                            <a onclick="return confirm('Bạn có chắc chắn muốn xóa hay không')" href="<%=request.getContextPath()%>/admin/user/del?id=<%=objUser.getId()%>">
                                                <i class="fas fa-user-times pr-1"></i>
                                            </a>
                                            <%}else if(userInfo.getId() == objUser.getId()){ %>
                                            	<a href="<%=request.getContextPath()%>/admin/user/edit?page=<%=currentPage %>&uid=<%=objUser.getId()%>">
                                                	<i class="fas fa-edit pr-1"></i>
	                                            </a>
	                                            <a onclick="return confirm('Bạn có chắc chắn muốn xóa hay không')" href="<%=request.getContextPath()%>/admin/user/del?page=<%=currentPage %>&uid=<%=objUser.getId()%>">
	                                                <i class="fas fa-user-times pr-1"></i>
	                                            </a>
                                            <%} %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}} %>
                        </div>
                    </div>
                    <%
                    	if(userList != null && userList.size() >= 0) {
                    %>
                    <div class="row">
                        <div class="col-sm-6">
                        	<%
                        		int start = (Integer)request.getAttribute("offset") + 1;
                        		int end = (Integer)request.getAttribute("offset") + userList.size();
                        		int total = (Integer)request.getAttribute("numberOfUsers");
                        		String disabled = "";
                        		if(currentPage == 1) {
                        			disabled = " disabled";
                        		} else {
                        			disabled = "";
                        		}
                        	%>
                            <div class="dataTables_info" id="dataTables-example_info" style="margin-top:27px">Hiển thị từ <%=start%> đến <%=end%> của <%=total %> người dùng.</div>
                        </div>
                        <div class="col-sm-6" style="text-align: right;">
                            <nav aria-label="..." style="float: right;">
                              <ul class="pagination">
                                  <li class="page-item <%=disabled %>">
                                  	<a class="page-link" tabindex="-1" href="<%=request.getContextPath()%>/admin/user/index/<%=currentPage-1%>">Trang trước</a>
                                  </li>
                                  <%
                                  	String active = "";
                                  	int i = 0;
                                  	for(i = 1;i <= numberOfPages; i++) {
                                  		if(currentPage == i) {
                                  			active = " active";
                                  		} else {
                                  			active = "";
                                  		}
                                  %>
                                  <li class="page-item <%=active%>">
                                  <a class="page-link" tabindex="-1" href="<%=request.getContextPath()%>/admin/user/index/<%=i%>"><%=i %></a>
                                  </li>
                                  <%}
                                  	String nextDisabled = "";
                                  	if(currentPage == numberOfPages) {
                                  		nextDisabled = " disabled";
                              		} else {
                              			nextDisabled = "";
                              		}                                            	
                                  %>
                                  <li class="page-item <%=nextDisabled %>">
                                  <a class="page-link" tabindex="-1" href="<%=request.getContextPath()%>/admin/user/index/<%=currentPage+1%>">Trang tiếp</a>
                                  </li>
                              </ul>
                          </nav>
                      </div>
                  </div>
                  <%} %>
                </div>
            </div>
        </div>
      </div>
<script>
    document.getElementById("users").classList.add('active');
</script>
<%@include file="/templates/admin/inc/footer.jsp" %>  