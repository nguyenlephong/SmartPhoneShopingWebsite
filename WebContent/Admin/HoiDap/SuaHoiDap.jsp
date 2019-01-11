<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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

  <title>Sửa Hỏi Đáp </title>


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
  <link rel="stylesheet" href="../css/03.css">
  <link rel="stylesheet" href="../css/common.css">
  <link rel="stylesheet" href="../css/traloihd.css">

  <!-- Custom Theme Style -->
  <link href="build/css/custom.min.css" rel="stylesheet">
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript"> 
  </script>
 <!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js
" ></script>  -->
<%HoiDapDAO dao = HoiDapDAO.getInstance(); %>
<!--  <script src="js/jquery.ajaxfileupload.js"></script> 
<script type="text/javascript"> -->
<!-- /* setInterval(function(){ // đây là cơ chế nhận request
	
	$.get('XuLyHoiDap',{
		
	},function(response) {
	         
	       });
	}, 1000); // 1s goi servlet 1 lan */

$(document).ready(function() {
$('select#cauhoi').on('change',function(){
	var value = $('#cauhoi').val();
	if(value == null){
		return;
	}
	data={
			"action": "sua",
			"maHD":value
	};
	$.get('../XuLyHoiDap',data,function(data){

	});
});
	
	
}); -->

</script>
</head>

<body class="nav-md">
  <div class="container body">
    <div class="main_container">
           <jsp:include page="../Menu/Menu.jsp"></jsp:include>
      <!-- /top navigation -->
 <%-- <%

MyConnectDB mycon = new MyConnectDB();
ResultSet samsung = mycon.chonDuLieu("select * from HoiDap where MaSP like 'SS%';");
ResultSet iphone = mycon.cho */nDuLieu("select * from HoiDap where MaSP like 'I%';");
// % : 0 ki tu  1 ki tu , _ 1 ki tu  
%>  --%>
      <!-- page content -->
      <div class="right_col" role="main">
      <div class="noidungcauhoi">
    <div class="row">
       <div class="form-group">
        <label class="col-sm-3 " > Chọn Câu Hỏi</label>
        <div class="col-sm-9 " >
          <select id="cauhoi" class="select2_group form-control">
        <!--     <optgroup label="Huwail"> -->
        <% for(Entry<Integer,CauHoi> ds: dao.dsCauHoDaTL.entrySet()){
        %>
          <option value="<%= ds.getKey() %>"><%=ds.getValue().getTenCauHoi() %></option>
  <!--         </optgroup> -->
  <%}%>
      </select>
  </div>
      </div>
      <% 
     CauHoi hd =(CauHoi) session.getAttribute(BienHang.VALUEHOIDAP);
/*       System.out.println(hd);
 */      %>
       <div class="row">
         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
           <div class="x_panel">
             <div class="x_title">
               <h2>Câu Hỏi <small>Thứ <%=hd.getStt()%></small></h2>
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
                   <h3><%=hd.getTenCauHoi() %></h3>
                   <p><%= hd.getNoiDung() %></p>
                 </div> <!-- end jumbotron -->
               </div> <!-- end bs-example -->

             </div> <!-- end x_content -->
           </div> <!-- end xpanel -->
         </div> <!-- end col -->
