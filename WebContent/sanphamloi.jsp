<%@page import="dao.ChiTietDonHangDAO"%>
<%@page import="model.ChiTietDonHang"%>
<%@page import="model.ConnectionDB"%>
<%@page import="dao.KhachHangDao"%>
<%@page import="model.KhachHang"%>
<%@page import="java.util.Map"%>
<%@page import="model.SanPham"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Lỗi tìm sản phẩm</title>

<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />

<link rel="stylesheet" type="text/css" href="Boot/css/bootstrap.min.css">
<link rel="stylesheet" href="build.css">

<link rel="stylesheet" type="text/css" href="css/style.css">

<!-- Menu -->
 	<link href="cssmenu/css/bootstrap.css" rel="stylesheet" />

    <link href="cssmenu/css/pe-icon-7-stroke.css" rel="stylesheet" />
	<link href="cssmenu/css/ct-navbar.css" rel="stylesheet" />  
<!-- Menu -->
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
	<section>
	<!-- Banner ---> <!-- Product -->
	</section>

	<!-- Tag -->
<br><br><br>
<!-- Menu -->
	<jsp:include page="menu.jsp"></jsp:include>
<!-- Menu -->

<center><h2 style="color: #BDBDBD">Rất tiết sản phẩm bạn tìm chưa được Shopphone cập nhật <span class="glyphicon glyphicon-alert"></span></h2></center>
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

	<script type="text/javascript">
		var query = {
			Category : 42,
			Manufacture : 80,
			PriceRange : 0,
			Feature : 0,
			Property : 0,
			OrderBy : 0,
			PageSize : 20,
			PageIndex : 0,
			Others : '',
			ClearCache : 0
		};
		var advanceQuery = {
			Category : 42,
			Manufacture : '80',
			PriceRange : 0,
			Feature : '',
			Property : '',
			OrderBy : 0,
			PageSize : 28,
			PageIndex : 0,
			Count : 0,
			Others : '',
			ClearCache : 0
		};
	</script>
	<script defer="defer" async="async"
		src="https://cdn4.tgdd.vn/v2015/Scripts/desktop/V4/category.min.v201702270230.js"></script>
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'https://cdn3.tgdd.vn/v2015/Scripts/analytics.js', 'ga');
		ga('create', 'UA-918185-25', 'auto', {
			'siteSpeedSampleRate' : 10
		});
		//<!--#endregion -->
		window.onload = function() {
			ga('send', 'pageview');
			//<!-- #regionGoogle Tag Manager -->
			setTimeout(function() {
				(function(w, d, s, l, i) {
					w[l] = w[l] || [];
					w[l].push({
						'gtm.start' : new Date().getTime(),
						event : 'gtm.js'
					});
					var f = d.getElementsByTagName(s)[0], j = d
							.createElement(s), dl = l != 'dataLayer' ? '&l='
							+ l : '';
					j.async = true;
					j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
					f.parentNode.insertBefore(j, f);
				})(window, document, 'script', 'dataLayer', 'GTM-WKQZL8')
			}, 10000);
			//<!--#endregion -->
		};
		//<!--#region TGDD TRACKING -->
		var mysessionid = '4d5q4a0fqzmkqhrvfk3n1z2p';
		var g_version = '201703181022';
		var tgddctr_urlroot = '//www.thegioididong.com/tracking';
		//<!--#endregion -->
		var rooturl = '.thegioididong.com';
		var isMobile = false;
	</script>

	<!--#region CrazyEgg -->

	<!--#endregion -->

	<!--#region Hotjar -->

	<!--#endregion -->
	<div id="dlding">Đang xử lý, vui lòng đợi trong giây lát...</div>
	</form>
	

</body>
</html>