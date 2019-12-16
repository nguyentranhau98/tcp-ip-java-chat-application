<%@page import="model.bean.Users"%>
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
                                <!-- DATA TABLE -->
                                <h3 class="title-5 m-b-35">Danh Sách Người Dùng</h3>
                                <div class="table-data__tool">
                                    <div class="table-data__tool-right">
                                        <button onclick="window.location.href='<%=request.getContextPath()%>/admin/user/add'" class="au-btn au-btn-icon au-btn--green au-btn--small">
                                            <i class="zmdi zmdi-plus"></i>Thêm người dùng mới</button>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header">
                                        <strong>Sửa</strong> Người Dùng
                                    </div>
                                    <%
                                    	Users objUser = (Users)request.getAttribute("objUser");
                                    		if(objUser != null) {
                                    %>
                                    <div class="card-body card-block">
                                        <form action="" method="post" id="form" enctype="multipart/form-data" class="form-horizontal">
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Username</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="text-input" name="text-input" value="<%=objUser.getUsername() %>" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="password-input" class=" form-control-label">Password</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="password" id="password-input" name="password-input" placeholder="Nhập password nếu sửa" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="confirm-password-input" class=" form-control-label">Xác Nhận Password</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="password" id="confirm-password-input" name="confirm-password-input" placeholder="Nhập lại password" class="form-control">
                                                </div>
                                            </div>
                                            <span id='message'></span>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Họ và tên</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="fullname-input" name="fullname-input" value="<%=objUser.getFullname() %>" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Ảnh Đại Diện</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="file" id="file-input" name="file-input" class="form-control-file">
                                                </div>
                                                <% if(!objUser.getAvatar().isEmpty()) { %>
			                                        <br />
			                                        <img width="200px" height="200px" style="padding-bottom: 20px;" src="<%=request.getContextPath() %>/images/<%=objUser.getAvatar() %>" alt="Ảnh cũ"/>
		                                    	<%} %>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="select" class=" form-control-label">Chức vụ</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <select name="select" id="select" class="form-control">
                                                   		<%if("Nhân viên".equals(objUser.getRole())) {%>
                                                        	<option selected value="Nhân viên">Nhân viên</option>
                                                        <%} else { %>
                                                        	<option value="Nhân viên">Nhân viên</option>
                                                        <%} %>
                                                        <%if("Admin".equals(objUser.getRole())) {%>
                                                        	<option selected value="Admin">Admin</option>
                                                        <%} else { %>
                                                        	<option value="Admin">Admin</option>
                                                        <%} %>
                                                        <%if("Mod".equals(objUser.getRole())) {%>
                                                        	<option selected value="Mod">Mod</option>
                                                        <%} else { %>
                                                        	<option value="Mod">Mod</option>
                                                        <%} %>
                                                        <%if("Người dùng".equals(objUser.getRole())) {%>
                                                        	<option selected value="Người dùng">Người dùng</option>
                                                        <%} else { %>
                                                        	<option value="Người dùng">Người dùng</option>
                                                        <%} %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="card-footer">
		                                        <button type="submit" class="btn btn-primary btn-sm">
		                                            <i class="fas fa-edit"></i> Sửa
		                                        </button>
		                                        <button type="reset" class="btn btn-danger btn-sm">
		                                            <i class="fas fa-ban"></i> Đặt Lại
		                                        </button>
		                                    </div>
                                        </form>
                                    </div>
                                    <%} %>
                                </div>
                                <!-- END DATA TABLE -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
     	</div>
<script>
	$('#password-input, #confirm-password-input').on('keyup', function () {
	  if ($('#password-input').val() == $('#confirm-password-input').val()) {
	    $('#message').html('Mật khẩu khớp').css('color', 'green');
	  } else 
	    $('#message').html('Mật khẩu xác nhận không khớp').css('color', 'red');
	});
	$(document).ready(function() {
		$("#form").validate({
			rules:{
				"text-input": {
					required:true,
					minlength: 5,
					maxlength: 12,
				},
				"password-input": {
					minlength: 10,
				},
				"fullname-input": {
					required:true,
					minlength: 4,
					maxlength: 30,
				}
			},
			messages: {
				"text-input": {
					required:  "Tên đăng nhập không được để trống",
					minlength: "Tên đăng nhập tối thiểu 5 ký tự",
					maxlength: "Tên đăng nhập tối đa 12 ký tự",
				},
				"password-input": {
					minlength:"Mật khẩu tối thiểu 10 ký tự",
				},
				"fullname-input": {
					required:"Vui lòng nhập họ tên đầy đủ",
					minlength: "Họ tên đầy đủ tối thiểu 4 ký tự",
					maxlength: "Họ tên đầy đủ tối đa 30 ký tự",
				}
			}
		});
	});
</script>
<script>
    document.getElementById("users").classList.add('active');
</script>
<%@include file="/templates/admin/inc/footer.jsp" %>  