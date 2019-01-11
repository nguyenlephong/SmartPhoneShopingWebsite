<%@page import="model.ChiTietDonHang"%>
<%@page import="dao.ChiTietDonHangDAO"%>
<%@page import="model.ConnectionDB"%>
<%@page import="dao.KhachHangDao"%>
<%@page import="model.SanPham"%>
<%@page import="model.KhachHang"%>
<%@page import="model.ThongTinDienThoai"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="model.CauHoi"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.ConnectionDB"%>
<%@page import="dao.MoTaThongTinSanPhamDAO"%>
<%@page import="model.ThongTinSanPhamTrongGioHang"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
    <html>

    <head>

        <title>Hỏi đáp về sản phẩm và dịch vụ tại Shopphone</title>
       
        <link rel="stylesheet" type="text/css" href="css/hoidap.css">
        <link href="https://fonts.googleapis.com/css?family=Baloo+Bhaina" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">   
        <link rel="stylesheet" type="text/css" href="Boot/css/bootstrap.min.css">
        <script type="" src="boot/js/bootstrap.min.js"></script>
        
        
				        <!-- Menu -->
				 	<link href="cssmenu/css/bootstrap.css" rel="stylesheet" />
				
				    <link href="cssmenu/css/pe-icon-7-stroke.css" rel="stylesheet" />
					<link href="cssmenu/css/ct-navbar.css" rel="stylesheet" />  
				<!-- Menu -->
				 	<style type="text/css">
			.footer_mark{
			 	width: 100%;
			    min-width: 980px;
			    overflow: hidden;
			    background: #f8f8f8;
			    padding: 10px 0
			}
			.rowfoot1 {
			    display: block;
			    overflow: hidden;
			    width: 100%;
			    margin: 0 auto;
			    padding: 15px 10px ;
			    background: #f8f8f8;
			    
			}
			.nonglam{
			    width: 100px;
			    height: auto;
			    margin: 0 auto
			}
	</style>
    </head>

    <body>
    <%ServletContext context=getServletContext();
	context.setAttribute("url","index.jsp" );
%>

<%!	public static boolean kiemTraCoLaSo(String s){
	boolean check=false;
	for (int i = 0; i < s.length(); i++) {
		if(!coLaSo(s.substring(i, i+1))){
			return false;
		}
	}
	return true;
}
public static boolean coLaSo(String a){
	try{
		Integer.parseInt(a);
	}catch(NumberFormatException e){
		return false;
	}
	return true;
} %>

 <%if(session.getAttribute("giohang")==null){
		Map<String,ThongTinSanPhamTrongGioHang> danhSachSanPham=new HashMap<>();
		session.setAttribute("giohang", danhSachSanPham);
	}%>
<%Map<String,ThongTinSanPhamTrongGioHang> danhSachSanPhamCoTrongGioHang=(Map<String,ThongTinSanPhamTrongGioHang>)session.getAttribute("giohang"); %>
<%if(session.getAttribute("danhSachKhachHang")==null){
		Map<String,KhachHang> danhSachKhachHang=KhachHangDao.dsKhachHang();
		session.setAttribute("danhSachKhachHang", danhSachKhachHang);
	}
%>
<%if(session.getAttribute("danhsachtatcasanpham")==null) {
	session.setAttribute("danhsachtatcasanpham", ConnectionDB.danhSachTatCaSanPham());
}
if(session.getAttribute("danhsachsanphamduocmota")==null){
	session.setAttribute("danhsachsanphamduocmota", MoTaThongTinSanPhamDAO.danhSachSanPhamDuocMoTa());
}
%>

