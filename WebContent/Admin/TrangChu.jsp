<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%		ServletContext contextDangNhap=getServletContext();
					contextDangNhap.setAttribute("urlweb","Admin/TrangChu.jsp");
				//	System.out.print(getServletContext().getRealPath(""));
				  if(	session.getAttribute("user")==null){
					response.sendRedirect("index.jsp");
				  }%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.text.DecimalFormat" %>
    <%@page import="java.util.ArrayList"%>
  
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Trang admin | </title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
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
              ResultSet rs = mcn.chonDuLieu("select * from [dbo].[ThanhVien] where id='"+TenDangNhap.maDN+"'");
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
                  <li><a href="HoiDapAdmin.jsp"><i class="fa fa-edit"></i> Quản lí hỏi đáp</a>
                    <ul class="nav child_menu">
                    </ul>
                  </li>
                
                  <li><a><i class="fa fa-desktop"></i> Quản lí tài khoản <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="CaNhan.jsp">Thông tin cá nhân</a></li>
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

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="index.jsp">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
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
          <!-- top tiles -->
          <div class="row tile_count">
          <%ThongKe tk = LoadDTBDAO.thongKeSoLieu();%>
            <div class="col-md-2 col-sm-1 col-xs-1 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Tổng  user <br><br></span>
              <div class="count " style="text-align:center"><%out.print(tk.getSoLuongUser()); %></div>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Tổng số lượng <br>sản phẩm</span>
              <div class="count green" style="text-align:center"><%out.print(tk.getSoLuongSanPham()); %></div>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Tổng số lượng<br> sản phẩm tồn kho</span>
              <div class="count" style="text-align:center"><%out.print(tk.getSoLuongSanPhamConKho()); %></div>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Tổng lượng truy cập<br><br></span>
              <div class="count" style="text-align:center"><%out.print(tk.getSoLuongTuyCap()); %></div>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Tổng đơn đặt hàng<br><br></span>
              <div class="count" style="text-align:center"><%out.print(tk.getSoLuongDonDatHang()); %></div>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Tổng số lượt<br> bình luận</span>
              <div class="count" style="text-align:center"><%out.print(tk.getSoLuongBinhLuan()); %></div>
            </div>
          </div>
          <!-- /top tiles -->

          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">

                <div class="row x_title">
                  <div class="col-md-6">
                    <h3>Thống kê tình trạng kho <small></small></h3>
                  </div>
                  <div class="col-md-6">
                    <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                      <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                      <span>12 30, 2014 - 1 28, 2015</span> <b class="caret"></b>
                    </div>
                  </div>
                </div>

                <div class="col-md-9 col-sm-9 col-xs-12">
                  <iframe src="BieuDo/BieuDoSanPham.jsp" class="col-md-12 col-sm-12 col-xs-12" frameborder="0" width="" height="450px"></iframe>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-12 bg-white">
                  <div class="x_title">
                    <h2>Thống kê số lượng sản<br> phẩm chi tiết</h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="col-md-12 col-sm-12 col-xs-6">
                    <div>
                      <p>Số lượng bán được/tổng sản phẩm</p>
                      <div class="">
                        <%
                       int ketQuaSLBD=50;
                        %>
                          <%out.print(tk.getSoLuongSanPhamBanDuoc()+" / "+tk.getSoLuongSanPham() ) ;
                        %><br>
                          
                        <div class="progress progress_sm" style="width: 76%;">
                         
                          <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%out.print(ketQuaSLBD);%>"></div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <p>Số lượng chưa bán được/tổng sản phẩm</p>
                         <%out.print(tk.getSoLuongSanPhamConKho()+" / "+tk.getSoLuongSanPham() ) ;
                         
                         %><br>
                      <div class="">
                        <div class="progress progress_sm" style="width: 76%;">
                          <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%out.print(45);%>"></div>
					</div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-12 col-sm-12 col-xs-6">
                    <div>
                     <% 	 ResultSet rs9 = mcn.chonDuLieu("select * from  [dbo].[QuanLiXuatKho] ") ;%>
                      
                         <%int slXuatKho=0;
                         int slSPConLai=tk.getSoLuongSanPham()-tk.getSoLuongSanPhamBanDuoc();
                        while(rs9.next()){ 
                        	String st= rs9.getString(4);
                        	slXuatKho+=Integer.parseInt(st);
                        }
                        
                       int ketQuaXK=25;
                        %>
                       <%out.print(slXuatKho+" / "+slSPConLai ) ;
                       %><br>
                      <div class="">
                        <div class="progress progress_sm" style="width: 76%;">
                          <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%out.print(ketQuaXK);%>"></div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <p>Số lượng sản phẩm hỏng/tổng sản phẩm còn lại</p>
                      <div class="">
                        <div class="progress progress_sm" style="width: 76%;">
                          <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%out.print(100);%>"></div>
                        </div>
                      </div>
                    </div>
                  </div>

                </div>

                <div class="clearfix"></div>
              </div>
            </div>

          </div>
          <br />

          <br>
          <div class="row">
           <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">

                <div class="row x_title">
                  <div class="col-md-6">
                    <h3>Thống kê doanh thu  chi tiết theo hãng<small></small></h3>
                  </div>
                 <%ArrayList<BangTinhTrangKho> list=new BieuDoDAO().duLieuBang(); %>
           			<form action="../XuLyBieuDo" method="get">
			                  <div class="col-md-3">
			                    <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; ">
			           					  <select class="form-control testSelect" id="sel1" name="tenNSX" onchange="">
											<%
												for (int i = 0; i <list.size(); i++) {
											%>
										<option  value="<%out.print(list.get(i).getTenNSX());%>"
										
										><%out.print(list.get(i).getTenNSX());%></option>	
											<%
												}
											%>
										</select>
			                      
			                    </div>
			                  </div>
			                  <div class="col-md-3">
							<button type="submit" class="btn btn-success" onclick="focusIfr()">Vẽ biểu đồ</button>
			                  </div>
                     </form>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12">
                  <iframe name="ifrBieuDoDoanhThuChiTiet" src="BieuDo/BieuDoDoanhThuChiTiet.jsp" class="col-md-12 col-sm-12 col-xs-12" frameborder="0" width="" height="570px"></iframe>
                </div>
             

                <div class="clearfix"></div>
              </div>
            </div>
           
		</div>
		<br>
		
           <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="dashboard_graph">

                <div class="row x_title">
                  <div class="col-md-12">
                    <h3>Thống kê doanh thu <small></small></h3>
                  </div>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12">
                  <iframe src="BieuDo/BieuDoDoanhThu.jsp" class="col-md-12 col-sm-12 col-xs-12" frameborder="0" width="" height="370px"></iframe>
                </div>
             

                <div class="clearfix"></div>
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
    
    <%!public int lamTronSo(int  a,int b){
		DecimalFormat format=new DecimalFormat("###");
		double so=(a/b)*100;
		double du=so-(int)so;
		if(du==0.0f){
			return Integer.parseInt(format.format(so));
		}else
			return Integer.parseInt( format.format((so-du)+1));
	} %>
	
	<script type="">
function refreshIframe() {
    var ifr = document.getElementsByName('ifrBieuDoDoanhThuChiTiet')[0 ;
    ifr.src = ifr.src;
}
</script>
<script type="">
	function focusIfr(){
	document.getElementsByName("ifrBieuDoDoanhThuChiTiet")[0].contentWindow.document.body.focus();
	}
</script>


    <!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="vendors/Flot/jquery.flot.js"></script>
    <script src="vendors/Flot/jquery.flot.pie.js"></script>
    <script src="vendors/Flot/jquery.flot.time.js"></script>
    <script src="vendors/Flot/jquery.flot.stack.js"></script>
    <script src="vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="vendors/moment/min/moment.min.js"></script>
    <script src="vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
	
  </body>
</html>
