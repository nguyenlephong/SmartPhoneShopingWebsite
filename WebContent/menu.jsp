<%@page import="model.ThongTinSanPhamTrongGioHang"%>
<%@page import="model.ThongSoKiThuatSanPham"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.TreeSet"%>
<%@page import="dao.TimKiemDao"%>
<%@page import="model.KhachHang"%>
<%@page import="dao.TatCa"%>
<%@page import="dao.TatCaSPDao"%>
<%@page import="dao.ChiTietDonHangDAO"%>
<%@page import="model.ChiTietDonHang"%>
<%@page import="dao.KhachHangDao"%>
<%@page import="model.ConnectionDB"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.ThongTinDienThoai"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ChonSanPhamDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.SanPham"%>
<%@page import="java.util.Map"%>
<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style type="text/css">
    .canle{
    margin-top: 20px;
     
    }
    .canles{
    margin-top: 12px;
    padding-right: 40px;
    }
    .btn-block{
    width: 50px;
    height: 38px;
    }
    </style>
</head>
<body>
<%Map<String,ThongTinSanPhamTrongGioHang> danhSachSanPhamCoTrongGioHang=(Map<String,ThongTinSanPhamTrongGioHang>)session.getAttribute("giohang"); %>
<%
int i = 0;
for(ThongTinSanPhamTrongGioHang gioHang:danhSachSanPhamCoTrongGioHang.values()){
	i+=gioHang.getSoLuong();
}


%>

<header>
	<div id="navbar-full">
    <div id="navbar">
       <!--    
        navbar-default can be changed with navbar-ct-blue navbar-ct-azzure navbar-ct-red navbar-ct-green navbar-ct-orange  
        -->
        <nav class="navbar navbar-ct-green" role="navigation">
          
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand navbar-brand-logo" href="sanpham.jsp">
                    <div class="img-circle">
                   	 <img src="image/ThanhVien/phongok.png" width="40px" height="40px">
                     Shopphone 
                    </div>
              </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav navbar-right">
              
              	
                   <li class="canle">
                     <form action="<%=request.getContextPath()%>/XuLyTimKiem" method="post">
                     
                     <%TimKiemDao timkiem=new TimKiemDao();
            			timkiem.loadDSDT();
            			timkiem.loadDSDT1();
            			TreeSet<String>treeset=timkiem.tree;
                     %>
                       <input type="text" class="form-control" name="timkiem" list="dt" style="width: 135px">
                       <datalist id="dt">
                       <%Iterator ite=treeset.iterator();
           			   while(ite.hasNext()){
           				   String s=(String)ite.next();
           			   %>
                       <option value="<%=s%>"><%out.print(s);%>
                       </option>
                       <%}%>
                       </datalist>
                       
                    </li>
                    <li class="canles">
                 		<button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-search"></span>Tìm</button>
                 	 </form>
                    </li>
                    
                    
                    
                    <li>
                        <a href="sanpham.jsp">
                            <i class="pe-7s-phone">
                                <span class="label"></span>
                            </i>
                            <p>Điện thoại</p>
                        </a>
                    </li>
                    
                    
                     <li>
                        <a href="Xulyhd">
                            <i class="pe-7s-light">
                                <span class="label">12</span>
                            </i>
                            <p>Hỏi đáp</p>
                        </a>
                    </li>
                    
                       
                    <%KhachHang user2=(KhachHang)(session.getAttribute("khachHang")); %>
                      <%String link="";%>
                      <%if(user2!=null){
                    	  link="giohang.jsp?id="+user2.getTenTaiKhoan();
                      }%>
                      
                      
                      
                     <li>
                        <a href="giohang.jsp">
                            <i class="pe-7s-cart">
                                <span class="label"> <%=i%> </span>
                            </i>
                            <!--Nếu đã đăng nhập thì ghi là giỏ hàng của ai và ghi số sản phẩm có trong giỏ hàng là trống-->
                            
                          <p>Giỏ hàng
                            
                            <%if(user2!=null){
								out.print("của "+user2.getTenKhachHang());                            	
                            }
                            	%>
                            
                             </p>
                        </a>
                    </li>  
                    
                    
                     <li>
                        <a href="nhatkynhom.jsp">
                            <i class="pe-7s-note">
                                <span class="label"></span>
                            </i>
                            <p>Nhật ký nhóm</p>
                        </a>
                    </li>  
                    <!--Nếu đã đăng nhập thì ghi là xin chào tên khách và cho phép đăng xuất,đổi mật khẩu và cho xem thông tin cá nhân--> 
                    <!--Nêu chưa đăng nhập thì có một chức năng duy nhất là đăng nhập ngay -->
                    
                    
                    <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="pe-7s-user"></i>
                                <p>
                                <%if(user2!=null){
                                	out.print("Xin chào "+user2.getTenKhachHang());
                                }else{
									out.print("Tài khoản");                                	
                                }%>
                                </p>
                            </a>
                            
                             <%if(user2==null){ %>
                          <ul class="dropdown-menu">
                            <li><a href="dangnhap.jsp#signin">Đăng nhập ngay</a></li>
                            <li class="divider"></li>
                            
                            <li  style="text-align:center" > <strong class="pe-7s-users"></strong> <a href="dangnhap.jsp#signup">Đăng ký</a></li>
                            
                          </ul>
                          <%} %>
                            
                            
                           <%if(user2!=null){ %>
                            
                          <ul class="dropdown-menu">
                          	 <li style="text-align:center"><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModalAbout">Xem thông tin</button></li>
                            <li class="divider"></li>
                            
                            <li  style="text-align:center" > <strong class="pe-7s-users"></strong><a   href="<%=response.encodeURL("XuLyDangXuat") %>?user =<%=user2.getTenTaiKhoan()%>">Đăng xuất</a></li>
                            <li  style="text-align:center" ><button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal">Đổi mật khẩu</button></li>
                          </ul>
                          
                          <%} %>
                          
                    </li>
                    
                    
                    <%if(user2!=null){
                    	if(user2.getRole().equalsIgnoreCase("admin")){
                    %>
                     <li>
                        <a href="LoginAdmin?user=<%=user2.getTenTaiKhoan()%>&pwd=<%=user2.getMatKhau()%>">
                            <i class="pe-7s-config">
                                <span class="label"></span>
                            </i>
                            <p>Admin</p>
                        </a>
                    </li>
                    <%} %>
                    <%} %>
                
             
                    
                    
               </ul>
              
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
      
    </div><!--  end navbar -->

</div> <!-- end menu-dropdown -->
	</header>
</body>
</html>