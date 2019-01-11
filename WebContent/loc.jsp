<%@page import="dao.PhanTrangDao"%>
<%@page import="dao.LocSanPhamDao"%>
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
<title>Shopphone smartphone chính hãng</title>

<link rel="stylesheet" type="text/css" href="Boot/css/bootstrap.min.css">
<link rel="stylesheet" href="build.css">

<link rel="stylesheet" type="text/css" href="css/style.css">

<!-- Menu -->
 	<link href="cssmenu/css/bootstrap.css" rel="stylesheet" />

    <link href="cssmenu/css/pe-icon-7-stroke.css" rel="stylesheet" />
	<link href="cssmenu/css/ct-navbar.css" rel="stylesheet" />  
<!-- Menu -->
<%
	session.setAttribute("url","index.jsp" );
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

<%if(session.getAttribute("gioHang")==null){
		ArrayList<SanPham> danhSachSanPham=new ArrayList<SanPham>();
		session.setAttribute("gioHang", danhSachSanPham);
	}%>
<%ArrayList<SanPham> danhSachSanPhamCoTrongGioHang=(ArrayList<SanPham>)session.getAttribute("gioHang"); %>
<%if(session.getAttribute("danhSachKhachHang")==null){
		Map<String,KhachHang> danhSachKhachHang=KhachHangDao.dsKhachHang();
		session.setAttribute("danhSachKhachHang", danhSachKhachHang);
	}
%>
<%System.out.print((Map<String,KhachHang>)session.getAttribute("danhSachKhachHang")) ;%>
<%if(session.getAttribute("danhsachtatcasanpham")==null) {
	session.setAttribute("danhsachtatcasanpham", ConnectionDB.danhSachTatCaSanPham());
}
%>

<%if(session.getAttribute("danhSachChiTietDonHang")==null){
	Map<String,ChiTietDonHang> danhSachChiTietDonHang= ChiTietDonHangDAO.danhSachTatCaChiTietDonHang();
	session.setAttribute("danhSachChiTietDonHang", danhSachChiTietDonHang);
}%>
  <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  	 <script type="text/javascript">
        var query = {
            Category : 42,
            Manufacture : 0,
            PriceRange : 0,
            Feature : 0,
            Property: 0,
            OrderBy : 0,
            PageSize : 30,
            PageIndex : 0,
            Others: '',
            ClearCache : 0
        };
        var advanceQuery = {
            Category : 42,
            Manufacture : '',
            PriceRange : 0,
            Feature : '',
            Property: '',
            OrderBy : 0,
            PageSize : 28,
            PageIndex : 0,
            Count : 0,
            Others: '',
            ClearCache : 0
        };
    </script>
        <script defer="defer" async="async"  src="https://cdn4.tgdd.vn/v2015/Scripts/desktop/V4/category.min.v201702270230.js"></script>
    <script>
        //<!--#region GA -->
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://cdn3.tgdd.vn/v2015/Scripts/analytics.js', 'ga');
        ga('create', 'UA-918185-25', 'auto', { 'siteSpeedSampleRate': 10 });
        //<!--#endregion -->

        
        window.onload = function(){
            ga('send', 'pageview');
            //<!-- #regionGoogle Tag Manager -->
            setTimeout(
                function () {
                    (function (w, d, s, l, i) {
                        w[l] = w[l] || []; w[l].push({
                            'gtm.start':
                            new Date().getTime(), event: 'gtm.js'
                        }); var f = d.getElementsByTagName(s)[0],
                        j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
                        '//www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
                    })(window, document, 'script', 'dataLayer', 'GTM-WKQZL8');
                }
            , 3000);
            //<!--#endregion -->
        };
        
                //<!--#region TGDD TRACKING -->
        var mysessionid = 'xi11r0mg0jjepnzbjaugragl';
        var g_version = '201704111113';
        var tgddctr_urlroot = '//www.thegioididong.com/tracking';
        //<!--#endregion -->
        var rooturl = '.thegioididong.com';
        var isMobile = false;
    </script>
    <style type="text/css">
    .canle{
    margin-top: 20px;
     
    }
    .canles{
    margin-top: 12px;
    padding-right: 40px;
    }
    .btn-block{
    width: 100px;
    height: 38px;
    }
    </style>
