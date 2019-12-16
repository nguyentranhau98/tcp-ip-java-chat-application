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
                                        <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                                            <i class="zmdi zmdi-plus"></i>Thêm người dùng mới</button>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header">
                                        <strong>Thêm</strong> Người Dùng Mới
                                    </div>
                                    <div class="card-body card-block">
                                        <form action="<%=request.getContextPath() %>/admin/user/add" method="post" id="form" enctype="multipart/form-data" class="form-horizontal">
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Username</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="text-input" name="text-input" placeholder="Nhập tên người dùng" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="password-input" class=" form-control-label">Password</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="password" id="password-input" name="password-input" placeholder="Nhập password" class="form-control">
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
                                                    <input type="text" id="fullname-input" name="fullname-input" placeholder="Nhập họ và tên" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Ảnh Đại Diện</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="file" id="file-input" name="file-input" class="form-control-file">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="select" class=" form-control-label">Chức vụ</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <select name="select" id="select" class="form-control">
                                                        <option value="Nhân viên">Nhân viên</option>
                                                        <option value="Admin">Admin</option>
                                                        <option value="Mod">Mod</option>
                                                        <option value="Người dùng">Người dùng</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="card-footer">
	                                        <button type="submit" class="btn btn-primary btn-sm">
	                                            <i class="fas fa-plus-square"></i> Thêm
	                                        </button>
	                                        <button type="reset" class="btn btn-danger btn-sm">
	                                            <i class="fas fa-ban"></i> Đặt Lại
	                                        </button>
                                    </div>
                                        </form>
                                    </div>
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
					required:true,
					minlength: 8,
				},
				"confirm-password-input": {
					required:true,
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
					required:"Vui lòng nhập mật khẩu",
					minlength:"Mật khẩu tối thiểu 10 ký tự",
				},
				"confirm-password-input": {
					required:"Vui lòng xác nhận mật khẩu",
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