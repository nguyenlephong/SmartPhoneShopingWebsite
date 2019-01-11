
<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
</head>
<body>
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
              ResultSet rs = mcn.chonDuLieu("select * from ThanhVien where id='"+TenDangNhap.maDN+"'");
              %>
                  <% while(rs.next()){ %>
                <img src="<%=rs.getString(7)%>" alt="..." class="img-circle profile_img">
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
                  <li><a href="../HoiDapAdmin.jsp"><i class="fa fa-edit"></i> Quản lí hỏi đáp  </a>
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
        

</body>
</html>