</head>
<body>
	<section>
	
		<ul class="filter">
				<li class="fmanu">
				<a href="XuLyLoc?chon=iphone">iPhone (Apple)</a> 
				<a href="XuLyLoc?chon=samsung">Samsung</a>
				<a href="XuLyLoc?chon=oppo">Oppo</a> 
				</li>

			<li class="frange">
				<a href="XuLyLoc?chongia=1000000&chongia1=3000000" data-id="">Từ 1-3 triệu</a> 
				<a href="XuLyLoc?chongia=3000000&chongia1=8000000" data-id="">Từ 3 - 8 triệu</a>
				<a href="XuLyLoc?chongia=8000000&chongia1=10000000" data-id="">Từ 8 - 10 triệu</a>
				<a href="XuLyLoc?chongia=10000000&chongia1=20000000" data-id="">Trên 10 triệu</a>
				
				
					<p class="doit"></p>
					<p class="cslder">
						<span class="cswrap"> <span class="csdot"></span> <span
							class="csdot"></span> <span class="csdot"></span>
						</span>
					</p>
				</div></li>

			<!--#region Tính năng-->
			<li><span class="criteria">Tính năng </span>
				<div class="feature">
					<form action="XuLyLoc?xuly=xulyloc2" method="post">
					<aside class="rowfeature">
					
					<aside class="property">
					<strong>Camera</strong> 
					 <label data-id=""> <input type="radio" name="cmrs" value="=5">  5 MP
					 
					</label> <label data-id=""> <input type="radio" name="cmrs"  value="=8"> 8 MP
					 
					</label> <label data-id=""> <input type="radio"  name="cmrs" value="=12"> 12 MP
					 
					</label> <label data-id=""> <input type="radio" name="cmrs" value=">12" > Tr&#234;n 12 MP
					 
					</label> 
					</aside>
					
					
					<aside class="property"> <strong>Selfie</strong>
					 <label data-id=""><input type="radio" name="cmrt"  value="=5"> 5 MB</label> 
					 <label data-id=""><input type="radio" name="cmrt" value="=7"> 7 MB</label> 
					 <label data-id=""><input type="radio" name="cmrt" value="=8"> 8 MB</label> 
					 <label data-id=""><input type="radio" name="cmrt" value=">12"> Trên 12 MB</label> 
					</aside>
					</aside>
					
					<aside class="rowfeature">
					<aside class="property"> <strong>Bộ nhớ trong</strong>
					 <label data-id=""><input type="radio" name="bnt" value="=8"> 8 GB</label> 
					 <label data-id=""><input type="radio" name="bnt" value="=16" > 16 GB</label> 
					 <label data-id=""><input type="radio" name="bnt" value="=32"> 32 GB</label> 
					 <label data-id=""><input type="radio" name="bnt" value=">64"> Trên 64 GB</label> 
					</aside>
					
					 <aside class="yesno"> <strong>Tính năng đặc biệt</strong>
					<label data-id=""> 
					 <label data-id=""> <input type="checkbox" name="dungluongpin" value=">3000">Pin khủng (&gt;3000 mAh)</label> 
					</aside>
					
					</aside>
					<aside class="centers">
					<button class="btn btn-primary" type="submit">Xem kết quả</button>
					</aside>
					</form>
					
				</div>
				</li>
				
				
				
				
				<li><span class="criteria">Lọc nâng cao</span>
				<div class="feature">
					<form action="XuLyLoc?xuly=xulyloc1" method="post">
					<aside class="rowfeature">
					
					<aside class="property">
					<strong>Tên điện thoại</strong> 
					 <label data-id=""> <input type="radio" name="tendt" value="iphone" >Iphone</label>
					 <label data-id=""> <input type="radio" name="tendt" value="samsung" checked="checked">Samsung</label> 
					<label data-id=""> <input type="radio" name="tendt" value="lg">LG</label>
					<label data-id=""> <input type="radio" name="tendt" value="oppo">Oppo</label>
					<label data-id=""> <input type="radio" name="tendt" value="htc">HTC</label>
					<label data-id=""> <input type="radio" name="tendt" value="huawei">Huawei</label>
					<label data-id=""> <input type="radio" name="tendt" value="sony">Sony</label>
					</aside>
					
					<aside class="property"> <strong>Giá</strong>
					 <label data-id=""><input type="radio" name="giadt" value="1den3" >Từ 1-3 triệu</label> 
					 <label data-id=""><input type="radio" name="giadt" value="3den8" >Từ 3-8 triệu</label>
					 <label data-id=""><input type="radio" name="giadt" value="8den10" >Từ 8-10 triệu</label>
					 <label data-id=""><input type="radio" name="giadt" value="10den20" >Trên 10 triệu</label>
					</aside>
					</aside>
					
					
					
					<aside class="rowfeature">
					<aside class="property"> <strong>Camera</strong>
					 <label data-id=""><input type="radio" name="camera" value="5" >5 MB</label>
					 <label data-id=""><input type="radio" name="camera" value="8" >8 MB</label>
					 <label data-id=""><input type="radio" name="camera" value="12" >12 MB</label>
					 <label data-id=""><input type="radio" name="camera" value="13" >Trên 12 MB</label>
					</aside>
					
					<aside class="property"> <strong>Selfie</strong>
					 <label data-id=""><input type="radio" name="selfie" value="5" >5 MB</label> 
					 <label data-id=""><input type="radio" name="selfie" value="7" >7 MB</label>
					 <label data-id=""><input type="radio" name="selfie" value="8" >8 MB</label> 
					 <label data-id=""><input type="radio" name="selfie" value="13" >Trên 12 MB</label>
					</aside>
					
					</aside>
					
					<aside class="rowfeature">
					<aside class="property"> <strong>Bộ nhớ trong</strong>
					 <label data-id=""><input type="radio" name="bonhotrong" value="8">8 GB</label> 
					 <label data-id=""><input type="radio" name="bonhotrong" value="16">16 GB</label> 
					 <label data-id=""><input type="radio" name="bonhotrong" value="32">32 GB</label> 
					 <label data-id=""><input type="radio" name="bonhotrong" value="64">Trên 64 GB</label> 
					</aside>
					</aside>
					
					
					<aside class="centers">
					<button class="btn btn-primary" type="submit">Xem kết quả</button>
					</aside>
					</form>
					
				</div>
				</li>
				
			<!--#endregion-->
			<li><span class="criteria">Sắp xếp </span>
				<div class="sortprice">
					<label data-id=""><a href="XuLyLoc?locgia=caodenthap">Giá cao đến thấp</a></label> 
					<label data-id=""><a href="XuLyLoc?locgia=thapdencao">Giá thấp đến cao</a></label>
					<p class="doit"></p>
				</div></li>
				<li style="float:right"><span class="criteria">Mạng xã hội </span>
				<div class="sortprice" style="color:red">
				<!-- 	<button scope="public_profile,email" onlogin="checkLoginState();" style="text-decoration:none;"><span><img src="image/mangXH/face.png" alt="" width="30px" height="30px"></span> <strong style="margin-top:7px;color:red;margin-left:4px"> Facebook</strong></button>
					<br> -->
					 <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
					</fb:login-button> 
					<br>
					<p id="status"></p>
					<!-- <a href="" style="text-decoration:none;"><span><img src="image/mangXH/google.png" alt="" width="30px" height="30px"></span> <strong style="margin-top:7px;color:red;margin-left:4px"> Google+</strong></a> -->
					<a style="text-decoration:none;" id="mySignin" onclick="login()"><span><img src="image/mangXH/g+.png" alt="google"  width="30px" height="30px" /></span><strong style="margin-top:7px;color:red;margin-left:4px"> Google+</strong></a>
					<p class="doit"></p>
				</div></li>
		</ul>

	<!-- Banner ---> <!-- Product -->
	 <%
	 	ArrayList<ThongTinDienThoai>array=(ArrayList)session.getAttribute("list");
		 int sizeDisplay=12;
		 int tongSoTrang=new PhanTrangDao(sizeDisplay,array.size()).totalPage();
			String className="";

	 	DecimalFormat d = new DecimalFormat("###,###,###");
	 %>
		<ul class="cate filter-cate">
			<!--#region Online Giá Rẻ-->
			<%
			for(int i=1;i<=tongSoTrang;i++){
				if(i==1){
					className="show";
				}else{
					className="hidden";
				}
				%>
				
				
				<div  class="<%=className%>" id="page<%=i%>">
				<%
				for (int j = sizeDisplay*(i-1); j < sizeDisplay*i&&j<array.size(); j++) {
			%>
			<li><a href="thongtinsanpham.jsp?maSP=<%=array.get(j).getMaSP()%>"> <img width="150"
					height="150" src="<%out.print(array.get(j).getHinhAnh());%>">
					<h3>
						<%
							out.print(array.get(j).getTen()+"");
						%>
					</h3> <strong><span class="normal">Giá:</span>
						<%
						Integer gia=Integer.parseInt(array.get(j).getGia());
							out.print(d.format(gia)+ "đ");
						%></strong> <label
					class="shockprice">Hot!!!</label>
					<div class="promotion">
						<span><b>2</b> khuyến mãi</span>
					</div> <figure class="bginfo"> <span>Màn hình:<%
	 	out.print(array.get(j).getManhinhRong()+" ''");
	 %>,<%
	 	out.print(array.get(j).getCnManHinh());
	 %></span>
					<span>HĐH:<%
						out.print(array.get(j).getHdh());
					%></span> <span>CPU:<%
	 	out.print(array.get(j).getCpu());
	 %></span>
					<span>RAM:<%
						out.print(array.get(j).getRam() +" GB");
					%>, ROM:<%
						out.print(array.get(j).getRom()+" GB");
					%></span>
					<span>Camera:<%
						out.print(array.get(j).getCamera()+" MB");
					%>,Selfie:<%
						out.print(array.get(j).getSelfie());
					%></span>
					<span>PIN:<%
						out.print(array.get(j).getPin() +" mah");
					%>, SIM:<%
						out.print(array.get(j).getSim());
					%></span>

					</figure>

			</a>
			<div class="" style="float:left">
					<center><a href="thongtinsanpham.jsp?maSP=<%=array.get(j).getMaSP()%>"><button type="button" class="btn_chitiet">Xem chi tiết</button></a></center>
				</div>
				<div class="" style="float:right;">
					<center><a href="XuLyMuaHang?maSP=<%=array.get(j).getMaSP()%>"><button type="button" class="btn_buynow">Mua ngay</button></a></center>
				</div>
				</li>
			<%
				}
			%>
			</div>
			<%
			}
			%>
		</ul>
