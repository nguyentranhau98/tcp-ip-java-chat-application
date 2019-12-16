<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Categories"%>
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
                                <h3 class="title-5 m-b-35">Danh Mục</h3>
                                <div class="table-data__tool">
                                    <div class="table-data__tool-right">
                                        <button onclick="window.location.href='<%=request.getContextPath() %>/admin/cat/add'" class="au-btn au-btn-icon au-btn--green au-btn--small">
                                            <i class="zmdi zmdi-plus"></i>Thêm danh mục mới</button>
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
                                        <strong>Sửa</strong> Danh Mục
                                    </div>
                                    <div class="card-body card-block">
                                        <form id="theForm" action="" method="post" class="form-horizontal">
                                            <%
                                            	Categories objCat = (Categories)request.getAttribute("objCat");
                                            %>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Tên danh mục</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="text-input" name="text-input" value="<%=objCat.getCat_name() %>" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="select" class=" form-control-label">Danh mục cha</label>
                                                </div>
                                                <%
                                                	@SuppressWarnings("unchecked")
                                                	ArrayList<Categories> listCats = (ArrayList<Categories>)request.getAttribute("listCats");
                                                %>
                                                <div class="col-12 col-md-9">
                                                    <select name="select" id="select" class="form-control">
                                                        <option value="0">Không</option>
                                                        <%
                                                        	for(Categories catItem:listCats) {
                                                        		if(catItem.getId_parent() == 0){
                                                        			if(objCat.getId_parent() == catItem.getId()) {
                                                        %>
                                                        <option selected value="<%=catItem.getId()%>"><%=catItem.getCat_name()%></option>
                                                        <%} else { %>
                                                        <option value="<%=catItem.getId()%>"><%=catItem.getCat_name()%></option>
                                                        <%}}} %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="card-footer">
		                                        <button type="submit" class="btn btn-primary btn-sm">
		                                            <i class="fa fa-dot-circle-o"></i> Sửa
		                                        </button>
		                                        <button type="reset" class="btn btn-danger btn-sm">
		                                            <i class="fa fa-ban"></i> Đặt lại
		                                        </button>
                                    		</div>
                                        </form>
                                    </div>
                                    
                                </div>
                                <!-- END DATA TABLE -->
                            </div>
                        </div>
<script type="text/javascript">
	$(document).ready(function() {
		$("#theForm").validate({
			rules:{
				"text-input": {
					required:true,
					minlength: 5,
					maxlength: 20,
				},
			},
			messages: {
				"text-input": {
					required:  "Tên danh mục không được để trống",
					minlength: "Tên danh mục tối thiểu 5 ký tự",
					maxlength: "Tên danh mục tối đa 20 ký tự",
				},
			},
		});
	});
</script>
<script>
document.getElementById("categories").classList.add('active');
</script>
<%@include file="/templates/admin/inc/footer.jsp" %>   