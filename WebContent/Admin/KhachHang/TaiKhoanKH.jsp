<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@page import="java.util.Map"%>
<%		ServletContext contextDangNhap=getServletContext();
					contextDangNhap.setAttribute("urlweb","Admin/KhachHang/TaiKhoanKH.jsp");
				  if(	session.getAttribute("user")==null){
					response.sendRedirect("../index.jsp");
				  }%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%Map<String,KhachHang> mapCustomer = KhachHangDAO.mapCustomer; %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Quản lí khách hàng </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="../vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="../vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="../vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="../vendors/starrr/dist/starrr.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    
     <!-- datatable -->
	<link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    
    <!-- inport excel -->
     <script src="../importExcel/agu.js"></script>
  <script src="../importExcel/xlsx.js"></script>
  <script src="../importExcel/xlsx-model.js"></script>
  <script src="../importExcel/script.js"></script>
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
      $('#btnExcel').on('click',function(event){
       var val = $('pre').text();
//          window.location.href('Excel?text='+val);
             $.post('../../Excel', {
  	                data : val,
             		action:'Customer'
  	        });
//          window.open(encodeURIComponent("Excel?text="+val));
      });
    });
  </script>
  </head>

  <body class="nav-md">
  <%User user=(User)session.getAttribute("user"); %>
    <div class="container body">
      <div class="main_container">
        <jsp:include page="../Menu/MenuCap.jsp"></jsp:include>
        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
           
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Quản lí thông tin tài khoản của khách hàng</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                       
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <%
                  if(user!=null){
                	  if(user.getRole().equalsIgnoreCase("boss")){
                  %>
                    <div class="row">
                         <a href="ThemTKKH.jsp"> 
                         <button type="button" class="btn btn-sm btn-success" aria-label="Right Align">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"> </span>  Thêm tài khoản
							</button></a>
							  <a href="../../KhachHang?action=DelAll"><button class="btn btn-sm btn-danger" id=""><span class="glyphicon glyphicon-trash"></span>  Xóa tất cả</button></a>
                         <%if(!KhachHangDAO.mapUndo.isEmpty()){ 
                        	 UndoDAO.undoCustomer.clear();
                         %>
                            <a href="../../KhachHang?action=UndoAll"><button class="btn btn-sm btn-success" id=""><i class="fa fa-undo" aria-hidden="true"></i>  Undo</button></a>
                            <%} %>
                        <%if(!UndoDAO.undoCustomer.isEmpty()){ %>
                            <a href="../../KhachHang?action=UndoOne"><button class="btn btn-sm btn-success" id=""><i class="fa fa-undo" aria-hidden="true"></i>  Undo</button></a>
                            <%} %>

                                <button type="button" class="btn btn-sm btn-info" data-toggle="collapse" data-target="#excel"><i class="fa fa-file-excel-o" aria-hidden="true"></i>   Import file excel</button>
                                <div id="excel" class="collapse">
                                    <jsp:include page="../importExcel/importcustomer.jsp"></jsp:include>
                                </div>
                    </div>
                    <%}} %>
                  
     			     <table id="datatable-buttons" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>STT</th>
                          <th>Tên tài khoản</th>
                          <th>Mật khẩu</th>
                          <th>Tên khách hàng</th>
                          <th>Email</th>
                          <th>Địa chỉ</th>
                          <th>Số điện thoại</th>
                          <th>Số tài khoản</th>
                          <%
                  if(user!=null){
                	  if(user.getRole().equalsIgnoreCase("boss")){
                  %>
                          <th>Xóa</th>
                          <th>Sửa</th>
                          <%}} %>
                        </tr>
                      </thead>
                      <tbody>
                        <%int count=0;  for(KhachHang rs  :mapCustomer.values()){count++;%>
           				 <TR>
               				 <TD> <%=count%></td>
               				 <TD> <%=rs.getUser()%></TD>
               				 <TD> ********</TD>
              				  <TD> <%=rs.getName()%></TD>
              				  <TD> <%=rs.getEmail()%></TD>
              				  <TD> <%=rs.getAddress()%></TD>
              				  <TD> <%=rs.getPhone()%></TD>
              				  <TD> <%=rs.getStk()%></TD>
              				  
              				  <%
                  if(user!=null){
                	  if(user.getRole().equalsIgnoreCase("boss")){
                  %>
                        	    <td><a href="../../KhachHang?action=Del&id=<%=rs.getId()%>">
		                        	  <button type="button" class="btn btn-danger" aria-label="Right Align">
										<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									</button>
                        	  </a></td>
                        	  <td><a href="SuaKhachHang.jsp?id=<%=rs.getId()%>">
		                        	  <button type="button" class="btn btn-primary" aria-label="Right Align">
										<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
									</button>
                        	  </a></td>
                        	  
                        	  <%}} %>
           				 </TR>
            <% } %>
                      </tbody>
                    </table>
                
                	</div>
                	
                	
                  </div>
                </div>
              </div>
            </div>

           

          
         

          
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
       	<jsp:include page="../Footer/Footer.jsp"></jsp:include>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
     <!-- datatable -->
 	<script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="../vendors/jszip/dist/jszip.min.js"></script>
    <script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="../vendors/pdfmake/build/vfs_fonts.js"></script>
    
    
    <script src="../build/js/custom.min.js"></script>
  
  </body>
</html>
