  <%		ServletContext contextDangNhap=getServletContext();
					contextDangNhap.setAttribute("urlweb","Admin/DonHang/ThemDonHang.jsp");
				  if(	session.getAttribute("user")==null){
					response.sendRedirect("../index.jsp");
				  }%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  
    <title>Thêm đơn hàng | </title>
    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>    
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

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    
    <script type="text/javascript">
  	$(document).ready(function(){
  		function validatePhone(txtPhone) {
  		    var filter = /^[0-9-+]+$/;
  		    if (filter.test(txtPhone+"") && txtPhone.length>=10 && txtPhone.length<12 ) {
  		        return true;
  		    }
  		    else {
  		        return false;
  		    }
  		}
  		function validateEmail(sEmail) {
  		    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
  		    if (filter.test(sEmail) ) {
  		        return true;
  		    }
  		    else {
  		        return false;
  		    }
  		}
  		$('#addorder').bind({
  			'submit':function(){
                        if($('#maDonHang').val()==''){
  							$('#maDonHang').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-maDonHang').html('Bạn không được bỏ trống trường này!');
  							$('#icon-maDonHang').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#ngayDatHang').val()==''){
  							$('#ngayDatHang').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-ngayDatHang').html('Bạn không được bỏ trống trường này!');
  							$('#icon-ngayDatHang').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#name').val()==''){
  							$('#name').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-name').html('Bạn không được bỏ trống trường này!');
  							$('#icon-name').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#status').val()==''){
  							$('#status').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-status').html('Bạn không được bỏ trống trường này!');
  							$('#icon-status').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if($('#productName').val()==''){
  							$('#productName').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-productName').html('Bạn không được bỏ trống trường này!');
  							$('#icon-productName').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#price').val()==''){
  							$('#price').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-price').html('Bạn không được bỏ trống trường này!');
  							$('#icon-price').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if(!validatePhone($('#phone').val())){
  							$('#phone').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-phone').html(' Sá»‘ Ä‘iá»‡n thoáº¡i báº¡n nháº­p khĂ´ng Ä‘Ăºng!!! ');
  							$('#icon-phone').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#address').val()==''){
  							$('#address').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-address').html('Bạn không được bỏ trống trường này!');
  							$('#icon-address').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
//                        if($('#info').val()==''){
//  							$('#info').css('box-shadow','0px 0px 2px 2px red');
//  							$('#error-info').html('Bạn không được bỏ trống trường này!');
//  							$('#icon-info').html('<span class=" glyphicon glyphicon-remove"></span>');
//  							return false;
//  						}
  						
  						return true;	
  					 },
  			 'keyup':function(){
                        if($('#maDonHang').val().length>0){
  							$('#maDonHang').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-maDonHang').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-maDonHang').html(' ');
  						}
  						if($('#ngayDatHang').val().length>0){
  							$('#ngayDatHang').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-ngayDatHang').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-ngayDatHang').html(' ');
  						}
  						if($('#name').val().length>0){
  							$('#name').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-name').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-name').html(' ');
  						}
  						if($('#status').val().length>0){
  							$('#status').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-status').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-status').html(' ');
  						}
  						if($('#productName').val().length>0){
  							$('#productName').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-productName').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-productName').html(' ');
  						}
  						if($('#price').val().length>0){
  							$('#price').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-price').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-price').html(' ');
  						}
                        if($('#phone').val().length>0){
  							$('#phone').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-phone').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-phone').html(' ');
  						}
  						if($('#address').val().length>0){
  							$('#address').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-address').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-address').html(' ');
  						}
//                        if($('#info').val().length>0){
//  							$('#info').css('box-shadow','0px 0px 1px 1px green');
//  							$('#icon-info').html('<span class="glyphicon glyphicon-ok "></span>');
//  							$('#error-info').html(' ');
//  						}
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
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2> Thêm đơn đặt hàng</h2>
                    <a href="DonHang.jsp" style="float:right"><button class="btn btn-sm btn-primary" type="button"><i class="fa fa-undo" aria-hidden="true"></i>  Trở về</button></a>
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
                    <form id="addorder" data-parsley-validate class="form-horizontal form-label-left"  action="../../Order?action=Add" method="post">
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" id="">Mã đơn hàng <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                <input type="text" id="maDonHang" name="other_id" class="form-control col-md-7 col-xs-12" value="">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-maDonHang"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-maDonHang"></p>	
							</div>
                        </div>
                      </div>
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Ngày đặt hàng <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="row">
                               <div class="col-sm-8">
                                <input type="date" id="ngayDatHang"  name="date" class="form-control col-md-7 col-xs-12" value="">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-ngayDatHang"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-ngayDatHang"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Tên khách hàng <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <input type="text" id="name"  name="name" class="form-control col-md-7 col-xs-12" value="">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-name"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-name"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Tổng số tiền đặt hàng <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="row">
                               <div class="col-sm-8">
                                 <input type="number" id="price" name="count" class="form-control col-md-7 col-xs-12" value="">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-price"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-price"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Tên sản phẩm<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <input type="text" id="productName" name="tenSP" class="form-control col-md-7 col-xs-12" value="">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-productName"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-productName"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Địa chỉ giao hàng<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="row">
                               <div class="col-sm-8">
                                 <input type="text" id="address" name="address" class="form-control col-md-7 col-xs-12" value="">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-address"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-address"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Mô tả sản phẩm <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                  <textarea type="text" id="info" name="mota" class="form-control col-md-7 col-xs-12" value=""></textarea>
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-info"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-info"></p>	
							</div>
                        </div>
                      </div>
                         <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Số điện thoại <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <input id="phone" class="form-control col-md-7 col-xs-12"  type="number" name="sdt" value="">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-phone"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-phone"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">Trạng thái giao hàng <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="row">
                               <div class="col-sm-8">
                                 <input type="text" id="status" name="status"  class="form-control col-md-7 col-xs-12" value="">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-status"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-status"></p>	
							</div>
                        </div>
                      </div>
                   
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="submit" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>  Thêm đơn hàng</button>
                        </div>
                      </div>

                    </form>
                  </div>
                </div>
              </div>
            </div>

           </div>
           </div>
          
        <!-- footer content -->
     	 <jsp:include page="../Footer/Footer.jsp"></jsp:include>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../endors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-wysiwyg -->
    <script src="../vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
    <script src="../vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
    <script src="../vendors/google-code-prettify/src/prettify.js"></script>
    <!-- jQuery Tags Input -->
    <script src="../vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
    <!-- Switchery -->
    <script src="../vendors/switchery/dist/switchery.min.js"></script>
    <!-- Select2 -->
    <script src="../vendors/select2/dist/js/select2.full.min.js"></script>
    <!-- Parsley -->
    <script src="../vendors/parsleyjs/dist/parsley.min.js"></script>
    <!-- Autosize -->
    <script src="../vendors/autosize/dist/autosize.min.js"></script>
    <!-- jQuery autocomplete -->
    <script src="../vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
    <!-- starrr -->
    <script src="../vendors/starrr/dist/starrr.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
	
  </body>
</html>
