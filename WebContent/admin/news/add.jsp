<%@page import="model.bean.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@include file="/templates/admin/inc/header.jsp" %>
            <!-- END HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <!-- DATA TABLE -->
                                <h3 class="title-5 m-b-35">Danh Sách Tin</h3>
                                <div class="table-data__tool">
                                    <div class="table-data__tool-right">
                                        <button onclick="window.location.href='<%=request.getContextPath() %>/admin/new/add'" class="au-btn au-btn-icon au-btn--green au-btn--small">
                                            <i class="zmdi zmdi-plus"></i>Thêm tin mới</button>
                                            <%
											if(request.getParameter("msg") != null) {
													int msg = Integer.parseInt(request.getParameter("msg"));
													if(msg == 0) {
														out.print("Thêm thất bại!");
													}
												}
											%>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header">
                                        <strong>Thêm</strong> Tin Mới
                                    </div>
                                    <div class="card-body card-block">
                                        <form action="<%=request.getContextPath() %>/admin/new/add" method="post" id="form" enctype="multipart/form-data" class="form-horizontal">
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Tên Tin</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="text-input" name="text-input" placeholder="Nhập tên tin" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="select" class=" form-control-label">Danh Mục</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <select name="select" id="select" class="form-control">
                                                    <%
                                                	if(request.getAttribute("listCats") != null) {
                                            			ArrayList<Categories> listCats = (ArrayList<Categories>)request.getAttribute("listCats");
                                            			if(listCats.size() > 0) {
                                            				for(Categories objCat:listCats) {
                                                	%>
                                                        <option value="<%=objCat.getId()%>"><%=objCat.getCat_name() %></option>
                                                    <%}}} %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Hình Ảnh</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="file" id="file-input" name="picture" class="form-control-file">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Mô Tả</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <textarea name="desc-input" id="desc-input" rows="4" placeholder="Nhập mô tả" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Chi tiết</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <textarea name="content-input" id="editor" rows="9" placeholder="Nhập chi tiết" class="form-control"></textarea>
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
<script>
	$(document).ready(function() {
		$("#form").validate({
			rules:{
				"text-input": {
					required:true,
					minlength: 5,
					maxlength: 30,
				},
				"select": {
					required:true,
				},
				"desc-input": {
					required:true,
					minlength: 10,
				},
				"content-input": {
					required:true,
				}
			},
			messages: {
				"text-input": {
					required:  "Tên tin tức không được để trống",
					minlength: "Tên tin tức tối thiểu 5 ký tự",
					maxlength: "Tên tin tức tối đa 30 ký tự",
				},
				"select": {
					required:"Vui lòng chọn tên danh mục",
				},
				"desc-input": {
					required:"Vui lòng nhập mô tả",
					minlength: "Mô tả tin tức tối thiểu 10 ký tự",
				},
				"content-input": {
					required:"Vui lòng nhập chi tiết tin",
				}
			}
		});
	});
</script>
<script type="text/javascript">
		var editor = CKEDITOR.replace('editor');
		CKFinder.setupCKEditor(editor, '<%=request.getContextPath()%>/lib/ckfinder/');
</script>
<script>
document.getElementById("news").classList.add('active');
</script>
<%@include file="/templates/admin/inc/footer.jsp" %>   