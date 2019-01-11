<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
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

  <title>Trả Lời Hỏi Đáp  </title>
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
  <link rel="stylesheet" href="../css/common.css">
  <link rel="stylesheet" href="../css/03.css">
  <link rel="stylesheet" href="../css/traloihd.css">


  
  <!-- Custom Theme Style -->
  <link href="../build/css/custom.min.css" rel="stylesheet">
<!--   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript"> 
  </script> -->
</head>
<body class="nav-md">
  <div class="container body">
    <div class="main_container">
        <jsp:include page="../Menu/Menu.jsp"></jsp:include>
 
      <!-- /top navigation -->

      <!-- page content -->
      <%CauHoi hd = (CauHoi) session.getAttribute(BienHang.VALUEHOIDAP); %>
      <div class="right_col" role="main">
       <div class="row">
         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
           <div class="x_panel">
             <div class="x_title">
               <h2>Câu Hỏi <small>Thứ <%= hd.getStt()%></small></h2>
               <ul class="nav navbar-right panel_toolbox">
                 <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                 </li>
               </ul>
               <div class="clearfix"></div>
             </div> 
             <!-- end x_title -->
             <div class="x_content">

               <div class="bs-example" data-example-id="simple-jumbotron">
                 <div class="jumbotron">
                   <h1><%= hd.getTenCauHoi() %></h1>
                   <p> <%= hd.getNoiDung() %> </p>
                 </div> <!-- end jumbotron -->
               </div> <!-- end bs-example -->

             </div> <!-- end x_content -->
           </div> <!-- end xpanel -->
         </div> <!-- end col -->
       </div> <!-- end row -->

       <!-- end noidung cau hoi -->
       <div class="">
        <div class="page-title">
          <div class="title_left">
            <h3>Trả Lời Câu Hỏi</h3>
          </div> <!-- end title_left -->

          </div> <!-- end page-title -->
        </div> <!-- end "" -->
        <div class="clearfix"></div>

        <div class="row">

          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
              <div class="x_title">
                <h2>Trả Lời Câu Hỏi <small><%= hd.getStt() %></small></h2>
                <ul class="nav navbar-right panel_toolbox">
                  <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                  </li>
                </ul>
                <div class="clearfix"></div>
              </div> <!-- end x_title -->
              <div class="x_content">
            <form action="" method="post">

                <!-- Smart Wizard -->
                <div id="wizard" class="form_wizard wizard_horizontal">
                  <ul class="wizard_steps">
                    <li>
                      <a href="#step-1">
                        <span class="step_no">1</span>
                        <span class="step_descr">
                          Bước 1<br />
                          <small>Cách Làm</small>
                        </span>
                      </a>
                    </li>
                    <li>
                      <a href="#step-2">
                        <span class="step_no">2</span>
                        <span class="step_descr">
                          Bước 2<br />
                          <small>
                          Hình Anh Minh Hoa
                           
                          </small>
                        </span>
                      </a>
                    </li>
                    <li>
                      <a href="#step-3">
                        <span class="step_no">3</span>
                        <span class="step_descr">
                          Bước 3<br />
                          <small> Nội Dung Trả Lời </small>
                        </span>
                      </a>
                    </li>
                  </ul>
                  <!-- end tiêu đề -->
                  <% 
                  int i =0;
                  String[] buocLam= (String[]) session.getAttribute(BienHang.BUOC1);
                  
                  if(buocLam == null){
                	  buocLam = new String[11];
                  }
                  else{
                	  System.out.println(buocLam);
                  }
                  %>
                  <%! public String kiemTra(String data){
                  		return data == null ?"": data;
                  }
                	  %>
                  
               <%--    <div id="step-1">
            <form class="form-horizontal form-label-left"   action="../../XuLyHoiDap" method ="get">
                    <input type="hidden" name = "action" value = "traloi"></input>
                      <h2 class="StepTitle">Các Bước Trả Lời</h2>
                      <div class="row ">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 1<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[i++]) %>"  required="required" class="form-control col-md-7 col-xs-12">
                        </div> 
                      </div>  
                      </div> <!-- end row -->
                       <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 2<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %>  value ="<%= kiemTra(buocLam[i++]) %>"   required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                      
                       <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 3<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %>  value ="<%= kiemTra(buocLam[i++]) %>"  required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                      <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 4<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[i++]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                       <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 5<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[i++]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                       <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 6<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[i++]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                      <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 7<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[i++]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                       <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 8<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[i++]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                      <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 9<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[i++]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                     <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 10<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[i++]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      <% String noidung=(String) session.getAttribute(BienHang.BUOC3);%>
                      </div> <!-- end row -->
                  <div class="form-group">
  						<label for="comment">Nội Dung Bổ Sung</label>
  					<textarea class="form-control" rows="5" name =<%=BienHang.NOIDUNGHOIDAPTL %>  required="required"  placeholder ="<%= kiemTra(noidung) %>" id="comment"></textarea>
  					</div> 
  					
                      <div class="form-group">
	                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
	                          <a href="TraLoiHoiDap.jsp"><button class="btn btn-primary" type="button">Hủy</button></a>
	                           <input type="submit" class="btn btn-success" name = "action" value = "Lưu" >
	                        </div>
                    </div> <!-- end step 1 -->
