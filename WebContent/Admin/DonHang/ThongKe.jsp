<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%			ServletContext contextDangNhap=getServletContext();
					contextDangNhap.setAttribute("urlweb","Admin/DonHang/ThongKe.jsp");
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

    <title>Thống kê đơn hàng</title>
	<!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
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
    
    <script type="text/javascript">
  	$(document).ready(function(){
  		$('#tkweek').bind({
  			'submit':function(){
                        if($('#chonthangtheotuan').val()==''){
  							$('#chonthangtheotuan').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-chonthangtheotuan').html('Bạn không được bỏ trống trường này!');
  							return false;
  						}
  						
  						return true;	
  					 },
  			 'click':function(){
                        if($('#chonthangtheotuan').val().length>0){
  							$('#chonthangtheotuan').css('box-shadow','0px 0px 1px 1px green');
  							$('#error-chonthangtheotuan').html(' ');
  						}
  			 		  },
  			}
  		);
  	});
	$(document).ready(function(){
  		$('#thongke').bind({
  			'submit':function(){
                        if($('#test1').val()==''){
  							$('#test1').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-test1').html('Bạn không được bỏ trống trường này!');
  							return false;
  						}
                        if($('#test2').val()==''){
  							$('#test2').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-test2').html('Bạn không được bỏ trống trường này!');
  							return false;
  						}
  						
  						return true;	
  					 },
  			 'click':function(){
                        if($('#test1').val().length>0){
  							$('#test1').css('box-shadow','0px 0px 1px 1px green');
  							$('#error-test1').html(' ');
  						}
                        if($('#test2').val().length>0){
  							$('#test2').css('box-shadow','0px 0px 1px 1px green');
  							$('#error-test2').html(' ');
  						}
  			 		  },
  			}
  		);
  	});
	$(document).ready(function(){
  		$('#thongketheongay').bind({
  			'submit':function(){
                        if($('#testn').val()==''){
  							$('#testn').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-testn').html('Bạn không được bỏ trống trường này!');
  							return false;
  						}
  						return true;	
  					 },
  			 'click':function(){
                        if($('#testn').val().length>0){
  							$('#testn').css('box-shadow','0px 0px 1px 1px green');
  							$('#error-testn').html(' ');
  						}
  			 		  },
  			}
  		);
  	});
	$(document).ready(function(){
  		$('#thongkemonth').bind({
  			'submit':function(){
                        if($('#month').val()==''){
  							$('#month').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-month').html('Bạn không được bỏ trống trường này!');
  							return false;
  						}
  						return true;	
  					 },
  			 'click':function(){
                        if($('#month').val().length>0){
  							$('#month').css('box-shadow','0px 0px 1px 1px green');
  							$('#error-month').html(' ');
  						}
  			 		  },
  			}
  		);
  	});
  
  </script>
    
    
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
					  <h2>Thông kê đơn hàng</h2>
					  <ul class="nav nav-tabs">
					    <li><a data-toggle="tab" href="#khoangngay">Theo khoảng ngày</a></li>
					    <li><a data-toggle="tab" href="#ngay">Theo ngày</a></li>
					    <li><a data-toggle="tab" href="#tuan">Theo tuần</a></li>
					    <li><a data-toggle="tab" href="#thang">Theo tháng</a></li>
					    
					  </ul>
					
					  <div class="tab-content">
					    <div id="khoangngay" class="tab-pane fade in active">
							<jsp:include page="ThongKeDonHang.jsp"></jsp:include>
					    </div>
					    <div id="ngay" class="tab-pane fade">
							<jsp:include page="ThongKeTheoNgay.jsp"></jsp:include>
					    </div>
					    <div id="tuan" class="tab-pane fade">
							<jsp:include page="ThongKeTheoTuan.jsp"></jsp:include>
					    </div>
					    <div id="thang" class="tab-pane fade">
							<jsp:include page="ThongKeTheoThang.jsp"></jsp:include>
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

    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    
      <!-- Datatables -->
    <!-- <script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script> -->
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
    
    <!-- Script modal đổi số lượng sản phẩm -->
  	
    <!-- Script đổi khách hàng -->
</html>