<div class="row">
         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
           <div class="x_panel">
             <div class="x_title">
               <h2>Câu Trả Lời Trước <small><%= hd.getStt()%></small></h2>
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
                   <div class="container">
  			<div class="row">
  				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
  					<h2>Hình Ảnh Đã Trả Lời</h2>
  				</div>
  			</div>
  			<% ArrayList<CauTraLoi> dsTraLoi = dao.getTraLoi(hd.getStt()) ;%>
  			<%for(CauTraLoi traloi: dsTraLoi) {
  			%>
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
					<div class="thumbnail" >
					<% String imag = "../image/HoiDap/"+traloi.getHinhanh();
					%>
						<img src="<%= imag %>" height="50%" alt="" class ="img-responsive" >
						<div class="caption text-center" >
							<P><%= traloi.getNoidung() %></P>
						</div>
					</div>
				</div>
				<%} %>
			</div>
  		</div>
                  <!--   <iframe src="BieuDoHoiDap.jsp" width= 100% height=100px border= "none"> --> 
                 </div> <!-- end jumbotron -->
               </div> <!-- end bs-example -->

             </div> <!-- end x_content -->
           </div> <!-- end col -->
         </div> <!-- end row -->



       </div> <!-- end right row -->

       <!-- end noidung cau hoi -->


       <div class="">
        <div class="page-title">
          <div class="title_left">
            <h3>Chỉnh Sửa Câu Hỏi</h3>
          </div> <!-- end title_left -->

          </div> <!-- end page-title -->
        </div> <!-- end "" -->
        <div class="clearfix"></div>

        <div class="row">

          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
              <div class="x_title">
                <h2>Chỉnh Sửa Câu Hỏi <small><%= hd.getStt()%></small></h2>
                <ul class="nav navbar-right panel_toolbox">
                  <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                  </li>
                </ul>
                <div class="clearfix"></div>
              </div> <!-- end x_title -->
              <div class="x_content">
            

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
                  <%! int max=0; %>
                  <% 
                  String[] buocLam= (String[]) session.getAttribute(BienHang.BUOC1);
               
                  int i =0;
                  if(buocLam == null){
                	  buocLam = new String[11];
                  }
                   max =buocLam.length;                  
        
                  
                  
                  %>
                  <%! 

                  public String kiemTra(String data){
                  		return data == null ?"": data;
                  }
                  
                  public int kiemTraSo(int i){
                	  if(i >= max){
                		  return max-1;
                	  }
                	  return i;
                  }
                	  %>
                  
                  <div id="step-1">
                    <form class="form-horizontal form-label-left" id="form" action="../../XuLyHoiDap" method ="post">
                     <input type="hidden" name = "action" value = "suatraloi"></input>
                      <h2 class="StepTitle">Các Bước Trả Lời</h2>
                      <div class="row ">
                          <div class="form-group">

                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 1<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[kiemTraSo(i++)]) %>"  required="required" class="form-control col-md-7 col-xs-12">
                        </div> 
                      </div>  
                      </div> <!-- end row -->
                       <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 2<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %>  value ="<%= kiemTra(buocLam[kiemTraSo(i++)]) %>"   required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                      
                       <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 3<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %>  value ="<%= kiemTra(buocLam[kiemTraSo(i++)]) %>"  required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                      <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 4<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[kiemTraSo(i++)]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                       <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 5<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%=kiemTra(buocLam[kiemTraSo(i++)]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                       <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 6<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[kiemTraSo(i++)]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                      <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 7<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[kiemTraSo(i++)]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                       <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 8<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[kiemTraSo(i++)]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                      <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 9<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[kiemTraSo(i++)]) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                      </div> <!-- end row -->
                     <div class="row">
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12 " style="text-align: right;" for="first-name">Bước 10<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name =<%=BienHang.NAMEHOIDAPTL %> value ="<%= kiemTra(buocLam[kiemTraSo(i)]) %>" required="required" class="form-control col-md-7 col-xs-12">
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
	                          <button type="submit" class="btn btn-success">Lưu</button>
	                        </div>
                    </div> <!-- end step 1 -->
