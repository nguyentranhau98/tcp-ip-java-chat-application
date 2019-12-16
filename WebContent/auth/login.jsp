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
    <title>Login</title>

    <!-- Fontfaces CSS-->
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/templates/admin/images/icon/favicon.ico" />
    <link href="<%=request.getContextPath() %>/templates/auth/css/font-face.css" rel="stylesheet" media="all">
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
                            <a href="<%=request.getContextPath()%>/main-page" style="font-size: 40px;">
                                <span style="padding: 0em 0.5em; border-radius: 100%; border: 2px solid #008AFD;">SPORT</span>NEWS
                            </a>
                        </div>
                        <%
							if(request.getParameter("msg") != null) {
								int msg = Integer.parseInt(request.getParameter("msg"));
								switch(msg) {
									case 1: out.print("Tạo tài khoản thành công!");
									break;
									case 2: out.print("Tên đăng nhập hoặc mật khẩu không đúng!");
									break;
									case 3: out.print("Vui lòng đăng nhập!");
									break;
									case 4: out.print("Đăng xuất thành công!");
									break;
									case 0: out.print("Có lỗi trong quá trình xử lý!");
									break;
								}
							}
						%>
                        <div class="login-form">
                            <form action="<%=request.getContextPath() %>/auth/login" method="post">
                                <div class="form-group">
                                    <label>Username</label>
                                    <input class="au-input au-input--full" type="text" id="username" name="username" placeholder="Tên đăng nhập">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input class="au-input au-input--full" type="password" id="password" name="password" placeholder="Password">
                                </div>
                                <div class="login-checkbox">
                                </div>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">đăng nhập</button>
                            </form>
                            <div class="register-link">
                                <p>
                                    Chưa có tài khoản?
                                    <a href="<%=request.getContextPath()%>/auth/register" >Đăng ký ở đây</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
<script>
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
				}
			}
		});
	});
</script>
    <!-- Bootstrap JS-->
    <script src="<%=request.getContextPath() %>/templates/auth/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/templates/auth/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="<%=request.getContextPath() %>/templates/auth/vendor/animsition/animsition.min.js"></script>
    <script src="<%=request.getContextPath() %>/templates/auth/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <!-- Main JS-->
    <script src="<%=request.getContextPath() %>/templates/auth/js/main.js"></script>

</body>

</html>
<!-- end document-->