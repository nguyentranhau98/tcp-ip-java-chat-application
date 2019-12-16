<%@page import="model.dao.CategoryDAO"%>
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
                                <h3 class="title-5 m-b-35">Danh Mục</h3>
                                <%
	                            	if(user.getRole().equals("Admin")) {
	                            %>
                                <div class="table-data__tool">
                                    <div class="table-data__tool-right">
                                        <button onclick="window.location.href='<%=request.getContextPath() %>/admin/cat/add'" class="au-btn au-btn-icon au-btn--green au-btn--small">
                                            <i class="zmdi zmdi-plus"></i>Thêm danh mục mới</button>
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
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                        <thead>
                                            <tr>
                                                <th>id danh mục</th>
                                                <th>tên danh mục</th>
                                                <th>chức năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<%
                                        		CategoryDAO catDAO = new CategoryDAO();
                                        		@SuppressWarnings("unchecked")
                                        		ArrayList<Categories> listCats = (ArrayList<Categories>)request.getAttribute("listCats");
                                        		for(Categories objCat:listCats) {
                                        			if(objCat.getId_parent() == 0) {
                                        	%>
                                            <tr class="tr-shadow">
                                                <td><%=objCat.getId() %></td>
                                                <td><%=objCat.getCat_name() %>
                                                	<%
                                                		if(catDAO.getSubItems(objCat.getId()).size() > 0){
                                                			ArrayList<Categories> subCats = catDAO.getSubItems(objCat.getId());
                                                			for(Categories subCat:subCats) {
                                                	%>
                                                	<ul style="font-size:12px; padding-left:20px;">
                                                		<li>
                                                			<%=subCat.getCat_name() %>
                                                			<%
							                            		if(user.getRole().equals("Admin")) {
							                           		%>
                                                			<a href="<%=request.getContextPath() %>/admin/cat/edit?id=<%=subCat.getId() %>" class="fas fa-edit" title="Edit"></a>
                                                			<a href="" onclick="return ConfirmDelete(<%=subCat.getId() %>)" class="fas fa-trash-alt" title="Delete"></a>
                                                			<%} %>
                                                		</li>
                                                	</ul>
                                                	<%}} %>
                                                </td>
                                                <td>
                                                	<%
					                            		if(user.getRole().equals("Admin")) {
					                           		%>
                                                    <div class="table-data-feature">
                                                        <button onclick="window.location.href='<%=request.getContextPath() %>/admin/cat/edit?id=<%=objCat.getId() %>'" class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                                            <i class="zmdi zmdi-edit"></i>
                                                        </button>
                                                        <button class="item" data-toggle="tooltip" data-placement="top" onclick="return ConfirmDelete(<%=objCat.getId() %>)" title="Delete">
                                                            <i class="zmdi zmdi-delete"></i>
                                                        </button>
                                                    </div>
                                                    <%} %>
                                                </td>
                                            </tr>
                                            <%}} %>
                                        </tbody>
                                    </table>
                                    <script type="text/javascript">
	                                    function ConfirmDelete(cid)
	                                    {
	                                 	  var x = cid;
	                                      var check = confirm("Bạn có chắc chắn muốn xóa?");
	                                      if (check){
	                                          return window.location.href = "<%=request.getContextPath() %>/admin/cat/del?id=" + cid;
	                                      }
	                                    }
                                    </script>
                                </div>
                                <!-- END DATA TABLE -->
                            </div>
                        </div>
<script>
document.getElementById("categories").classList.add('active');
</script>
<%@include file="/templates/admin/inc/footer.jsp" %>   