</div> 
                  </form>
        <!-- end step 1 -->
                  <div id="step-2">
                  
                  <%! String[] hinhAnh; %>
                  <% 
  								 i =0;int j=0;
            hinhAnh =(String[]) session.getAttribute(BienHang.BUOC2);
  							  if(hinhAnh == null){
  			                	  hinhAnh = new String[10];
                  }
  								%>
  								<%! 
  								 public String kiemTraBatBuoc(int i){
    								  return (hinhAnh[i] != null ?"": "required" );
    							  }
  								%>
                    <h2 class="StepTitle">Hình Anh</h2>
                   <form  class="form-horizontal form-label-left" action="../../XuLyHinhAnh" method ="post">
                   <br>
	                      <div id="upload" style="display:none;">Uploading..</div>
						<div id="uploadComplete" style="display:none;color: red">Upload Completed</div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Hinh 1<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input  value="<%= kiemTra(hinhAnh[kiemTraSo(j)]) %>"  type="file" id="first-name"  name =<%=BienHang.HINHANHHOIDAPTL %>   class="form-control col-md-7 col-xs-12">
                        </div><small><%= kiemTra(hinhAnh[kiemTraSo(j++)]) %></small>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Hinh 2<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input  value="<%= kiemTra(hinhAnh[kiemTraSo(j)]) %>"  type="file" id="last-name"   name =<%=BienHang.HINHANHHOIDAPTL %>  class="form-control col-md-7 col-xs-12">
                        </div> <small><%= kiemTra(hinhAnh[kiemTraSo(j++)]) %></small>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Hinh 3<span class="required">*</span><span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input  value="<%= kiemTra(hinhAnh[kiemTraSo(j)]) %>"  id="middle-name" class="form-control col-md-7 col-xs-12"  type="file" name =<%=BienHang.HINHANHHOIDAPTL %>    >
                        </div> <small><%= kiemTra(hinhAnh[kiemTraSo(j++)]) %></small>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hinh 4<span class="required">*</span><span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input   value="<%= kiemTra(hinhAnh[kiemTraSo(j)]) %>"  id="middle-name" class="form-control col-md-7 col-xs-12"  type="file" name ="<%=BienHang.HINHANHHOIDAPTL %>"   >
                        </div> <small><%= kiemTra(hinhAnh[kiemTraSo(j++)]) %></small>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hinh 5<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input  value="<%= kiemTra(hinhAnh[kiemTraSo(j)]) %>" id="middle-name" class="form-control col-md-7 col-xs-12"  type="file" name =<%=BienHang.HINHANHHOIDAPTL %>  >
                        </div> <small><%= kiemTra(hinhAnh[kiemTraSo(j++)]) %></small>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hinh 6<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input  value="<%= kiemTra(hinhAnh[kiemTraSo(j)]) %>"  id="middle-name" class="form-control col-md-7 col-xs-12" type="file" name =<%=BienHang.HINHANHHOIDAPTL %>   >
                        </div> <small><%= kiemTra(hinhAnh[kiemTraSo(j++)]) %></small>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hinh 7<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input  value="<%= kiemTra(hinhAnh[kiemTraSo(j)]) %>"  id="middle-name" class="form-control col-md-7 col-xs-12"  type="file" name =<%=BienHang.HINHANHHOIDAPTL %>  >
                        </div> <small><%= kiemTra(hinhAnh[kiemTraSo(j++)]) %></small>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hinh 8<span class="required">*</span>
                        </label> <small><%= kiemTra(hinhAnh[kiemTraSo(j++)]) %></small>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input  value="<%= kiemTra(hinhAnh[kiemTraSo(j)]) %>"  id="middle-name" class="form-control col-md-7 col-xs-12"  type="file" name =<%=BienHang.HINHANHHOIDAPTL %>  >
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hinh 9<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input  value="<%= kiemTra(hinhAnh[kiemTraSo(j)]) %>"  id="middle-name" class="form-control col-md-7 col-xs-12"  type="file" name =<%=BienHang.HINHANHHOIDAPTL %>  >
                        </div> <small><%= kiemTra(hinhAnh[kiemTraSo(j++)]) %></small>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hinh 10<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input  value="<%= kiemTra(hinhAnh[kiemTraSo(j)]) %>"  id="middle-name" class="form-control col-md-7 col-xs-12"  type="file" name =<%=BienHang.HINHANHHOIDAPTL %>>
                        </div>  <small><%= kiemTra(hinhAnh[kiemTraSo(j++)]) %></small> <!-- end input -->
                      </div> <!-- end group -->
	                      
                      <div class="form-group">
	                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
	                          <a href="SuaHoiDap.jsp"><button class="btn btn-primary" type="button">Hủy</button></a>
	                          <button type="submit" class="btn btn-success" name = "action" value = "sua">Lưu</button>
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
	                          <a href="../HoiDapAdmin.jsp" class="btn btn-danger"> Quay Lại Trang Chính </a>
	                        </div>
                      </div>
                 
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
            </div>
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
  <script src="vendors/jquery/dist/jquery.min.js"></script> -->


  <!-- FastClick -->

  <!-- NProgress -->
  <!-- bootstrap-progressbar -->
  <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
  <!-- iCheck -->
  <script src="../vendors/iCheck/icheck.min.js"></script>
  <!-- bootstrap-daterangepicker -->
  <script src="../vendors/moment/min/moment.min.js"></script>
  <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
  <!-- bootstrap-wysiwyg -->
  <!-- jQuery Tags Input -->
  <script src="../vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
  <!-- Switchery -->
  <script src="../vendors/switchery/dist/switchery.min.js"></script>
  <!-- Select2 -->
  <script src="../vendors/select2/dist/js/select2.full.min.js"></script>
  
  
  <!-- Parsley -->
  <script src="vendors/parsleyjs/dist/parsley.min.js"></script>
  <!-- jQuery autocomplete -->
  <script src="vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
 <!-- starrr -->
 
 
  <script src="../vendors/starrr/dist/starrr.js"></script>
  <!-- Custom Theme Scripts -->
 <script src="../vendors/jquery/dist/jquery.min.js"></script>
   
  <!-- Bootstrap -->
  <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
  <!-- jQuery Smart Wizard -->
<!--   <script src="../vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
 -->  <!-- Custom Theme Scripts -->
  <script src="../build/js/custom.min.js"></script>

  

</body>
</html>
