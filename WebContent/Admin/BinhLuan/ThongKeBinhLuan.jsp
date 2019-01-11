<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%			ServletContext contextDangNhap=getServletContext();
					contextDangNhap.setAttribute("urlweb","Admin/BinhLuan/ThongKeBinhLuan.jsp");
				  if(	session.getAttribute("user")==null){
					response.sendRedirect("../index.jsp");
				  }%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Thống kê bình luận</title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    
     <!-- Datatables -->
    <link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
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
              <div class="container">
                <div class="row">
                   <form action="../../ThongKe?action=BinhLuan" method="post" id="thongke">
                     <div class="col-sm-3">
                        <h3><strong>Thời gian bắt đầu:</strong></h3>
                        <input type="date" id="test1" name="startDate" />
                        <p id="error-test1"></p>
                    </div>
                    <div class="col-sm-3">
                         <h3><strong>Thời gian kết thúc:</strong></h3>
                            <input type="date" id="test2" name="endDate" />
                             <p id="error-test2"></p>
                    </div>
                    <div class="col-sm-3">
                        <button type="submit"  style="margin-top:43px" class="btn btn-dangger">Thống kê</button>
                    </div> 
                   </form>

                </div>
                <div class="row">
                    <div class=" col-sm-12">
                         <div class="panel panel-primary">
                          <div class="panel-heading" style="text-align:center">Danh sách các bình luận</div>
                          <%
                          if(session.getAttribute("bld1")!=null && session.getAttribute("bld2")!=null){
                          Date d1 =(Date)session.getAttribute("bld1");
                          Date d2 =(Date)session.getAttribute("bld2");
                      /*     Map<String,DonHang> dh = new ThongKeDAO().danhSachTheoKhoangNgay(DonHangDAO.mapDonHang, d1, d2); */
                          Map<String,BinhLuan> bl = new ThongKeDAO(d1,d2).mapBinhLuanThongKe;

                          if(bl!=null){
                          %>

                          <div class="panel-body ">
								 <table id="datatable-buttons" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>STT</th>
                          <th>Tên khách hàng</th>
                          <th>Ngày gởi</th>
                          <th>Nội dung</th>
                          <th>Xóa</th>
                          <th>Sửa</th>
                        </tr>
                      </thead>
                      <tbody>
                        <%int count=0;
                 		   for(BinhLuan b : bl.values()){
                 			   count++; %>
           				 <TR>
               				 <TD> <%= count %></td>
               				 <TD> <%= b.getTen()%></TD>
               				 <TD> <%= b.getNgay()%></TD>
              				  <TD> <%= b.getNoiDung() %></TD>
                        	    <td><a href="../../BinhLuan?action=Del&id=<%=b.getStt()%>">
		                        	  <button type="button" class="btn btn-danger" aria-label="Right Align">
										<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									</button>
                        	  </a></td>
                        	  <td><a href="SuaBinhLuan.jsp?id=<%=b.getStt()%>">
		                        	  <button type="button" class="btn btn-primary" aria-label="Right Align">
										<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
									</button>
                        	  </a></td>
           				 </TR>
            <% } %>
                      </tbody>
                    </table>
						</div>
                          <%} }%>
                        </div>
                    </div>
                </div>

            </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

		<!-- Modal sửa số lượng sản phẩm cần mua -->
		
	

        <!-- footer content -->
       <jsp:include page="../Footer/Footer.jsp"></jsp:include>
        <!-- /footer content -->
      </div>
    </div>
</body>
<!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    
      <!-- Datatables -->
    <script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    
    <!-- Script modal đổi số lượng sản phẩm -->
  	
    <!-- Script đổi khách hàng -->
</html>