</div> 
                  </form> 
                  
                   --%>
               <div id="step-1">
                    <form class="form-horizontal form-label-left" id="form" action="../../XuLyHoiDap" method ="get">
                     <input type="hidden" name = "action" value = "traloi"></input>
                      <h2 class="StepTitle">Các Bước Trả Lời</h2>
                      <div class="row ">
                          <div class="form-group">

                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 1<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[i++]) %>"  required="required" class="form-control col-md-7 col-xs-12">
                        </div> 
                      </div>  
                      </div> <!-- end row -->
                       <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 2<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %>  value ="<%= kiemTra(buocLam[i++]) %>"   required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                      
                       <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 3<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %>  value ="<%= kiemTra(buocLam[i++]) %>"  required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                      <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 4<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[i++]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                       <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 5<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[i++]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                       <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 6<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[i++]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                      <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 7<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[i++]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                       <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 8<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[i++]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                      <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 9<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[i++]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                     <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 10<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[i]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      <% String noidung=(String) session.getAttribute(BienHang.BUOC3);%>
                      </div> <!-- end row -->
                  <div class="form-group">
  						<label for="comment">Nội Dung Bổ Sung</label>
  					<textarea class="form-control" rows="5" name =<%=BienHang.NOIDUNGHOIDAPTL %> value ="<%=  kiemTra(noidung) %>"  placeholder ="<%= kiemTra(noidung) %>" id="comment"></textarea>
  					</div> 
  					
                      <div class="form-group">
	                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
	                          <a href="#"><button class="btn btn-primary" type="button">Hủy</button></a>
	                          <input type="submit"  class="btn btn-success" name = "action" value = "Trả Lời"></input>
	                    <!--       <button type="submit" class="btn btn-success">Lưu </button> -->
	                        </div>
                    </div> <!-- end step 1 -->
