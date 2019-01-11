<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@page import="java.util.Map"%>
<%		ServletContext contextDangNhap=getServletContext();
					contextDangNhap.setAttribute("urlweb","Admin/BinhLuan/SuaBinhLuan.jsp");
				  if(	session.getAttribute("user")==null){
					response.sendRedirect("../index.jsp");
				  }%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  
    <title>Sửa bình luận </title>
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
  		$('#editcomment').bind({
  			'submit':function(){
  						if($('#name').val()==''){
  							$('#name').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-name').html('Bạn không được bỏ trống trường này!');
  							$('#icon-name').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#birthday').val()==''){
  							$('#birthday').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-birthday').html('Bạn không được bỏ trống trường này!');
  							$('#icon-birthday').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#noidung').val()==''){
  							$('#noidung').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-noidung').html('Bạn không được bỏ trống trường này!');
  							$('#icon-noidung').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						
  						return true;	
  					 },
  			 'keyup':function(){
  						if($('#name').val().length>0){
  							$('#name').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-name').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-name').html(' ');
  						}
  						if($('#birthday').val().length>0){
  							$('#birthday').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-birthday').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-birthday').html(' ');
  						}
  						if($('#noidung').val().length>0){
  							$('#noidung').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-noidung').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-noidung').html(' ');
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
                    <h2> <small>Trong một số trường hợp bình luận khách hàng không phù hợp mình cần phải sửa đổi lại cho phù hợp ,hoặc có thể bỏ qua</small></h2>
                   	 <a href="BinhLuan.jsp" style="float:right"><button class="btn btn-primary" type="button"><i class="fa fa-undo" aria-hidden="true"></i>  Trở về</button></a>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <%Map<String,BinhLuan> mapComment = BinhLuanDAO.mapComment;
                    	BinhLuan b = null;
                    	String id = request.getParameter("id");
                    	for(BinhLuan bl : mapComment.values()){
                    		if(bl.getStt().equals(id)){
                    			b=bl;
                    		}
                    	}
                    	if(b!=null){
                    %>
                    <form  id="editcomment" data-parsley-validate class="form-horizontal form-label-left"  action="../../BinhLuan?action=Edit&id=<%=b.getStt() %>" method="post">
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Tên khách hàng <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                       	    <div class="row">
					       <div class="col-sm-8">
						     <input type="text" name="name" id="name" class="form-control col-md-7 col-xs-12" value=" <%out.print(b.getTen());%>">
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Ngày gởi bình luận <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="row">
					       <div class="col-sm-8">
						     <input id="birthday" class="date-picker form-control col-md-7 col-xs-12" type="date" name="date" value="<%out.print(b.getNgay());%>">
					       </div>
					       <div class="col-sm-2">
							<p id="icon-birthday"></p>
					       </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-birthday"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">Nội dung <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
					       <div class="col-sm-8">
						     <input type="text" id="noidung" name="content" class="form-control col-md-7 col-xs-12" value="<%out.print(b.getNoiDung());%>">
					       </div>
					       <div class="col-sm-2">
							<p id="icon-noidung"></p>
					       </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-noidung"></p>	
							</div>
                        </div>
                      </div>
                   
  
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-edit"></span>  Sửa</button>
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
