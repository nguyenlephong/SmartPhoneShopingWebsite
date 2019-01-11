 <%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@page import="java.util.Map"%>
<%		ServletContext contextDangNhap=getServletContext();
					contextDangNhap.setAttribute("urlweb","Admin/BinhLuan/BinhLuan.jsp");
				  if(	session.getAttribute("user")==null){
					response.sendRedirect("../index.jsp");
				  }
				  request.setCharacterEncoding("utf-8");
				  response.setCharacterEncoding("utf-8");
				  response.setContentType("text/html;charset=utf-8");
				  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%Map<String,BinhLuan> mapComment = BinhLuanDAO.mapComment; %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Quản lí bình luận | </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    
       <!-- datatable -->
	<link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
    
    
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
             		action:'Comment'
  	        });
//          window.open(encodeURIComponent("Excel?text="+val));
      });
    });
  </script>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="">
    
    <jsp:include page="../Menu/MenuCap.jsp"></jsp:include>

        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          
          <!-- /top tiles -->

          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">

                <div class="row x_title">
                  <div class="col-md-6">
                    <h3>Quản lí bình luận <small></small></h3>
                  </div>
                  <div class="col-md-6">
                    <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                      <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                      <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                    </div>
                  </div>
                </div>

				<div class="row" style="float:right">
						 <a href="ThongKeBinhLuan.jsp"> 
                         <button type="button" class="btn btn-sm btn-success" aria-label="Right Align">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"> </span>   Thống kê 
				        </button></a>
				
					  <a href="../../BinhLuan?action=DelAll"><button class="btn btn-sm btn-danger" id=""><span class="glyphicon glyphicon-trash"></span>  Xóa tất cả</button></a>
		                <%if(!BinhLuanDAO.mapUndo.isEmpty()){ 
		                	UndoDAO.undoCustomer.clear();
		                %>
		                    <a href="../../BinhLuan?action=UndoAll"><button class="btn btn-sm btn-success" id=""><i class="fa fa-undo" aria-hidden="true"></i>  Undo</button></a>
		                    <%} %>
		                  <%if(!UndoDAO.undoCustomer.isEmpty()){ %>
		                     <a href="../../BinhLuan?action=UndoOne"><button class="btn btn-sm btn-success" id=""><i class="fa fa-undo" aria-hidden="true"></i>  Undo</button></a>
		                   <%} %>
		                     <button type="button" class="btn btn-sm btn-info " data-toggle="collapse" data-target="#excel"><i class="fa fa-file-excel-o" aria-hidden="true"></i>   Import file excel</button>
		                         <div id="excel" class="collapse row">
		                             <jsp:include page="../importExcel/importcomment.jsp"></jsp:include>
		                          </div>
				</div>
              <!-- table demo -->
  				<div class="x_content">
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
                 		   for(BinhLuan b : mapComment.values()){
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
 
           <!-- table demo -->
                <div class="clearfix"></div>
                
           
              </div>
            </div>

          </div>
          <br />

      


          
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
  
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <!-- Skycons -->
    <!-- Flot -->
    <script src="../vendors/Flot/jquery.flot.time.js"></script>
    <!-- Flot plugins -->
    <!-- DateJS -->
    <script src="../vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
   
    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    
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
	
  </body>
</html>

