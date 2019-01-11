  <%		ServletContext contextDangNhap=getServletContext();
					contextDangNhap.setAttribute("urlweb","Admin/NhaSanXuat/ThemNSX.jsp");
				  if(	session.getAttribute("user")==null){
					response.sendRedirect("../index.jsp");
				  }%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.*" %>
<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  
    <title>Thêm nhà sản xuất | </title>
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
  		$('#addProducer').bind({
  			'submit':function(){
  						if($('#producerName').val()==''){
  							$('#producerName').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-producerName').html('Bạn không được bỏ trống trường này!');
  							$('#icon-producerName').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if($('#maNSX').val()==''){
  							$('#maNSX').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-maNSX').html('Bạn không được bỏ trống trường này!');
  							$('#icon-maNSX').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#maSanPham').val()==''){
  							$('#maSanPham').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-maSanPham').html('Bạn không được bỏ trống trường này!');
  							$('#icon-maSanPham').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if(!validatePhone($('#phone').val())){
  							$('#phone').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-phone').html('Số điện thoại bạn nhập không đúng!!! ');
  							$('#icon-phone').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#address').val()==''){
  							$('#address').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-address').html('Bạn không được bỏ trống trường này!');
  							$('#icon-address').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						return true;	
  					 },
  			 'keyup':function(){
  						if($('#producerName').val().length>0){
  							$('#producerName').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-producerName').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-producerName').html(' ');
  						}
                        if($('#maNSX').val().length>0){
  							$('#maNSX').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-maNSX').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-maNSX').html(' ');
  						}
  						if($('#maSanPham').val().length>0){
  							$('#maSanPham').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-maSanPham').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-maSanPham').html(' ');
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
                    <h2> Thêm nhà cung cấp sản phẩm</h2>
                     <a href="NhaSanXuat.jsp" style="float:right"><button class="btn btn-sm btn-primary" type="button"><i class="fa fa-undo" aria-hidden="true"></i>  Trở về</button></a>
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
                    <form id="addProducer" data-parsley-validate class="form-horizontal form-label-left"  action="../../Producer?action=Add" method="post">
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Mã nhà sản xuất <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                  <input type="text" id="maNSX" name="maNSX" class="form-control col-md-7 col-xs-12"  value="">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-maNSX"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-maNSX"></p>	
							</div>
                        </div>
                      </div>
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Mã sản phẩm <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <input type="text" id="maSanPham" name="other_id" class="form-control col-md-7 col-xs-12" value="">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-maSanPham"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-maSanPham"></p>	
							</div>
                        </div>
                      </div>
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Tên nhà sản xuất <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                <input type="text" id="producerName" name="name" class="form-control col-md-7 col-xs-12" value="">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-producerName"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-producerName"></p>	
							</div>
                        </div>
                      </div>
                     
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Địa chỉ <span class="required">*</span>
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Số điện thoại<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <input type="text" id="phone" name="sdt" class="form-control col-md-7 col-xs-12" value="">
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
                     
                   
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"> </span>  Thêm NSX</button>
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
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
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