<%if(session.getAttribute("danhSachChiTietDonHang")==null){
	Map<String,ChiTietDonHang> danhSachChiTietDonHang= ChiTietDonHangDAO.danhSachTatCaChiTietDonHang();
	session.setAttribute("danhSachChiTietDonHang", danhSachChiTietDonHang);
}%>
  
    <br>
    <br>
    <br>
    <br>
     <%
     Map<String, CauHoi> dsCauHoiTheoTen =(Map<String, CauHoi>) session.getAttribute("dsTimThay");
     Map<Integer, CauHoi> dsCauHoi =(Map<Integer, CauHoi>) session.getAttribute("dsCauHoi1");
 		ArrayList<ThongTinDienThoai > dsSanPham= (ArrayList<ThongTinDienThoai>) session.getAttribute("dsSanPham1");
     ArrayList<CauHoi> dsCauHoiQuanTam = (ArrayList<CauHoi>) session.getAttribute("dsCauHoiQuanTam1");
	System.out.println("Danh Sach Cau Hoi Theo Ten"+dsCauHoiTheoTen);
	System.out.println("Danh Sach Cau Hoi Quan Tam"+dsCauHoiQuanTam);
	System.out.println("Danh Sach Cau hoi"+dsCauHoi);
	System.out.println("Danh Sach San Pham"+dsSanPham);
