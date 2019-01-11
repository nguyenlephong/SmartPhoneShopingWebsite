<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@page import="java.util.Map"%>
<%		ServletContext contextDangNhap=getServletContext();
					contextDangNhap.setAttribute("urlweb","Admin/KhachHang/ThanhVien.jsp");
				  if(session.getAttribute("user")==null){
					response.sendRedirect("../index.jsp");
				  }%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%Map<String,ThanhVien> mapMember = ThanhVienDAO.mapMember; %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Quản lí thành viên</title>

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
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_content">
                    <div class="row">
                     

                      <!-- <div class="clearfix"></div> -->
                      
                      
                      
                         <% 
		         		  for(ThanhVien tv:mapMember.values()){
     			   	%>

                      <div class="col-md-6 col-sm-6 col-xs-12 profile_details">
                        <div class="well profile_view">
                          <div class="col-sm-12">
                            <div class="left col-xs-7">
                              <h2><%=tv.getName()%></h2>
                               <p><strong>Sinh năm: </strong> <%=tv.getDate() %> </p>
                              <p><strong>Cấp bậc: </strong> <%=tv.getLevel() %> </p>
                               <p><strong>Chuyên ngành: </strong> <%=tv.getChuyen() %> </p>
                              <ul class="list-unstyled">
                                <li><i class="fa fa-building"></i> Địa chỉ:<%=tv.getAddress()%></li>
                                <li><i class="fa fa-phone"></i> Số điện thoại :0<%=tv.getPhone()%> </li>
                              </ul>
                            </div>
                            <div class="right col-xs-5 text-center">
                              <img src="../<%=tv.getImage() %>" alt="" class="img-circle img-responsive">
                            </div>
                          </div>
                         
                        </div>
                      </div>

    <% } %>

                     

                   </div>
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

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
  </body>
</html>