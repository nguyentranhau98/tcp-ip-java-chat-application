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
    <title>Đăng Ký Thành Viên</title>

    <!-- Fontfaces CSS-->
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/templates/admin/images/icon/favicon.ico" />
    <link href="<%=request.getContextPath() %>/templates/auth/css/font-face.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath() %>/templates/auth/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath() %>/templates/auth/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath() %>/templates/auth/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="<%=request.getContextPath() %>/templates/auth/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="<%=request.getContextPath() %>/templates/auth/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath() %>/templates/auth/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
	<!-- Jquery JS-->
    <script src="<%=request.getContextPath() %>/templates/auth/vendor/jquery-3.2.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/templates/auth/vendor/jquery.validate.min.js"></script>
    <!-- Main CSS-->
    <link href="<%=request.getContextPath() %>/templates/auth/css/theme.css" rel="stylesheet" media="all">

</head>

<body class="animsition">
    <div class="page-wrapper">
        <div class="page-content--bge5">
            <div class="container">
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="<%=request.getContextPath() %>/main-page" style="font-size: 40px;">
                                <span style="padding: 0em 0.5em; border-radius: 100%; border: 2px solid #008AFD;">SPORT</span>NEWS
                            </a>
                        </div>
                        <div class="login-form">
                            <form action="<%=request.getContextPath() %>/auth/register" method="post" id="form" enctype="multipart/form-data" class="form-horizontal">
                                <div class="form-group">
                                    <label>Username</label>
                                    <input class="au-input au-input--full" type="text" id="username" name="username" placeholder="Nhập tên đăng nhập">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input class="au-input au-input--full" type="password" id="password" name="password" placeholder="Nhập password">
                                </div>
                                <div class="form-group">
                                    <label>Nhập lại Password</label>
                                    <input class="au-input au-input--full" type="password" id="confirm-password" name="confirm-password" placeholder="Nhập lại Password">
                                	<span id='message'></span>
                                </div>
                                <div class="form-group">
	                                <label for="text-input" class=" form-control-label">Họ và tên</label>
	                                <input type="text" id="fullname-input" name="fullname-input" placeholder="Nhập họ và tên" class="form-control">
	                            </div>
                                <div class="form-group">
                                    <label class=" form-control-label">Ảnh Đại Diện</label>
                                    <input type="file" id="file-input" name="file-input" class="form-control-file">
                                </div>
                                <div class="form-group">
                                    <label for="select" class=" form-control-label">Chức vụ</label>
                                    <select name="select" id="select" class="form-control">
                                        <option selected value="Người dùng">Người dùng</option>
                                    </select>
                                </div>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">Đăng Ký</button>
                            </form>
                            <div class="register-link">
                                <p>
                                    Đã có tài khoản?
                                    <a href="<%=request.getContextPath()%>/auth/login">Đăng nhập</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
<script>
	$('#password, #confirm-password').on('keyup', function () {
	  if ($('#password').val() == $('#confirm-password').val()) {
	    $('#message').html('Mật khẩu khớp').css('color', 'green');
	  } else 
	    $('#message').html('Mật khẩu xác nhận không khớp').css('color', 'red');
	});
	$(document).ready(function() {
		$("#form").validate({
			rules:{
				"username": {
					required:true,
					minlength: 5,
					maxlength: 20,
				},
				"password": {
					required:true,
					minlength: 8,
				},
				"confirm-password": {
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
				"username": {
					required:  "Tên đăng nhập không được để trống",
					minlength: "Tên đăng nhập tối thiểu 5 ký tự",
					maxlength: "Tên đăng nhập tối đa 12 ký tự",
				},
				"password": {
					required:"Vui lòng nhập mật khẩu",
					minlength:"Mật khẩu tối thiểu 10 ký tự",
				},
				"confirm-password": {
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
    
    <!-- Bootstrap JS-->
    <script src="<%=request.getContextPath() %>/templates/auth/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="<%=request.getContextPath() %>/templates/auth/vendor/animsition/animsition.min.js"></script>
    <script src="<%=request.getContextPath() %>/templates/auth/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    </script>

    <!-- Main JS-->
    <script src="<%=request.getContextPath() %>/templates/auth/js/main.js"></script>

</body>

</html>
<!-- end document-->