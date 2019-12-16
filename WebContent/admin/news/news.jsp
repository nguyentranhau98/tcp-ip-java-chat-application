<%@page import="model.bean.News"%>
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
                                <%
	                            	if(user.getRole().equals("Admin")) {
	                            %>
                                <div class="table-data__tool">
                                    <div class="table-data__tool-right">
                                        <button onclick="window.location.href='<%=request.getContextPath()%>/admin/new/add'" class="au-btn au-btn-icon au-btn--green au-btn--small">
                                            <i class="zmdi zmdi-plus"></i>Thêm tin mới</button>
                                    </div>
                                </div>
                                <%} %>
                                <div class="table-responsive table-responsive-data2">
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
                                    <table class="table table-data2">
                                        <thead>
                                            <tr>
                                                <th>id</th>
                                                <th>tên tin</th>
                                                <th>danh mục</th>
                                                <th>hình ảnh</th>
                                                <th>chức năng</th>
                                            </tr>
                                        </thead>
                                        <%
	                                        int numberOfPages = (Integer)request.getAttribute("numberOfPages");
			                            	int currentPage = (Integer)request.getAttribute("currentPage");
                                        	ArrayList<News> listNews = new ArrayList<News>();
                                       		if(request.getAttribute("listNews") != null) {
                                        	listNews = (ArrayList<News>)request.getAttribute("listNews");
                                        	if(listNews.size() > 0) {
                                				for(News objNew:listNews){
                                					String urlEdit = request.getContextPath()+"/admin/new/edit?page=" + currentPage + "&id=" + objNew.getId();
                                        %>
                                        <tbody>
                                            <tr class="tr-shadow">
                                                <td><%=objNew.getId() %></td>
                                                <td>
                                                    <span><%=objNew.getName() %></span>
                                                </td>
                                                <td class="desc"><%=objNew.getCat().getCat_name() %></td>
                                                <td><img width="200px" height="200px" src="<%=request.getContextPath() %>/images/<%=objNew.getPicture() %>" alt="Image"/></td>
                                                <td>
                                                	<%
					                            		if(!user.getRole().equals("Người dùng")) {
					                           		%>
                                                    <div class="table-data-feature">
                                                        <button onclick="window.location.href='<%=urlEdit%>'" class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                                            <i class="zmdi zmdi-edit"></i>
                                                        </button>
                                                        <button onclick="return ConfirmDelete(<%=objNew.getId()%>, <%=currentPage %>)" class="item" data-toggle="tooltip" data-placement="top" title="Delete">
                                                            <i class="zmdi zmdi-delete"></i>
                                                        </button>
                                                    </div>
                                                    <%} %>
                                                </td>
                                            </tr>
                                            <tr class="spacer"></tr>
                                            <%}}} %>
                                        </tbody>
                                    </table>
                                    <%
		                            	if(listNews != null && listNews.size() >= 0) {
		                            %>
		                            <div class="row">
		                                <div class="col-sm-6">
		                                	<%
		                                		int start = (Integer)request.getAttribute("offset") + 1;
		                                		int end = (Integer)request.getAttribute("offset") + listNews.size();
		                                		int total = (Integer)request.getAttribute("numberOfNews");
		                                		String disabled = "";
		                                		if(currentPage == 1) {
		                                			disabled = " disabled";
		                                		} else {
		                                			disabled = "";
		                                		}
		                                	%>
		                                    <div class="dataTables_info" id="dataTables-example_info" style="margin-top:27px">Hiển thị từ <%=start%> đến <%=end%> của <%=total %> tin.</div>
		                                </div>
		                                <div class="col-sm-6" style="text-align: right;">
		                                    <nav aria-label="..." style="float: right;">
                                        <ul class="pagination">
                                            <li class="page-item <%=disabled %>">
                                            	<a class="page-link" tabindex="-1" href="<%=request.getContextPath()%>/admin/new/index/<%=currentPage-1%>">Trang trước</a>
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
                                            <a class="page-link" tabindex="-1" href="<%=request.getContextPath()%>/admin/new/index/<%=i%>"><%=i %></a>
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
                                            <a class="page-link" tabindex="-1" href="<%=request.getContextPath()%>/admin/new/index/<%=currentPage+1%>">Trang tiếp</a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <%} %>
                                </div>
                                <!-- END DATA TABLE -->
                            </div>
                        </div>
<script type="text/javascript">
 function ConfirmDelete(nid, page)
 {
 var x = nid;
   var check = confirm("Bạn có chắc chắn muốn xóa?");
   if (check){
       return window.location.href = "<%=request.getContextPath() %>/admin/new/del?page="+page+"&id=" + nid;
   }
 }
</script>
<script>
document.getElementById("news").classList.add('active');
</script>
<%@include file="/templates/admin/inc/footer.jsp" %>   