<!-- div phan trang -->
<div class="container">
		<div class="phantrang">
			<ul class="pagination pagination-sm">
				<label style="float: left; margin-top: 3px">Chọn trang hiển
					thị:</label>
				<%
					for (int i = 1; i <= tongSoTrang; i++) {
				%>
				<li><a href="#page<%=i%>" onclick="changeClass<%=i%>()">
						<%
							out.print(i);
						%>
				</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
	
	<!-- scrip phan trang -->
	<script type="text/javascript">
	<%for (int i = 1; i <= tongSoTrang; i++) {%>
		function changeClass<%=i%>(){	
    			document.getElementById("page<%=i%>").className = "show";
				<%for (int j = 1; j <= tongSoTrang; j++) {
					if (j != i) {%>
 			   document.getElementById("page<%=j%>").className = "hidden";
		<%}
				}%>
		}
		<%}%>
</script>


		</section>
	<!-- Tag -->
<!-- Menu -->
	<jsp:include page="menu.jsp"></jsp:include>
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
				          <form class="form-horizontal" action="DoiMatKhau" method="get" onsubmit="return(doiMatKhau())">
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
	<!-- Script bắt lỗi form đổi mật khẩu -->
	<script type="text/javascript">
    <%KhachHang kh=(KhachHang)session.getAttribute("khachHang");%>
    function doiMatKhau(){
    	var pwd = document.getElementById("pwd").value;
    	var repwd = document.getElementById("repwd").value;
    	var loi="Bạn nhập mật khẩu cũ bị sai với mật khẩu hiện tại";

    	
    	if(pwd!=repwd){
    		var loi="Bạn nhập lại mật khẩu không khớp với mật khẩu đã nhập";
    		document.getElementById("loi").innerHTML=loi;
    		return false;
    	}
    	if(pwd.length < 6){
    		var loi="Mật khẩu nhập vào phải hơn 6 kí tự";
    		document.getElementById("loi").innerHTML=loi;
    		return false;
    	}
    	return true;
    }
    
    </script>
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer -->
	
	<p id="back-top">
		<a href="#top" title="Về Đầu Trang"><span></span></a>
	</p>
				<script type="text/javascript">
						function validateForm()	{
						    var pwd = document.getElementById('pwd').value;
						    var repwd = document.getElementById('repwd').value;
						  if (pwd==repwd){
								document.getElementById("error").innerHTML = "";
						  }else{
						    	document.getElementById("error").innerHTML = "<br>Mật khẩu bạn nhập không khớp nhau<br>";
						  }
						}
				</script>

	<!--#region CrazyEgg -->

	<!--#endregion -->

	<!--#region Hotjar -->

	<!--#endregion -->
	<div id="dlding">Đang xử lý, vui lòng đợi trong giây lát...</div>
	</form>
	
	<!-- script menu -->
</body>
</html>