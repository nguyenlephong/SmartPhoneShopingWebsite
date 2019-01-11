<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@page import="java.util.Map"%>
<%		ServletContext contextDangNhap=getServletContext();
					contextDangNhap.setAttribute("urlweb","Admin/SanPham/ChiTietSanPham.jsp");
				  if(	session.getAttribute("user")==null){
					response.sendRedirect("../index.jsp");
				  }%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%Map<String,SanPham> mapProduct = SanPhamDAO.mapProduct; %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  
    <title>Chi tiết sản phẩm </title>

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
            
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Chi tiết từng sản phẩm</h2>
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
                  
                  
                 <!-- Table demo -->
	<div class="x_content">
                  
                    
                    <% 
		    		String id=request.getParameter("ID");
		    		SanPham sp = null;
		    		for(SanPham sanpham:mapProduct.values()){
		    			if(sanpham.getMaSanPham().equals(id)){
		    				sp=sanpham;
		    			}
		    		}
						
		    		%>
                    
                    <table id="datatable-buttons" class=" table ">
                      <thead>
                        <tr>
                          <th>Tiêu đề</th>
                          <th>Mô tả</th>
                        </tr>
                      </thead>
                      <tbody>
           				   <% if(sp!=null){%>
           				 <tr>
           				  	<td>Mã sản phẩm</td>
           					<td> <%= sp.getMaSanPham() %></td>
           				  </tr>
           				  <tr>
           				  	<td>Tên sản phẩm</td>
           				  	<td> <%= sp.getTenSanPham()%></td>
           				  </tr>
           				 <tr>
           				  	<td>Ram</td>
           				  	<td> <%= sp.getRam() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Tốc độ xử lý</td>
           				  	<td> <%=sp.getTocDoCPU()%></td>
           				  </tr>
           				 <tr>
           				  	<td>Hệ điều hành</td>
           				  	<td> <%= sp.getHeDieuHanh()%></td>
           				  </tr>
           				 <tr>
           				  	<td>Công nghệ màn hình</td>
           				  	<td> <%= sp.getCongNgheManHinh() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Độ phân giải</td>
           				  	<td> <%= sp.getDoPhanGiai() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Màn hình</td>
           				  	<td> <%= sp.getManHinhRong() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Camera trước</td>
           				  	<td> <%=sp.getCameraTruoc()%></td>
           				  </tr>
           				 <tr>
           				  	<td>Camera sau</td>
           				  	<td> <%= sp.getCameraSau() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Bộ nhớ trong</td>
           				  	<td> <%=sp.getBoNhoTrong()%></td>
           				  </tr>
           				 <tr>
           				  	<td>Chất liệu</td>
           				  	<td> <%=sp.getChatLieu() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Kích thước</td>
           				  	<td> <%= sp.getKichThuoc() %></td>
           				  </tr>
           				 <tr>
           				  	<td>CPU</td>
           				  	<td> <%= sp.getTocDoCPU() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Hỗ trợ thẻ nhớ</td>
           				  	<td> <%= sp.getBoNhoTrong() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Kết nối mạng</td>
           				  	<td> <%= sp.getMang() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Thẻ sim</td>
           				  	<td> <%=sp.getSim() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Loại pin</td>
           				  	<td> <%= sp.getLoaiPin() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Dung lượng pin</td>
           				  	<td> <%= sp.getDungLuongPin() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Cảm ứng</td>
           				  	<td> <%=sp.getMatKinhCamUng() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Đèn flash</td>
           				  	<td> <%= sp.getDenFlash() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Wifi</td>
           				  	<td> <%= sp.getWifi()%></td>
           				  </tr>
           				 <tr>
           				  	<td>GPS</td>
           				  	<td> <%= sp.getGps()%></td>
           				  </tr>
           				 <tr>
           				  	<td>Trọng lượng</td>
           				  	<td> <%= sp.getTrongLuong() %></td>
           				  </tr>
           				 
           				 <tr>
           				  	<td>Giá sản phẩm (VNĐ)</td>
           				  	<td> <%= sp.getGiaSanPham() %></td>
           				  </tr>
           				 <tr>
           				  	<td>Hình ảnh</td>
           				  	<td><img src="../../<%=sp.getUrlHinhAnh()%>" width="50px" height="50px"></td>
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
