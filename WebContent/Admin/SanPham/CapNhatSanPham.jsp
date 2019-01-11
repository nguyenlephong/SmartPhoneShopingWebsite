  <%		ServletContext contextDangNhap=getServletContext();
					contextDangNhap.setAttribute("urlweb","Admin/SanPham/CapNhatSanPham.jsp");
				  if(	session.getAttribute("user")==null){
					response.sendRedirect("../index.jsp");
				  }%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.ResultSet"%>
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

    <title>Cập nhật sản phẩm </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">

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

              <div class="col-md-12 col-sm-6 col-xs-6">
                <div class="x_panel">
                  <div class="x_title">
                   <h4>Cập nhật  sản phẩm</h4>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">


                    <!-- Smart Wizard -->
                    <p>Để cập nhật sản phẩm bạn vui lòng hoàn thành các bước dưới đây</p>
                    <div id="wizard" class="form_wizard wizard_horizontal">
                      <ul class="wizard_steps">
                        <li>
                          <a href="#step-1">
                            <span class="step_no">1</span>
                            <span class="step_descr">
                                              Bước 1<br />
                                              <small>Thiết kế của sản phẩm bao gồm trọng lượng</small>
                                          </span>
                          </a>
                        </li>
                        <li>
                          <a href="#step-2">
                            <span class="step_no">2</span>
                            <span class="step_descr">
                                              Bước 2<br />
                                                <small>Màn hình và dung lượng pin</small>
                                          </span>
                          </a>
                        </li>
                        <li>
                          <a href="#step-3">
                            <span class="step_no">3</span>
                            <span class="step_descr">
                                              Bước 3<br />
                                               <small> Bộ nhớ lưu trữ</small>
                                          </span>
                          </a>
                        </li>
                        <li>
                          <a href="#step-4">
                            <span class="step_no">4</span>
                            <span class="step_descr">
                                              Bước 4<br />
                                              <small>Hình ảnh</small>
                                          </span>
                          </a>
                        </li>
                      </ul>
                      <div id="step-1">
                        <div class="x_content">
                    <br />
                    <form id="demo-form2" action="../CapNhatThietKe" method="post" data-parsley-validate class="form-horizontal form-label-left">
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">Mã sản phẩm<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="" name="maSP" class="form-control col-md-7 col-xs-12" name="maSP">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Thiết kế<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" required="required" class="form-control col-md-7 col-xs-12" name="thietke">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Chất liệu <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="last-name" name="chatlieu"  required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Kích thước</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="middle-name" class="form-control col-md-7 col-xs-12" type="text" name="kichthuoc">
                        </div>
                      </div>
                  
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Trọng lượng<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="birthday" class="date-picker form-control col-md-7 col-xs-12" name="trongluong" type="text">
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-4 col-sm-4 col-xs-12 col-md-offset-4">
                          <button class="btn btn-primary" type="button">Hủy</button>
                          <button type="submit" class="btn btn-success">Xong</button>
                        </div>
                      </div>

                    </form>
                  </div>

                      </div>
                      <div id="step-2">
                         <div class="x_content">
                  		  <br />
                    <form class="form-horizontal form-label-left input_mask" action="../CNManHinh" method="post">

                      <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        <input type="text" class="form-control has-feedback-left" id="inputSuccess2" placeholder="Mã sản phẩm"
                        name="maSP" value=""
                        >
                        <span class="" aria-hidden="true"></span>
                      </div>

                      <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        <input type="text" class="form-control" id="inputSuccess3"  name="cnmh" placeholder="Công nghệ màn hình">
                        <span class="" aria-hidden="true"></span >
                      </div>

                      <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        <input type="text" class="form-control has-feedback-left" id="inputSuccess4" name="dpg" placeholder="Độ phân giải">
                        <span class="" aria-hidden="true"></span>
                      </div>

                      <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        <input type="text" class="form-control" id="inputSuccess5" name="dorong" placeholder="Màn hình rộng">
                        <span class="" aria-hidden="true"></span>
                      </div>

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Cảm ứng</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" name="camung" placeholder="Cảm ứng">
                        </div>
                      </div>
                   
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Màn hình</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" name="manhinh"  placeholder="Màn hình cảm ứng">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Dung lượng</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" name="dungluong"  placeholder="Dung lượng pin">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Loại pin</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" name="loaipin"  placeholder="Loại pin">
                        </div>
                      </div>
                  
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                          <button  type="submit" class="btn btn-success">Xong</button>
                        </div>
                      </div>
                    </form>
                  </div>
                      </div>
                      <div id="step-3">
                           <div class="x_content">

                    <!-- start form for validation -->
                    <form id="demo-form" action="../CNTheNho" method="post">

                      <label>Hỗ trợ thẻ nhớ ngoài *:</label>
                      <p>
                        Có:
                        <input type="radio" class="flat" name="cothenho" id="genderM" value="yes" checked="" required /> Không:
                        <input type="radio" class="flat" name="cothenho" id="genderF" value="no" />
                      </p>

                      <label>Bộ nhớ RAM:</label>
                      <p style="padding: 5px;">
                        <input type="radio" name="ram" id="hobby1" value="1" data-parsley-mincheck="2" required class="flat" /> 1 GB
                        <input type="radio" name="ram" id="hobby2" value="2" class="flat" /> 2 GB
                        <input type="radio" name="ram" id="hobby3" value="3" class="flat" /> 3 GB
                        <input type="radio" name="ram" id="hobby4" value="4" class="flat" /> 4 GB
                        <input type="radio" name="ram" id="hobby4" value="6" class="flat" /> 6 GB
                        <input type="radio" name="ram" id="hobby4" value="8" class="flat" /> 8 GB
                        <p>

                          <label for="heard">Thẻ nhớ ngoài*:</label>
                          <select id="heard" class="form-control" name="rom" required>
                            <option value="khong">Không</option>
                            <option value="co">Có</option>
                            <option value="microSD">MicroSD</option>
                            <option value="orther">Khác</option>
                          </select>

                          <label for="message">Bộ nhớ còn lại :</label>
                          <input id="message" required="required" class="form-control" name="bncl" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                            data-parsley-validation-threshold="10">
                          <label for="message">Hỗ trợ thẻ tối đa :</label>
                          <input id="message" required="required" class="form-control" name="bntd" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                            data-parsley-validation-threshold="10">

                          <br/>
                          <button class="btn btn-primary" type="submit">Xong</button>

                    </form>
                    <!-- end form for validations -->

                  </div>
                      </div>
                      <div id="step-4">
                          <div class="x_content">
                     <p>Bạn hãy kéo ( hay dùng các phím điều hành dưới đây) một hoặc nhiều file ảnh cho sản phẩm vào ô dưới đây,và nhấn cập nhật để cập nhật sản phẩm.</p>
                 <!--    <form action="XuLyCapNhatHinhAnh" class="dropzone"></form> -->
                    
                    <center>
        				<form method="post" action="../XuLyCapNhatSP" enctype="multipart/form-data">
           					 Chọn file để tải lên:
           						 <input type="file" name="uploadFile" />
          					  <br/>
        					    <input type="submit" class="btn btn-success" value="Upload" />
       					 </form>
   					 </center>
                   
                    <br />
                    <br />
                    <br />
                    <br />
                  </div>
                      </div>

                    </div>
                    <!-- End SmartWizard Content -->





                  
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
    <!-- jQuery Smart Wizard -->
    <script src="../vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>

	
  </body>
</html>