%> 
    
        <section>

            <ul class="menu">
                <li><a href="thongtinsanpham.jsp" class=actmenu>Sản Phẩm mới</a>
                </li>
                <li><a href="https://m.me/100004165800583" target="_blank" class="messenger"><b></b><span>Nhắn tin cho chúng tôi</span></a>
                </li>
               

		<a href="XuLych" >
              <li class="menucommunity">
                <div class="login">
                Đặt Câu Hỏi
                </div>
               
                       </li>
                         </a>
    </ul>   


         <div class="row">
          <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
           <div class="search">
            <form action="XuLych" method="get" onsubmit="" class="wrap_search">
                <input id="txtKeysearch" name="search" type="text" placeholder="Tìm hướng dẫn, mẹo hay, câu hỏi" autocomplete="on" onkeydown="CheckTimerFAQ()" onkeyup="suggestionSearchFAQ(event);" maxlength="250">
                <i class="iconask-search"></i>
                <button type="submit">Tìm kiếm</button>
                <div id="suggestionFaq"></div>
            </form>
        </div>
    </div>


    <div class="clr"></div>
    <aside class="leftask">
                 
                  </form> 
 
                  <div class="clr"></div>          
                  <div class="colcenterask">
                    <div class="filview">
                      <a id="tagNew" href="Xulyhd?action=1"  class=c urrent>Mới nhất</a> <span>|</span>
					<a id="tagNoAnswer" name ="action" value="chua" href="Xulyhd?action=2">Câu hỏi chưa
						được trả lời</a>
                    </div>
                    <ul class="listask">

               <%
               /* ArrayList<CauHoi> dsTimThay =(ArrayList) session.getAttribute("dsTimThay");
				if(dsTimThay == null){		 */		
					
					if(dsCauHoiTheoTen == null){
               for(Entry<Integer,CauHoi> ch : dsCauHoi.entrySet()){
            	   %>
                        <li class="item">
                            <a href="Xulyhd?mahd=<%= ch.getKey()%>">
                                <img class="lazy" src ="<%= ch.getValue().getHinhAnh()%>" width="95" alt="">
                                <h3><%= ch.getValue().getTenCauHoi() %></h3>
                                <div> <%= ch.getValue().getNoiDung() %></div>
                            </a>
                            <div class="info">
                                <a href="thongtinsanpham.jsp?maSP=<%= ch.getValue().getMaSanPham() %>" class="link">• iPhone 6S</a>
                            </div>
                        </li>
                       <%}} %>
                       <%if(dsCauHoiTheoTen != null){
                    	   for(Entry<String,CauHoi> ch : dsCauHoiTheoTen.entrySet()){
                    	   %>
                        <li class="item">
                            <a href="Xulyhd?mahd=<%= ch.getValue().getStt()%>">
                                <img class="lazy" src ="<%= ch.getValue().getHinhAnh()%>" width="95" alt="">
                                <h3><%= ch.getValue().getTenCauHoi() %></h3>
                                <div> <%= ch.getValue().getNoiDung() %></div>
                            </a>
                            <div class="info">
                                <a href="thongtinsanpham.jsp?maSP=<%= ch.getValue().getMaSanPham() %>" class="link">• iPhone 6S</a>
                            </div>
                        </li>
                       <%}} %>
			<%-- 	<%
				if(dsTimThay != null){
					for(CauHoi ch: dsTimThay){
					%>
			
               <li class="item">
                            <a href="Xulyhd?mahd=<%= ch.getStt()%>">
                                <img class="lazy" src ="<%= ch.getHinhAnh()%>" width="95" alt="">
                                <h3><%= ch.getTenCauHoi() %></h3>
                                <div> <%= ch.getNoiDung() %></div>
                            </a>
                            <div class="info">
                                <a href="thongtinsanpham.jsp?maSP=<%= ch.getMaSanPham() %>" class="link">• iPhone 6S</a>
                            </div>
                        </li>
                        <%
                        }
				}
					%> --%>
                        
    </ul>
    <a id="morelist" href="#" onclick="LoadMoreQuestion();" class="viewmore">Xem thêm (còn <span>12.992</span>) <b></b></a>
    </div>
    </aside>

    <div class="colleftask">
        <div class="asklot">
            <strong>Sản phẩm được hỏi nhiều</strong>
            <ul>
            
                     <%
                     int i =0;
                     for(ThongTinDienThoai sp: dsSanPham){
            	%> 
                <li>
                     <a href="thongtinsanpham.jsp?maSP=<%= sp.getMaSP() %>" class="linkimg">
                        <img width="50" height="50" src="<%=sp.getHinhAnh()%>" alt="">
                    </a>
                    <a href="thongtinsanpham.jsp?maSP=<%= sp.getMaSP()%>" class="linktitle">
                        <h3><%= sp.getTen() %> </h3>
                    </a> 
                    <a href="#" class="link">550 câu hỏi</a>
                    <a href="#" class="link">
                        <label>•</label>
                        44 hướng dẫn
                    </a>
                    <a href="#" class="link">
                        <label>•</label>
                        10 mẹo hay
                    </a>
                </li>
                 <%} %> 
            </ul>
            <div class="clr"></div>
            <div class="searchtopPro">
                <i class="iconask-mbs"></i>
                <form action="/san-pham" method="get" onsubmit="return submitSearchFormProduct();" class="sprod">
                    <i class="iconask-search pos"></i>
                    <input id="search-Product" name="" type="text" placeholder="Sản phẩm cần tìm" autocomplete="off" onkeydown="CheckTimerPro()" onkeyup="searchProduct(event);" maxlength="50">
                </form>
                <div id="SuggestSearchProduct"></div>
            </div>
            <div class="clr"></div>
        </div>

        <div class="interested">
            <strong>Quan tâm nhiều nhất</strong>
            <ul>
          <%
           
            for(CauHoi ch: dsCauHoiQuanTam) {
            %> 
               <li>
                    <a href="Xulyhd?mahd=<%=ch.getStt()%>">
                        <h3><%= ch.getTenCauHoi()%></h3>
                        </a>
                        <div> <%= ch.getNoiDung()%></div>
                        <div class="info">
                            <i><%= ch.getNguoiDang() %> Đã Đăng</i>
                            <span>• <%= ch.getNgayDang() %></span>
                        </div>
                </li> 
               <%}%>  
            </ul>
        </div>
        <script type="text/javascript">
            var _iPageSubj = 0;
            var _iTotalSubj = 10;
        </script>

    </div>


    </section>
    <!-- header -->
