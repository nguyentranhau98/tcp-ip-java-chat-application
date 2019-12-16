<%@page import="model.bean.News"%>
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
                                        <button onclick="window.location.href='<%=request.getContextPath() %>/admin/admin/add'" class="au-btn au-btn-icon au-btn--green au-btn--small">
                                            <i class="zmdi zmdi-plus"></i>Thêm tin mới</button>
                                            <%
											if(request.getParameter("msg") != null) {
													int msg = Integer.parseInt(request.getParameter("msg"));
													if(msg == 0) {
														out.print("Sửa thất bại!");
													}
												}
											%>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header">
                                        <strong>Sửa</strong> Tin Tức
                                    </div>
                                    <div class="card-body card-block">
                                    	<%
                                    		if(request.getAttribute("objNew") != null) {
    	                            			News objNew = (News)request.getAttribute("objNew");
                                    	%>
                                        <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Tên Tin</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="text-input" name="text-input" value="<%=objNew.getName()%>" class="form-control">
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
                                            					if(objCat.getId() == objNew.getCat().getId()) {
                                                    %>
                                                        <option selected value="<%=objCat.getId()%>"><%=objCat.getCat_name() %></option>
                                                    <%} else {%>
                                                    	<option value="<%=objCat.getId()%>"><%=objCat.getCat_name() %></option>
                                                    <%}}}} %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Hình Ảnh</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="file" id="file-input" name="picture" class="form-control-file">
	                                                    <% if(!objNew.getPicture().isEmpty()) { %>
					                                        <br />
					                                        <img width="200px" height="200px" style="padding-bottom: 20px;" src="<%=request.getContextPath() %>/images/<%=objNew.getPicture() %>" alt="Ảnh cũ"/>
				                                    	<%} %>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Mô Tả</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <textarea name="desc-input" id="desc-input" rows="4" class="form-control"><%=objNew.getDesc() %></textarea>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Chi tiết</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <textarea name="content-input" id="editor" rows="9" placeholder="Nhập chi tiết" class="form-control"><%=objNew.getContent() %></textarea>
                                                </div>
                                            </div>
                                            <div class="card-footer">
	                                        <button type="submit" class="btn btn-primary btn-sm">
	                                            <i class="fas fa-edit"></i> Sửa
	                                        </button>
	                                        <button type="reset" type="reset" class="btn btn-danger btn-sm">
	                                            <i class="fas fa-ban"></i> Đặt Lại
	                                        </button>
                                    </div>
                                        </form>
                                        <%} %>
                                    </div>
                                </div>
                                <!-- END DATA TABLE -->
                            </div>
                        </div>
<script type="text/javascript">
	var editor = CKEDITOR.replace('editor');
	CKFinder.setupCKEditor(editor, '<%=request.getContextPath()%>/lib/ckfinder/');
</script>
<script>
document.getElementById("news").classList.add('active');
</script>
<%@include file="/templates/admin/inc/footer.jsp" %>   