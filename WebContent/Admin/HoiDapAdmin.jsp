<%@page import="java.util.Map.Entry"%>
<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Hỏi Đáp </title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="vendors/starrr/dist/starrr.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <link rel="stylesheet" href="css/common.css">
        <link rel="stylesheet" href="css/03.css">
	<link rel="stylesheet" href="css/hoidapad.css">
	<link rel="stylesheet" href="css/ace-skins.min.css" />
<link rel="stylesheet" href="css/ace-rtl.min.css" />
    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript"> 
    </script>
</head>
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
 <jsp:include page="Menu/Menu.jsp"></jsp:include>

<!-- page content -->
<%! Map<Integer,CauHoi> ds ; %>
<% HoiDapDAO dao; %>
<% 

ds=(Map<Integer,CauHoi>) session.getAttribute("dsHoiDap");
	dao= HoiDapDAO.getInstance(); 
if(ds == null ){
	ds = (Map<Integer,CauHoi>) dao.dsCauHoi;
}
%>
<div class="right_col" role="main">

   <div class="row top_tiles">
      <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="tile-stats">
          <div class="icon"><i class="fa fa-caret-square-o-right"></i></div>
          <div class="count"><%= dao.dsCauHoi.size() %></div>
          <h3>Tổng Số Câu Hỏi</h3>
      </div>
  </div>
  <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="tile-stats">
      <div class="icon"><i class="fa fa-comments-o"></i></div>
      <div class="count"><%=dao.dsCauHoi.size()-dao.soCauChuaTraLoi+1 %></div>
      <h3>Số Câu Đã Trả Lời</h3>
     
  </div>
</div>
<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="tile-stats">
      <div class="icon"><i class="fa fa-sort-amount-desc"></i></div>
      <div class="count"><%= dao.soCauChuaTraLoi %></div>
      <h3>Số Câu Chưa Trả Lời</h3>
  </div>
</div>
<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="tile-stats">
      <div class="icon"><i class="fa fa-check-square-o"></i></div>
      <div class="count"><%= dao.soCauHoiNhieu %></div>
      <h3>Số Câu Xem Nhiều</h3>
      
  </div>
</div>

</div>
<div class="row">
 <div class="x_panel">
    <iframe src="BieuDoHoiDap.jsp" width= 100% height=500px border= "none">
    
</iframe>
</div>
</div>
<script src="jquery/jquery.min.js"></script>
    
    <!-- Example JavaScript -->
    <script src="js/03.js"></script>
    
<div class="row">
   <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Tổng hợp tất cả các câu hỏi trên websites</h2>
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
                   <!-- table demo -->
                <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                     Danh sách các câu hỏi theo mã sản phẩm:
                    </p>
                    <table id="datatable-buttons" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>Mã Hỏi Đáp</th>
                          <th>Câu Hỏi</th>
                          <th>Mã Sản Phẩm</th>
                          <th>Người Đăng</th>
                          <th>Ngày Đăng</th>
						<th class="hidden-480">Tình Trạng</th>
							
                          <th>Xóa</th>
                          <th>Sửa</th>
                          <th>Trả Lời</th>

                        </tr>
                      </thead>
                      <tbody>
                        <% 
                        for(Entry<Integer,CauHoi> hd : ds.entrySet()){
                        	%>
                         <TR>
                             <TD><%out.print(hd.getValue().getStt()); %></td>
                             <TD>  <%out.print(hd.getValue().getTenCauHoi());%></TD>
                             <TD>  <%out.print(hd.getValue().getMaSanPham());%></TD>
                             <TD>  <%out.print(hd.getValue().getNguoiDang());%></TD>
                             <TD> <%out.print(hd.getValue().getNgayDang());%></TD>
                             <td class="hidden-480"><span
													class="label label-sm label-warning"> <%= hd.getValue().getTrangThai() %></span>
												</td>
                             
                                <td><a href="../XuLyHoiDap?action=xoa&maHD=<%=hd.getValue().getStt()%>">
                                      <button type="button" class="btn btn-danger" aria-label="Right Align">
                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    </button>
                              </a></td>
                              <td><a href="../XuLyHoiDap?action=sua&maHD=<%=hd.getValue().getStt()%>	">
                                      <button type="button" class="btn btn-primary" aria-label="Right Align">
                                        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                    </button>
                              </a></td>
                                 <td><a href="../XuLyHoiDap?action=traloi&maHD=<%=hd.getValue().getStt()%> ">
                                      <button type="button" class="btn btn-success" aria-label="Right Align">
                                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                    </button>
                              </a></td>
                              <%  } %>
                      </tbody>
                    </table>	
                  </div>
 
           <!-- table demo -->
                </div>
              </div>


</div>
<!-- /page content -->

<!-- footer content -->
<footer>
  <div class="pull-right">
    Lập trình web - Quản lí trang bán hàng điện thoại di động - Cô Thơ & cô Nga
</div>
<div class="clearfix"></div>
</footer>
<!-- /footer content -->
</div>
</div>

<!-- jQuery -->
<script src="vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="vendors/nprogress/nprogress.js"></script>
<!-- bootstrap-progressbar -->
<script src="vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="vendors/iCheck/icheck.min.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="vendors/moment/min/moment.min.js"></script>
<script src="vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap-wysiwyg -->
<script src="vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
<script src="vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
<script src="vendors/google-code-prettify/src/prettify.js"></script>
<!-- jQuery Tags Input -->
<script src="vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
<!-- Switchery -->
<script src="vendors/switchery/dist/switchery.min.js"></script>
<!-- Select2 -->
<script src="vendors/select2/dist/js/select2.full.min.js"></script>
<!-- Parsley -->
<script src="vendors/parsleyjs/dist/parsley.min.js"></script>
<!-- Autosize -->
<script src="vendors/autosize/dist/autosize.min.js"></script>
<!-- jQuery autocomplete -->
<script src="vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
<!-- starrr -->
<script src="vendors/starrr/dist/starrr.js"></script>
<!-- Custom Theme Scripts -->
<script src="build/js/custom.min.js"></script>

<!-- database -->
<script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="vendors/jszip/dist/jszip.min.js"></script>
    <script src="vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="vendors/pdfmake/build/vfs_fonts.js"></script>


</body>
</html>