<!-- Menu -->
	<header>
	<div id="navbar-full">
    <div id="navbar">
       <!--    
        navbar-default can be changed with navbar-ct-blue navbar-ct-azzure navbar-ct-red navbar-ct-green navbar-ct-orange  
        -->
        <nav class="navbar navbar-ct-green navbar-fixed-top" role="navigation">
          
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand navbar-brand-logo" href="index.jsp">
                    <div class="img-circle">
                   	 <img src="image/ThanhVien/phongok.png" width="40px" height="40px">
                     Shopphone 
                    </div>
              </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav navbar-right">
                   <li>
                        <a href="javascript:void(0);" data-toggle="search" class="hidden-xs">
                            <i class="pe-7s-search"></i>
                            <p>Tìm kiếm</p>
                        </a>
                    </li>
                    <li>
                        <a href="index.jsp">
                            <i class="pe-7s-phone">
                                <span class="label"></span>
                            </i>
                            <p>Điện thoại</p>
                        </a>
                    </li>
                     <li>
                        <a href="hoidap.jsp">
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
                        <a href="<%=link%>">
                            <i class="pe-7s-cart">
                                <span class="label"> <%=danhSachSanPhamCoTrongGioHang.size() %> </span>
                            </i>
                            <!-- Nếu đã đăng nhập thì ghi là giỏ hàng của ai và ghi số sản phẩm có trong giỏ hàng tổng -->
                            
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
                    <!-- Nếu đã đăng nhập thì ghi là xin chào tên khách và cho phép đăng xuất đổi mật khẩu và cho phép xem thông tin cá nhân -->
                    <!-- Nếu chưa đăng nhập thì chỉ có 1 chức năng duy nhất là đăng nhập ngay -->
                    
                    
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
                            
                            <li  style="text-align:center" > <strong class="pe-7s-users"></strong> <a href="dangnhap.jsp#signup">Đăng kí</a></li>
                            
                          </ul>
                          
                          <%} %>
                            
                            
                           <%if(user2!=null){ %>
                            
                          <ul class="dropdown-menu">
                            <li><a href="thongtincanhan.jsp?id=<%=user2.getTenTaiKhoan()%>">Xem thông tin tài khoản</a></li>
                            <li class="divider"></li>
                            
                            <li  style="text-align:center" > <strong class="pe-7s-users"></strong><a   href="<%=response.encodeURL("XuLyDangXuat") %>">Đăng xuất</a></li>
                            <li  style="text-align:center" ><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Đổi mật khẩu</button></li>
                          </ul>
                          
                          <%} %>
                          
                            
                    </li>
               </ul> 

               <div class="navbar-form navbar-right navbar-search-form" role="search">                  
                 <div class="form-group">
                 <form action="<%=request.getContextPath()%>/XuLyTimKiem" method="post">
                 
                      <input type="text" value="" class="form-control" placeholder="Tìm kiếm" name="timkiem">
                      <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span>Tìm</button>
                      
                </form>
                 </div> 
              </div>
              
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
      
    </div><!--  end navbar -->

</div> <!-- end menu-dropdown -->
	</header>
<!-- Menu -->


<!-- Modal thong tin ca nhan -->
<!-- Button dùng để gọi popup -->

<%if(session.getAttribute("khachHang")!=null){ %>

<%KhachHang khachHang=(KhachHang) session.getAttribute("khachHang");

%>

<!-- popup -->
<div id="myModalAbout" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Thông tin về bạn</h4>
      </div>
      <div class="modal-body">
        <p style="text-align:center">Tên tài khoản: <%=khachHang.getTenTaiKhoan() %></p>
        <p style="text-align:center">Tên khách hàng: <%=khachHang.getTenKhachHang()%></p>
        <p style="text-align:center">Số điện thoại: <%=khachHang.getSdt()%></p>
        <p style="text-align:center">Số tài khoản: <%=khachHang.getSoTaiKhoan() %></p>
        <p style="text-align:center">Địa chỉ email: <%=khachHang.getEmail()%></p>
        <p style="text-align:center">Địa chỉ: <%=khachHang.getDiaChi()%></p>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<%} %>
