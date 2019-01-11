  <%		ServletContext contextDangNhap=getServletContext();
					contextDangNhap.setAttribute("urlweb","Admin/CaNhan.jsp");
				  if(	session.getAttribute("user")==null){
					response.sendRedirect("index.jsp");
				  }%>
<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<% Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Trang cá nhân | </title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    
    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="" class="site_title"><i class="fa fa-paw"></i> <span>Shop Phone</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
              <% MyConnectDB mcn = new MyConnectDB();
              ResultSet rs = mcn.chonDuLieu("select * from [dbo].[user] where id='"+TenDangNhap.maDN+"'");
              String imgCaNhan="";
              String ngaySinh="";
              String chuyenNganh="";
              String diaChi="";
              String web="";
              String sdt="";
              String soThich="";
              String id="";
              ServletContext contextIDUser=getServletContext();
           		 while(rs.next()){ 
                	  id=rs.getString(1);
                	  contextIDUser.setAttribute("iduser", id);
                   diaChi=rs.getString(6);
                   imgCaNhan=rs.getString(12);
                   sdt=rs.getString(8);
                   ngaySinh=rs.getString(9);
                   chuyenNganh=rs.getString(10);
                   web=rs.getString(11);
                   soThich=rs.getString(13);
                   %>
                <img src="<%=rs.getString(12)%>" alt="..." class="img-circle profile_img">
                <%} %>
              </div>
              <div class="profile_info">
                <span>Xin chào,</span>
                
                <h2><%=TenDangNhap.name %></h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                     <div class="menu_section">
                <h3>Quảng lí trang chính</h3>
                <ul class="nav side-menu">
                  <li><a href="TrangChu.jsp"><i class="fa fa-home"></i> Thống kê</a>
                   
                  </li>
                  <li><a href="BinhLuan/BinhLuan.jsp"><i class="fa fa-edit"></i> Quản lí bình luận</a>
                    <ul class="nav child_menu">
                    </ul>
                  </li>
                  <li><a href="HoiDapAdmin.jsp"><i class="fa fa-edit"></i> Quản lí hỏi đáp</a>
                    <ul class="nav child_menu">
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> Quản lí tài khoản <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="CaNhan.jsp">Thông tin cá nhân </a></li>
                                <%User user=(User)session.getAttribute("user"); 
                  if(user!=null){
                	  if(user.getRole().equalsIgnoreCase("boss")){
                  %>
                      <li><a href="KhachHang/ThanhVien.jsp">Danh sách thành viên </a></li>
                  <%	  }
                  } %>
                      <li><a href="KhachHang/TaiKhoanKH.jsp">Tài khoản khách hàng</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> Quản lí sản phẩm <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="SanPham/SanPham.jsp">Sản phẩm</a></li>
                      <li><a href="NhaSanXuat/NhaSanXuat.jsp">Quản lí hãng sản xuất</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i> Quản lí kho <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="KhoHang/NhapKho.jsp">Nhập kho</a></li>
                      <li><a href="KhoHang/XuatKho.jsp">Xuất kho</a></li>
                      <li><a href="TinhTrangKhoHang.jsp">Tình trạng kho hàng</a></li>
                    </ul>
                  </li>
                  <li><a href="DonHang/DonHang.jsp"><i class="fa fa-clone"></i>Quản lí đơn hàng </a>
                  </li>
                  <li><a href="DatHangOnline.jsp"><i class="fa fa-clone"></i>Đặt hàng online </a>
                  </li>
                </ul>
              </div>
              <div class="menu_section">
                <h3>Quản lí hệ thống	</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-bug"></i> Quản lí menu <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="#">Thêm menu  chính</a></li>
                      <li><a href="#">Thêm menu con</a></li>
                    </ul>
                  </li>
                  <li><a href="../Logout"><i class="fa fa-windows"></i> Đăng xuất <span class="fa fa-chevron-down"></span></a>
                  </li>
                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
           
            
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Những điểm nổi bật<small></small></h2>
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
                    <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                      <div class="profile_img">
                        <div id="crop-avatar">
                          <!-- Current avatar -->
                          <img class="img-responsive avatar-view" src="<%=imgCaNhan%>" alt="Avatar" title="Change the avatar">
                        </div>
                      </div>
                      <h3><%out.print(TenDangNhap.name); %></h3>

                      <ul class="list-unstyled user_data">
                        <li><i class="fa fa-map-marker user-profile-icon"></i> <%out.print(diaChi); %>
                        </li>

                        <li>
                          <i class="fa fa-briefcase user-profile-icon"></i><%out.print(chuyenNganh); %>
                        </li>

                        <li class="m-top-xs">
                          <i class="fa fa-external-link user-profile-icon"></i>
                          <a href="<%=web %>" target="_blank">Web cá nhân: Link</a>
                        </li>
                      </ul>

                      <a class="btn btn-success" href="CaNhan/SuaNhanVienCaNhan.jsp?maid=<%=id%>"><i class="fa fa-edit m-right-xs"></i>  Sửa thông tin</a>
                      <br />

                      <!-- start skills -->
                      <h4>Kỷ năng</h4>
                      <ul class="list-unstyled user_data">
                        <li>
                          <p>Ứng dụng web</p>
                          <div class="progress progress_sm">
                            <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
                          </div>
                        </li>
                        <li>
                          <p>Thiết kế web</p>
                          <div class="progress progress_sm">
                            <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="70"></div>
                          </div>
                        </li>
                        <li>
                          <p>Công nghệ phần mềm</p>
                          <div class="progress progress_sm">
                            <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="30"></div>
                          </div>
                        </li>
                        <li>
                          <p>Ngoại ngữ</p>
                          <div class="progress progress_sm">
                            <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
                          </div>
                        </li>
                      </ul>
                      <!-- end of skills -->

                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-12">

                      <div class="profile_title">
                        <div class="col-md-6">
                          <h2>Biểu đồ thể hiện điểm số qua các môn chuyên ngành</h2>
                        </div>
                        <div class="col-md-6">
                          <div id="reportrange" class="pull-right" style="margin-top: 5px; background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #E6E9ED">
                            <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                            <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                          </div>
                        </div>
                      </div>
                      <!-- start of user-activity-graph 
                      <div id="graph_bar" style="width:100%; height:280px;"></div>-->
                      
                      <div style="width:100%; height:280px;">
                      <iframe src="BieuDo/BieuDoThanhVien.jsp" width="100%"  height="280px"></iframe>
                      </div>
                      
                      
                      <!-- end of user-activity-graph -->

                      <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                         
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Công việc làm project</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Sở thích cá nhân</a>
                          </li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                         
                          <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">

                            <!-- start user projects -->
                            <table class="data table table-striped no-margin">
                            <%ResultSet res = new MyConnectDB().chonDuLieu("select * from CongViecProJect"); %>
                              <thead>
                                <tr>
                                  <th>#</th>
                                  <th>Tên project</th>
                                  <th>Địa điểm làm việc</th>
                                  <th class="hidden-phone">Thời gian</th>
                                  <th>Mô tả tiến độ</th>
                                </tr>
                              </thead>
                              <tbody>
                              <%int count=0;while(res.next()){count++; %>
                                <tr>
                                  <td><%=count %></td>
                                  <td><%=res.getString(1) %></td>
                                  <td><%=res.getString(2) %></td>
                                  <td class="hidden-phone"><%=res.getString(3) %></td>
                                  <td class="vertical-align-mid">
                                    <div class="progress">
                                      <div class="progress-bar progress-bar-success" data-transitiongoal="<%=res.getString(4)%>"></div>
                                    </div>
                                  </td>
                                </tr>
                                <%} %>
                              
                               
                              </tbody>
                            </table>
                            <!-- end user projects -->

                          </div>
                          <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                            <p><%out.print(soThich);%></p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
       <jsp:include page="Footer/Footer.jsp"></jsp:include>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="vendors/nprogress/nprogress.js"></script>
    <!-- morris.js -->
    <script src="vendors/raphael/raphael.min.js"></script>
    <script src="vendors/morris.js/morris.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="vendors/moment/min/moment.min.js"></script>
    <script src="vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>

  </body>
</html>