</div> 
                  </form>
        <!-- end step 1 -->   
                  
                  
                  
        <!-- end step 1 -->
                  <div id="step-2">
                  
                  <% 
  								 i =0;int j=0;
                  String[] hinhAnh =(String[]) session.getAttribute(BienHang.BUOC2);
  							  if(hinhAnh == null){
  			                	  hinhAnh = new String[10];
                  }
  								%>
                    <h2 class="StepTitle">Hình Anh</h2>
                   <form  class="form-horizontal form-label-left" action="../../XuLyHinhAnh" method ="post">
                        <input type="hidden" name = "action" value = "traloi"></input>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Hinh 1<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="file" id="first-name" required="required" name =<%=BienHang.HINHANHHOIDAPTL %>  value ="<%= kiemTra(hinhAnh[i++]) %>" class="form-control col-md-7 col-xs-12">
                        </div><span><%= kiemTra(hinhAnh[j++]) %></span>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Hinh 2<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="file" id="last-name"  required="required" name =<%=BienHang.HINHANHHOIDAPTL %> value ="<%= kiemTra(hinhAnh[i++]) %>"  class="form-control col-md-7 col-xs-12">
                        </div> <span><%= kiemTra(hinhAnh[j++]) %></span>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Hinh 3<span class="required">*</span><span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="middle-name" class="form-control col-md-7 col-xs-12" required="required" type="file" name =<%=BienHang.HINHANHHOIDAPTL %>    >
                        </div> <span><%= kiemTra(hinhAnh[j++]) %></span>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hinh 4<span class="required">*</span><span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="middle-name" class="form-control col-md-7 col-xs-12" required="required"  type="file" name ="<%=BienHang.HINHANHHOIDAPTL %>"   >
                        </div> <span><%= kiemTra(hinhAnh[j++]) %></span>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hinh 5<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="middle-name" class="form-control col-md-7 col-xs-12" required="required" type="file" name =<%=BienHang.HINHANHHOIDAPTL %>  >
                        </div> <span><%= kiemTra(hinhAnh[j++]) %></span>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hinh 6<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="middle-name" class="form-control col-md-7 col-xs-12" required="required" type="file" name =<%=BienHang.HINHANHHOIDAPTL %>   >
                        </div> <span><%= kiemTra(hinhAnh[j++]) %></span>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hinh 7<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="middle-name" class="form-control col-md-7 col-xs-12" required="required" type="file" name =<%=BienHang.HINHANHHOIDAPTL %>  >
                        </div> <span><%= kiemTra(hinhAnh[j++]) %></span>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hinh 8<span class="required">*</span>
                        </label> <span><%= kiemTra(hinhAnh[j++]) %></span>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="middle-name" class="form-control col-md-7 col-xs-12" required="required" type="file" name =<%=BienHang.HINHANHHOIDAPTL %>  >
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hinh 9<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="middle-name" class="form-control col-md-7 col-xs-12" required="required" type="file" name =<%=BienHang.HINHANHHOIDAPTL %>  >
                        </div> <span><%= kiemTra(hinhAnh[j++]) %></span>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hinh 10<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="middle-name" class="form-control col-md-7 col-xs-12" required="required" type="file" name =<%=BienHang.HINHANHHOIDAPTL %>>
                        </div>  <span><%= kiemTra(hinhAnh[j	]) %></span> <!-- end input -->
                      </div> <!-- end group -->
	                      
                      <div class="form-group">
	                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
	                          <a href="#"><button class="btn btn-primary" type="button">Hủy</button></a>
	                          <button type="submit" class="btn btn-success" name = "action" value = "traloi" >Lưu</button>
	                        </div>
                      </div>
                 
                    </div> <!-- end step 3 -->
                     <div id="step-3">
                     
                    <% String thongbao = (String) session.getAttribute(BienHang.THONGBAO);
                        		int maHD = hd.getStt()+1;
                        		if(thongbao == null ){
                        			thongbao ="Chưa Thành Công";
                        		}
                        		else{
                        			session.removeAttribute(BienHang.BUOC1);
                        			session.removeAttribute(BienHang.BUOC2);
                        			session.removeAttribute(BienHang.BUOC3);
                        			session.removeAttribute(BienHang.THONGBAO);
                        		}
                        		%>
                    <h2 class="StepTitle"><%= thongbao %></h2>
                        		<div class="form-group">
	                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
	                       <a href="../../XuLyHoiDap?action=sua&maHD=<%=maHD%>"><button class="btn btn-primary" type="button">Câu Hỏi Tiếp Theo</button></a>
	                          <a href="../HoiDapAdmin.jsp"><button type="submit" class="btn btn-danger">Quay Lại Trang Chính</button> </a>
	                        </div>
                 
                  </div>
<!--                   end step 4 -->
                  </form>
                  <!-- end step 2 -->
                  
                  
                  
</form>

<!--                   end step 3 -->

<!--                   end step 4 -->
                </div> <!-- end x_content -->
                <!-- End SmartWizard Content -->

              </div> <!-- end x_panel -->
      </div> <!-- end collum -->
    </div> <!-- end row -->





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