<!-- Modal đổi mật khẩu  -->
				  <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog modal-lg">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <center><h3 class="modal-title">Đổi mật khẩu</h3></center>
				        </div>
				        <div class="modal-body">
				        <center>  <p>Hãy thường xuyên đổi mật khẩu của bạn để tăng tính bảo mật cho tài khoản:</p></center>
				          <form class="form-horizontal" action="DoiMatKhau" method="get">
				            <div class="form-group">
				              <label class="control-label col-sm-2" for="email">Mật khẩu cũ:</label>
				              <div class="col-sm-8">
				                <input type="password" class="form-control" id="oldpass" name="pass" placeholder="Nhập mật khẩu cũ của bạn...">
				              </div>
				            </div>
				            <div class="form-group">
				              <label class="control-label col-sm-2" for="pwd">Mật khẩu mới:</label>
				              <div class="col-sm-8"> 
				                <input type="password" class="form-control" id="pwd" name="newpass" placeholder="Nhập mật khẩu mới của bạn...">
				              </div>
				            </div>
				             <div class="form-group">
				              <label class="control-label col-sm-2" for="pwd" >Nhập lại mật khẩu mới:</label>
				              <div class="col-sm-8"> 
				                <input type="password" class="form-control" id="repwd" name="renewpass" onkeydown="" placeholder="Nhập lại mật khẩu mới...">
				              </div><br><br>
				           <center>   <p id="error"></p></center>
				            </div>
				           
				            <div class="form-group"> 
				              <div class="col-sm-offset-2 col-sm-8">
				                <center><button type="submit" class="btn btn-success" onclick="validateForm()">Đổi mật khẩu</button></center>
				              </div>
				            </div>
				          </form>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-danger" data-dismiss="modal">Hủy</button>
				        </div>
				      </div>
				    </div>
				  </div>
  	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer -->
    <p id="back-top">
        <a href="#top" title="Về Đầu Trang"><span></span></a>
    </p>
    <!-- GA -->
    <script>
        // initialize and setup facebook js sdk
        window.fbAsyncInit = function() {
            FB.init({
              appId      : '1310519029034534',
              xfbml      : true
          });
            FB.getLoginStatus(function(response) {
              if (response.status === 'connected') {
                document.getElementById('status').innerHTML = 'We are connected.';
                document.getElementById('login').style.visibility = 'hidden';
            } else if (response.status === 'not_authorized') {
                document.getElementById('status').innerHTML = 'We are not logged in.'
            } else {
                document.getElementById('status').innerHTML = 'You are not logged into Facebook.';
            }
        });
        };
        (function(d, s, id){
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {return;}
            js = d.createElement(s); js.id = id;
            js.src="http://connect.facebook.net/en_US/all.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
        
        // login with facebook with extra permissions
        function login() {
          FB.login(function(response) {
            if (response.status === 'connected') {
                document.getElementById('status').innerHTML = 'We are connected.';
                document.getElementById('login').style.visibility = 'hidden';
            } else if (response.status === 'not_authorized') {
                document.getElementById('status').innerHTML = 'We are not logged in.'
            } else {
                document.getElementById('status').innerHTML = 'You are not logged into Facebook.';
            }
        }, {scope: ''});
      }

        // getting basic user info
        
    </script>


    <script>
        (function(i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function() {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://cdn3.tgdd.vn/v2015/Scripts/analytics.js', 'ga');
        ga('create', 'UA-918185-25', 'auto', {
            'siteSpeedSampleRate': 10
        });
        window.onload = function() {
            ga('send', 'pageview');
        };
            //<!--#region TGDD TRACKING -->
            //<!--#endregion -->
        </script>
        <script type="text/javascript">
            setTimeout(function() {
                var a = document.createElement("script");
                var b = document.getElementsByTagName("script")[0];
                a.src = document.location.protocol + "//script.crazyegg.com/pages/scripts/0017/3880.js?" + Math.floor(new Date().getTime() / 3600000);
                a.async = true;
                a.type = "text/javascript";
                b.parentNode.insertBefore(a, b)
            }, 1);
        </script>
        <!-- END GA-->

        <script type="text/javascript">
            var _pTagTitle = '';
            var _iPageIndex = 0;
            var _iTotal = 13007;
        </script>
        <script defer="defer" async="async" src="https://cdn.tgdd.vn/hoi-dap/Scripts/desktop/homebundle.min.v201703041108.js"></script>
	<!-- script menu -->
	
    </body>

    </html>