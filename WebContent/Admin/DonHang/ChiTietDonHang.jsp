<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@page import="java.util.Map"%>
<%		ServletContext contextDangNhap=getServletContext();
					contextDangNhap.setAttribute("urlweb","Admin/DonHang/ChiTietDonHang.jsp");
				  if(	session.getAttribute("user")==null){
					response.sendRedirect("../index.jsp");
				  }%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%Map<String,DonHang> mapOrder = DonHangDAO.mapOrder ;%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  
    <title>Chi tiết đơn hàng | </title>

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
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <jsp:include page="../Menu/MenuCap.jsp"></jsp:include>

       

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Chi tiết đơn hàng</h3>
              </div>

            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">

                  <div class="x_content">
                    <br />
                  
                  
                 <!-- Table demo -->
	<div class="x_content">
                   <a href="ThemDonHang.jsp"> <button class="btn btn-sm btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"> </span>  Thêm đơn hàng</button></a>
                    
                    
                    <% 
		            String maDH=request.getParameter("id");
		            response.setContentType("text/html");  
		            DonHang d=null;
		    		//ServletContext context=getServletContext();  
		    		//maDH=(String)context.getAttribute("maDHChiTiet");  
     			   %>
                    
                    <table id="datatable-buttons" class=" table ">
                      <thead>
                        <tr>
                          <th>Tiêu đề</th>
                          <th>Mô tả</th>
                        </tr>
                      </thead>
                      <tbody>
           				   <% for(DonHang dh : mapOrder.values()){
           					   if(dh.getMaDonHang().equals(maDH)){
           						   d=dh;
           				   		}
           				   }
           					   if(d!=null){
           				   %>
           				 <tr>
           				  	<td>Mã đơn hàng</td>
           					<td> <%= d.getMaDonHang() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Ngày đặt hàng</td>
           				  	<td> <%=d.getNgayGui()%></td>
           				  </tr>
           				 <tr>
           				  	<td>Tên khách hàng</td>
           				  	<td> <%= d.getTenKhachHang()%></td>
           				  </tr>
           				 <tr>
           				  	<td>Tên sản phẩm</td>
           				  	<td> <%= d.getTenSanPham() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Tổng giá tiền (VNĐ)</td>
           				  	<td> <%= d.getTongSoTien()%></td>
           				  </tr>
           				 <tr>
           				  	<td>Số điện thoại</td>
           				  	<td> <%=d.getSdt() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Địa chỉ giao hàng</td>
           				  	<td> <%= d.getDiaChi() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Mô tả sản phẩm</td>
           				  	<td> <%= d.getMoTa() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Trạng thái giao hàng</td>
           				  	<td> <%=d.getTrangThai()%></td>
           				  </tr>
            <% } %>
                      </tbody>
                    </table>
                  </div>                  
                 <!-- Table demo -->
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
    
    
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
	
  </body>
</html>