<!-- jQuery
  <script src="vendors/jquery/dist/jquery.min.js"></script> 


  <!-- FastClick -->

  <!-- NProgress -->
  <!-- bootstrap-progressbar -->
  
  <script src="../vendors/jquery/dist/jquery.min.js"></script>
  <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
  iCheck
  <script src="../vendors/iCheck/icheck.min.js"></script>
  bootstrap-daterangepicker
  <script src="../vendors/moment/min/moment.min.js"></script>
  Switchery
  <script src="../vendors/switchery/dist/switchery.min.js"></script>
  Select2
  <script src="../vendors/select2/dist/js/select2.full.min.js"></script>
  Parsley
  <script src="../vendors/parsleyjs/dist/parsley.min.js"></script>
  jQuery autocomplete
  <script src="../vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
  starrr
  <script src="../vendors/starrr/dist/starrr.js"></script>
  Custom Theme Scripts
  <script src="../vendors/jquery/dist/jquery.min.js"></script> 
  
  Bootstrap
  <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
  jQuery Smart Wizard
  <script src="../vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
  Custom Theme Scripts
<script src="../build/js/custom.min.js"></script>  
  



  <!-- <script src="vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
  iCheck
  <script src="vendors/iCheck/icheck.min.js"></script>
  bootstrap-daterangepicker
  <script src="vendors/moment/min/moment.min.js"></script>
  <script src="vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
  bootstrap-wysiwyg
  <script src="vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
  <script src="vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
  <script src="vendors/google-code-prettify/src/prettify.js"></script>
  jQuery Tags Input

  <script src="vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
  Switchery
  <script src="vendors/switchery/dist/switchery.min.js"></script>
  Select2
  <script src="vendors/select2/dist/js/select2.full.min.js"></script>
  Parsley
  <script src="vendors/parsleyjs/dist/parsley.min.js"></script>
  Autosize
  <script src="vendors/autosize/dist/autosize.min.js"></script>
  jQuery autocomplete
  <script src="vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
  starrr
  <script src="vendors/starrr/dist/starrr.js"></script>
  Custom Theme Scripts
  <script src="vendors/jquery/dist/jquery.min.js"></script> -->


  
  <!-- Bootstrap -->
<!--   <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
  FastClick
  <script src="vendors/fastclick/lib/fastclick.js"></script>
  NProgres 
  <script src="vendors/nprogress/nprogress.js"></script>
  jQuery Smart Wizard
  <script src="vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
  Custom Theme Scripts
  <script src="build/js/custom.min.js"></script> -->





<!-- NProgress -->
  <!-- bootstrap-progressbar -->
 <!--  <script src="vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
  iCheck
  <script src="vendors/iCheck/icheck.min.js"></script>
  bootstrap-daterangepicker
  <script src="vendors/moment/min/moment.min.js"></script>
  <script src="vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
  bootstrap-wysiwyg
  <script src="vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
  <script src="vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
  <script src="vendors/google-code-prettify/src/prettify.js"></script>
  jQuery Tags Input
  <script src="vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
  Switchery
  <script src="vendors/switchery/dist/switchery.min.js"></script>
  Select2
  <script src="vendors/select2/dist/js/select2.full.min.js"></script>
  Parsley
  <script src="vendors/parsleyjs/dist/parsley.min.js"></script>
  Autosize
  <script src="vendors/autosize/dist/autosize.min.js"></script>
  jQuery autocomplete
  <script src="vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
  starrr
  <script src="vendors/starrr/dist/starrr.js"></script>
  Custom Theme Scripts
  <script src="vendors/jquery/dist/jquery.min.js"></script>
  
  Bootstrap
  <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
  FastClick
  <script src="vendors/fastclick/lib/fastclick.js"></script>
  NProgres 
  <script src="vendors/nprogress/nprogress.js"></script>
  jQuery Smart Wizard
  <script src="vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
  Custom Theme Scripts
  <script src="build/js/custom.min.js"></script> -->

</body>
</html>
