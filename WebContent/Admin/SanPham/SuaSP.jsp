<%@page import="java.util.Map"%>
<%		ServletContext contextDangNhap=getServletContext();
					contextDangNhap.setAttribute("urlweb","Admin/SanPham/SuaSP.jsp");
				  if(	session.getAttribute("user")==null){
					response.sendRedirect("../index.jsp");
				  }%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
     <%Map<String,SanPham> mapProduct = SanPhamDAO.mapProduct; %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  
    <title>Sửa sản phẩm </title>
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
    
     <!-- script upload hình ảnh -->
      <script src="lib_upload/jquery.min.js"></script>
        <script src="lib_upload/ajaxupload.js"></script>
        <script>
            $(document).ready(function() {
                $('input[type="file"]').ajaxfileupload({
                    'action': '../../UploadFileImage',
                    'onComplete': function(response) {
                        $('#upload').hide();
                        $('#uploadComplete').show();
                    },
                    'onStart': function() {
                        $('#uploadComplete').hide();
                        $('#upload').show();
                    }
                });
            });

        </script>
    
    <style type="text/css">
            .centered {
                width: 100%;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
            }

        </style>
    
    
     <script type="text/javascript">
  	$(document).ready(function(){
  		$('#editProduct').bind({
  			'submit':function(){
  						if($('#productName').val()==''){
  							$('#productName').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-productName').html('Bạn không được bỏ trống trường này!');
  							$('#icon-productName').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#giaSanPham').val()==''){
  							$('#giaSanPham').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-giaSanPham').html('Bạn không được bỏ trống trường này!');
  							$('#icon-giaSanPham').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#congNgheManHinh').val()==''){
  							$('#congNgheManHinh').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-congNgheManHinh').html('Bạn không được bỏ trống trường này!');
  							$('#icon-congNgheManHinh').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#doPhanGiai').val()==''){
  							$('#doPhanGiai').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-doPhanGiai').html('Bạn không được bỏ trống trường này!');
  							$('#icon-doPhanGiai').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#doRongManHinh').val()==''){
  							$('#doRongManHinh').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-doRongManHinh').html('Bạn không được bỏ trống trường này!');
  							$('#icon-doRongManHinh').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if($('#camUng').val()==''){
  							$('#camUng').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-camUng').html('Bạn không được bỏ trống trường này!');
  							$('#icon-camUng').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if($('#cameraTruoc').val()==''){
  							$('#cameraTruoc').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-cameraTruoc').html('Bạn không được bỏ trống trường này!');
  							$('#icon-cameraTruoc').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#CameraSau').val()==''){
  							$('#CameraSau').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-CameraSau').html('Bạn không được bỏ trống trường này!');
  							$('#icon-CameraSau').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#denFlash').val()==''){
  							$('#denFlash').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-denFlash').html('Bạn không được bỏ trống trường này!');
  							$('#icon-denFlash').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if($('#heDieuHanh').val()==''){
  							$('#heDieuHanh').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-heDieuHanh').html('Bạn không được bỏ trống trường này!');
  							$('#icon-heDieuHanh').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#CPU').val()==''){
  							$('#CPU').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-CPU').html('Bạn không được bỏ trống trường này!');
  							$('#icon-CPU').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#Ram').val()==''){
  							$('#Ram').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-Ram').html('Bạn không được bỏ trống trường này!');
  							$('#icon-Ram').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if($('#boNhoTrong').val()==''){
  							$('#boNhoTrong').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-boNhoTrong').html('Bạn không được bỏ trống trường này!');
  							$('#icon-boNhoTrong').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if($('#theNho').val()==''){
  							$('#theNho').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-theNho').html('Bạn không được bỏ trống trường này!');
  							$('#icon-theNho').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if($('#ketNoiMang').val()==''){
  							$('#ketNoiMang').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-ketNoiMang').html('Bạn không được bỏ trống trường này!');
  							$('#icon-ketNoiMang').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if($('#theSim').val()==''){
  							$('#theSim').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-theSim').html('Bạn không được bỏ trống trường này!');
  							$('#icon-theSim').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if($('#Wifi').val()==''){
  							$('#Wifi').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-Wifi').html('Bạn không được bỏ trống trường này!');
  							$('#icon-Wifi').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if($('#GPS').val()==''){
  							$('#GPS').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-GPS').html('Bạn không được bỏ trống trường này!');
  							$('#icon-GPS').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if($('#ChatLieuSanPham').val()==''){
  							$('#ChatLieuSanPham').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-ChatLieuSanPham').html('Bạn không được bỏ trống trường này!');
  							$('#icon-ChatLieuSanPham').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if($('#kichThuoc').val()==''){
  							$('#kichThuoc').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-kichThuoc').html('Bạn không được bỏ trống trường này!');
  							$('#icon-kichThuoc').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if($('#trongLuong').val()==''){
  							$('#trongLuong').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-trongLuong').html('Bạn không được bỏ trống trường này!');
  							$('#icon-trongLuong').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if($('#dungLuongPin').val()==''){
  							$('#dungLuongPin').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-dungLuongPin').html('Bạn không được bỏ trống trường này!');
  							$('#icon-dungLuongPin').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if($('#loaiPin').val()==''){
  							$('#loaiPin').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-loaiPin').html('Bạn không được bỏ trống trường này!');
  							$('#icon-loaiPin').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						
  						return true;	
  					 },
  			 'keyup':function(){
  						if($('#productName').val().length>0){
  							$('#productName').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-productName').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-productName').html(' ');
  						}
  						if($('#giaSanPham').val().length>0){
  							$('#giaSanPham').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-giaSanPham').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-giaSanPham').html(' ');
  						}
  						if($('#congNgheManHinh').val().length>0){
  							$('#congNgheManHinh').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-congNgheManHinh').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-congNgheManHinh').html(' ');
  						}
  						if($('#doPhanGiai').val().length>0){
  							$('#doPhanGiai').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-doPhanGiai').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-doPhanGiai').html(' ');
  						}
                       if($('#doRongManHinh').val().length>0){
  							$('#doRongManHinh').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-doRongManHinh').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-doRongManHinh').html(' ');
  						}
                        if($('#camUng').val().length>0){
  							$('#camUng').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-camUng').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-camUng').html(' ');
  						}
                        if($('#cameraTruoc').val().length>0){
  							$('#cameraTruoc').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-cameraTruoc').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-cameraTruoc').html(' ');
  						}
  						if($('#CameraSau').val().length>0){
  							$('#CameraSau').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-CameraSau').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-CameraSau').html(' ');
  						}
  						if($('#denFlash').val().length>0){
  							$('#denFlash').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-denFlash').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-denFlash').html(' ');
  						}
  						if($('#heDieuHanh').val().length>0){
  							$('#heDieuHanh').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-heDieuHanh').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-heDieuHanh').html(' ');
  						}
  						if($('#CPU').val().length>0){
  							$('#CPU').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-CPU').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-CPU').html(' ');
  						}
                       if($('#Ram').val().length>0){
  							$('#Ram').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-Ram').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-Ram').html(' ');
  						}
                        if($('#boNhoTrong').val().length>0){
  							$('#boNhoTrong').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-boNhoTrong').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-boNhoTrong').html(' ');
  						}
                        if($('#theNho').val().length>0){
  							$('#theNho').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-theNho').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-theNho').html(' ');
  						}
                        if($('#ketNoiMang').val().length>0){
  							$('#ketNoiMang').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-ketNoiMang').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-ketNoiMang').html(' ');
  						}
                        if($('#theSim').val().length>0){
  							$('#theSim').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-theSim').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-theSim').html(' ');
  						}
                        if($('#Wifi').val().length>0){
  							$('#Wifi').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-Wifi').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-Wifi').html(' ');
  						}
                        if($('#GPS').val().length>0){
  							$('#GPS').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-GPS').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-GPS').html(' ');
  						}
                        if($('#ChatLieuSanPham').val().length>0){
  							$('#ChatLieuSanPham').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-ChatLieuSanPham').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-ChatLieuSanPham').html(' ');
  						}
                  if($('#kichThuoc').val().length>0){
  							$('#kichThuoc').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-kichThuoc').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-kichThuoc').html(' ');
  						}
                  if($('#trongLuong').val().length>0){
  							$('#trongLuong').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-trongLuong').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-trongLuong').html(' ');
  						}
                  if($('#dungLuongPin').val().length>0){
  							$('#dungLuongPin').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-dungLuongPin').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-dungLuongPin').html(' ');
  						}
                  if($('#loaiPin').val().length>0){
  							$('#loaiPin').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-loaiPin').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-loaiPin').html(' ');
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
                    <h2>Thiết kế của sản phẩm <small> bao gồm trọng lượng</small></h2>
                      <a href="SanPham.jsp" style="float:right">  <button class="btn btn-sm btn-primary" type="button"><i class="fa fa-undo" aria-hidden="true"></i>  Trở về</button></a>
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
                    
                    <%String maSP = request.getParameter("ID");
                	SanPham sp = null;
		    		for(SanPham sanpham:mapProduct.values()){
		    			if(sanpham.getMaSanPham().equals(maSP)){
		    				sp=sanpham;
		    			}
		    		}
                    		if(sp!=null){
                    %>
                    <form id="editProduct" data-parsley-validate class="form-horizontal form-label-left" action="../../Product?action=Edit&id=<%=sp.getMaSanPham() %>" method="post">
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Tên sản phẩm<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                <input type="text" id="productName" name="ten" class="form-control col-md-7 col-xs-12" value="<%=sp.getTenSanPham()%>">
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Giá sản phẩm<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                  <input id="giaSanPham" class=" form-control col-md-7 col-xs-12" name="gia" value="<%=sp.getGiaSanPham()%>" type="number">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-giaSanPham"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-giaSanPham"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Công nghệ màn hình<span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <input id="congNgheManHinh" class=" form-control col-md-7 col-xs-12" name="congnghemanhinh" value="<%=sp.getCongNgheManHinh()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-congNgheManHinh"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-congNgheManHinh"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Độ phân giải<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                <input id="doPhanGiai" class=" form-control col-md-7 col-xs-12" name="dophangiai" value="<%=sp.getDoPhanGiai()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-doPhanGiai"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-doPhanGiai"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Độ rộng màn hình<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                <input id="doRongManHinh" class=" form-control col-md-7 col-xs-12" name="dorongmanhinh" value="<%=sp.getManHinhRong()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-doRongManHinh"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-doRongManHinh"></p>	
							</div>
                        </div>
                      </div>
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Cảm ứng<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                  <input id="camUng" class=" form-control col-md-7 col-xs-12" name="camUng" value="<%=sp.getMatKinhCamUng()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-camUng"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-camUng"></p>	
							</div>
                        </div>
                      </div>
                        <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Camera Trước<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                  <input type="text" id="cameraTruoc" name="cmrt" class="form-control col-md-7 col-xs-12" value="<%=sp.getCameraTruoc()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-cameraTruoc"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-cameraTruoc"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Camera Sau</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                   <input id="CameraSau" class="form-control col-md-7 col-xs-12" type="text" name="cmrs" value="<%=sp.getCameraSau()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-CameraSau"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-CameraSau"></p>	
							</div>
                        </div>
                      </div>
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Đèn flash<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                   <input id="denFlash" class=" form-control col-md-7 col-xs-12" name="den" value="<%=sp.getDenFlash()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-denFlash"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-denFlash"></p>	
							</div>
                        </div>
                      </div>
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hệ điều hành<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                    <input id="heDieuHanh" class=" form-control col-md-7 col-xs-12" name="hedieuhanh" value="<%=sp.getHeDieuHanh()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-heDieuHanh"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-heDieuHanh"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">CPU<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                   <input id="CPU" class=" form-control col-md-7 col-xs-12" name="cpu" value="<%=sp.getTocDoCPU()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-CPU"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-CPU"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Ram của điện thoại<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                   <input type="text" id="Ram" name="ram" class="form-control col-md-7 col-xs-12" value="<%=sp.getRam()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-Ram"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-Ram"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Bộ nhớ trong<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                   <input id="boNhoTrong" class=" form-control col-md-7 col-xs-12" name="boNhoTrong" value="<%=sp.getBoNhoTrong()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-boNhoTrong"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-boNhoTrong"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hỗ trợ thẻ nhớ<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                    <input id="theNho" class=" form-control col-md-7 col-xs-12" name="theNho" value="<%=sp.getBoNhoTrong()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-theNho"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-theNho"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Kết nối mạng<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                   <input id="ketNoiMang" class=" form-control col-md-7 col-xs-12" name="ketnoimang" value="<%=sp.getMang()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-ketNoiMang"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-ketNoiMang"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Loại thẻ sim<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                   <input id="theSim" class=" form-control col-md-7 col-xs-12" name="theSim" value="<%=sp.getSim()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-theSim"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-theSim"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Wifi<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                  <input id="Wifi" class=" form-control col-md-7 col-xs-12" name="wifi" value="<%=sp.getWifi()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-Wifi"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-Wifi"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">GPS<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                   <input id="GPS" class=" form-control col-md-7 col-xs-12" name="gps" value="<%=sp.getGps()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-GPS"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-GPS"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Chất liệu sản phẩm<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                   <input id="ChatLieuSanPham" class=" form-control col-md-7 col-xs-12" name="chatlieu" value="<%=sp.getChatLieu()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-ChatLieuSanPham"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-ChatLieuSanPham"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Kích thước<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                    <input id="kichThuoc" class=" form-control col-md-7 col-xs-12" name="kichThuoc" value="<%=sp.getKichThuoc()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-kichThuoc"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-kichThuoc"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Trọng lượng<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                   <input id="trongLuong" class=" form-control col-md-7 col-xs-12" name="trongluong" value="<%=sp.getTrongLuong()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-trongLuong"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-trongLuong"></p>	
							</div>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Dung lượng pin<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                   <input id="dungLuongPin" class=" form-control col-md-7 col-xs-12" name="pin" value="<%=sp.getDungLuongPin()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-dungLuongPin"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-dungLuongPin"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Loại pin<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                   <input id="loaiPin" class=" form-control col-md-7 col-xs-12" name="loaibin" value="<%=sp.getLoaiPin()%>" type="text">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-loaiPin"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-loaiPin"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hình ảnh<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                              <div class="centered">
					                <h2 style="text-align:center;">Kéo thả hoặc chọn file hình ảnh mà bạn cần tải lên vào ô dưới...</h2> 
					                <center><input type="file" name="datafile" /></center>
					                <br/>
					                <div id="upload" style="display:none;">Đang tải lên..</div>
					                <div id="uploadComplete" style="display:none;color: red">Tải lên thành công</div>
					            </div>
							</div>
                        </div>
                      </div>
                     
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-4 col-sm-4 col-xs-12 col-md-offset-4">
                          <button type="submit" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-edit"></span>  Sửa sản phẩm</button>
                        </div>
                      </div>

                    </form>
                    <%} %>
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
    