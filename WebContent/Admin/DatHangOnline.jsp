<!--   <%		ServletContext contextDangNhap=getServletContext();
					contextDangNhap.setAttribute("urlweb","Admin/DatHangOnline.jsp");
				  if(	session.getAttribute("user")==null){
					response.sendRedirect("index.jsp");
				  }%> -->
				  
<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%
						ServletContext contextChucNang = getServletContext();
				//		contextChucNang.setAttribute("chucNang", "changecount"); 
					%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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

    <title>Đặt hàng online</title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
    
     <!-- Datatables -->
    <link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <jsp:include page="Menu/Menu.jsp"></jsp:include>

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
                      <%KhachHang kh =(KhachHang)session.getAttribute("KhachHang");
                      String maKH="";
                      String tenKH="";
                      String phone="";
                      String address="";
                      String email="";
                      String luotMua="";
                        if(kh!=null){
                        	 maKH = kh.getId();
                        	 tenKH = kh.getName();
                        	 phone = kh.getPhone();
                        	 address = kh.getAddress();
                        	 email=kh.getEmail();
                        	 luotMua = kh.getSoLuotMuaHang();
                        }

                      %>


                          <div class="col-sm-12">
                          		<div class="col-sm-4">
                                   <div class="col-sm-12">
                                      <center><strong><h3>Nhập tên khách hàng:</h3></strong><jsp:include page="SearchFilter/LocTenKhachHang.jsp"></jsp:include>
                                    </center>
                                    <div class="col-sm-12">
                                    <%if(kh!=null){ %>
                                        <center><label><strong><h3>Thông tin khách hàng:</h3></strong></label></center>
                                        <p>Mã khách hàng: <%out.print(maKH); %></p>
                                        <p>Tên khách hàng: <%out.print(tenKH); %></p>
                                        <p>Số điện thoại: <%out.print(phone); %></p>
                                        <p>Địa chỉ: <%out.print(address); %></p>
                                        <p>Email: <%out.print(email); %></p>
                                        <p>Số lượt mua sản phẩm: <%out.print(luotMua); %></p>
                                    </div>
                                   </div>
                             		<div class="col-sm-12">
	                             		<a href="../Search?chucNang=doiKH"><button class="btn btn-sm btn-success " ><span class="glyphicon glyphicon-log-out"></span>  Đổi khách hàng</button></a> 
                             		</div>
                             		<%} %>
                             	 </div>
                             	 <br>
                             	 
                             	    <%SanPhamDatHang sp =(SanPhamDatHang)session.getAttribute("SanPham");
						                        if(sp!=null ){
						                        	new SanPhamDAO().addSPDatHang(sp, sp.getSoLuong());
						                        	sp=null;
						                        	
						                        }
                             	    	//	ArrayList<SanPhamDatHang> dsDatHang = new SanPhamDAO().getDsDatHang();
                             	    		ArrayList<SanPhamDatHang> dsDatHang = SanPhamDAO.dsDatHang;
						                      %>
                             	 
                             	 <%if(kh!=null){ %>
                               <div class="col-sm-8">
                                    <div class="col-sm-12">
                                       <center><strong><h3>Nhập tên sản phẩm cần mua:</h3></strong><jsp:include page="SearchFilter/LocTenSanPham.jsp"></jsp:include>
                                       </center>
                                    </div>
                                    <br>
                                    <div class="col-sm-12">
                                        	 <table id="datatable-buttons" class="table table-striped table-bordered">
										                      <thead>
										                        <tr>
										                          <th>Mã Sản Phẩm</th>
										                          <th>Tên Sản Phẩm </th>
										                          <th>Số lượng </th>
										                          <th>Số tiền</th>
										                          <th colspan="2">Thao tác</th>
										                        </tr>
										                      </thead>
												
										                      <tbody>
                                        	 <%for(int i=0;i<dsDatHang.size();i++){ %>
										                        <tr>
										                          <td><%out.print(dsDatHang.get(i).getMaSanPham()); %></td>
										                          <td><%out.print(dsDatHang.get(i).getTenSanPham()); %></td>
										                          <td><%out.print(dsDatHang.get(i).getSoLuong()); %></td>
										                          <td><%out.print(Integer.parseInt(dsDatHang.get(i).getSoLuong())*Integer.parseInt(dsDatHang.get(i).getGiaSanPham())+""); %></td>
										                       
										                           <td><a href="../Search?chucNang=Xoa&id=<%=dsDatHang.get(i).getMaSanPham()%>">
											                        	  <button type="button" class="btn btn-sm btn-danger" id="" aria-label="Right Align">
																			<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
																		</button>
									                        	  </a></td>
									                        	 <!--  <td><a href="../Search?chucNang=Tang&id=<%=dsDatHang.get(i).getMaSanPham()%>">
											                        	  <button type="button" class="btn  btn-sm btn-primary" id="" aria-label="Right Align">
																			<span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span>
																		</button>
									                        	  </a></td>
									                        	  <td><a href="../Search?chucNang=Giam&id=<%=dsDatHang.get(i).getMaSanPham()%>">
											                        	  <button type="button" class="btn  btn-sm btn-primary" id="" aria-label="Right Align">
																			<span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span>
																		</button>
									                        	  </a></td> -->
									                        	  <td><a href="SanPham/ChiTietSanPham.jsp?ID=<%=dsDatHang.get(i).getMaSanPham()%>">
											                        	  <button type="button" class="btn btn-sm btn-primary" aria-label="Right Align">
																			<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
																		</button>
									                        	  </a></td>
										                        </tr>
										                        <%} %>
										                      </tbody>
										    </table>
                                    </div>
		                               <div class="col-sm-12" style="float:right">
		                               		<a href="../Search?chucNang=XuatDonHang"><button type="button" class="btn btn-sm btn-primary" aria-label="Right Align">
																					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>  Xuất đơn hàng
																				</button></a>
		                               </div>
                               </div>
                               <%} %>
                          </div>
                         


                     

                   </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

		<!-- Modal sửa số lượng sản phẩm cần mua -->
		
	

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
    
      <!-- Datatables -->
    <script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
    
    <!-- Script modal đổi số lượng sản phẩm -->
  	
    <!-- Script đổi khách hàng -->

  </body>
</html>