<%@page import="dao.KhachHangDao"%>
<%@page import="model.KhachHang"%>
<%@page import="model.ChiTietDonHang"%>
<%@page import="dao.ChiTietDonHangDAO"%>
<%@page import="model.ConnectionDB"%>
<%@page import="java.util.Map"%>
<%@page import="model.SanPham"%>
<%@page import="model.ThongTinDienThoai"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>

<title>Hỏi đáp về sản phẩm và dịch vụ tại Shopphone	</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/datcauhoi2.css">
<link href="https://fonts.googleapis.com/css?family=Baloo+Bhaina"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet"
	href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="lib/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="src/bootstrap-wysihtml5.css" />
    <script src="lib/js/wysihtml5-0.3.0.js"></script>
    <script src="lib/js/jquery-1.7.2.min.js"></script>
    <script src="lib/js/bootstrap.min.js"></script>
    <script src="src/bootstrap3-wysihtml5.js"></script>

   <style type="text/css" media="screen">
        .btn.jumbo {
            font-size: 20px;
            font-weight: normal;
            padding: 14px 24px;
            margin-right: 10px;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
        }
    </style> 
<!-- Menu -->
<link href="cssmenu/css/bootstrap.css" rel="stylesheet" />
<link href="cssmenu/css/pe-icon-7-stroke.css" rel="stylesheet" />
<link href="cssmenu/css/ct-navbar.css" rel="stylesheet" />
<!-- Menu -->




<script type="" src="bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
function finish(){
	alert("Bạn Đã Gửi Câu Hỏi Thành Công")
}
function submit() {
	document.getElementById("loai").submit();
	
}

</script>
// $('#text').blur(function(event) {
	// 	/* Act on the event */

	// 	var value = $(this).val(); // lay gia tri
	// 	$('#res').html(value);
	// });
</head>

<body>
<%ServletContext context=getServletContext();
	context.setAttribute("url","index.jsp" );
%>
<%! public String kiemTra(String data){
	if(data == null){
		data ="";
	}
	return data;
}
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
<%if(session.getAttribute("danhsachtatcasanpham")==null) {
	session.setAttribute("danhsachtatcasanpham", ConnectionDB.danhSachTatCaSanPham());
}
%>

<%if(session.getAttribute("danhSachChiTietDonHang")==null){
	Map<String,ChiTietDonHang> danhSachChiTietDonHang= ChiTietDonHangDAO.danhSachTatCaChiTietDonHang();
	session.setAttribute("danhSachChiTietDonHang", danhSachChiTietDonHang);
}%>
<!-- Menu -->
	<jsp:include page="menu.jsp"></jsp:include>
<!-- Menu -->
	<section>


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



		<div class="khung1">
			<div class="row">

				<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
					<div class="search">
						<form action="XuLych" method="get"
							onsubmit="" class="wrap_search">
							<input id="txtKeysearch" name="search" type="text"
								placeholder=" Tìm câu hỏi,hướng dẫn " autocomplete="on"
								onkeydown="CheckTimerFAQ()"
								onkeyup="suggestionSearchFAQ(event);" maxlength="250"> <i
								class="iconask-search"></i>
							<button type="submit">Tìm kiếm</button>
							<div id="suggestionFaq"></div>
					</div>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
					<div class="postask">
						<div class="titlepostask">
							<a href=""> <strong>Đặt câu hỏi</strong>
							</a>

						</div>
					</div>

				</div>
			</div>
			<!-- . datcauhoi {
    width: 100%;
    height: 116px;
    line-height: 116px;
    padding: 0;
    text-align: center;
    font-size: 18px;
    font-weight: bold;
    color: #fff;
    border: 1px solid #f0f0f0;
    background: #c91212;
} -->
			</form>
		</div>
		</div>
		</div>


		<aside class="leftask">

			<div class="colcenterask">
				<div class="filview">
					<a id="tagNew" href="Xulyhd" name ="action" value="roi" class=c urrent>Mới nhất</a> <span>|</span>
					<a id="tagNoAnswer" name ="action" value="chua" href="Xulyhd">Câu hỏi chưa
						được trả lời</a>
				</div>
				<div class="row">
					<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
						<p>Đăng nhập nhanh bằng:</p>
						<div class="articles-details-header-social">
							<div class="articles-details-facebook">
								<a
									href="https://www.facebook.com/dialog/share?app_id=790887897625172&amp;display=page&amp;href=http%3A%2F%2Fchirayu.im%2Fpost%2FSocial-website-login-for-your-site-is-Open-source-standards-for-authorization-5&amp;redirect_uri=http%3A%2F%2Fchirayu.im%2Fpost%2FSocial-website-login-for-your-site-is-Open-source-standards-for-authorization-5"
									title="share it"><i class="fa fa-facebook"></i>	Facebook</a>
							</div>
							<div class="articles-details-gplus">
								<a
									href="https://plus.google.com/share?url=http%3A%2F%2Fchirayu.im%2Fpost%2FSocial-website-login-for-your-site-is-Open-source-standards-for-authorization-5"
									title="share it"><i class="fa fa-google-plus"></i> Google+</a>
							</div>
						</div>

					</div>
					<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-center">
						<div class="chuGiua">Hay</div>
					</div>
						<form action="XuLych" method ="get">
						<% 
						String name =(String) session.getAttribute("name");
						String sdt =(String) session.getAttribute("sdt");
						String email =(String) session.getAttribute("email");
						
						name = kiemTra(name);
						sdt = kiemTra(sdt);
						email = kiemTra(email);
						%>
					<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<input type="text" placeholder="Ho Và Tên" value="<%= name %>" name ="ten" required="required"
									class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<!-- end row 1 -->
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">


								<input type="number" placeholder="Số Điện Thoại"   name ="sdt"
									required="required" value="<%= sdt %>"  class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<!-- end row 2 -->
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">


								<input type="text" placeholder="Email"  value="<%= email %>"    name = "email" required="required"
									class="form-control col-md-7 col-xs-12">
							</div>
						</div>
					</div>
					<!-- end row 3 -->
				</div>
				<!-- end row 1 -->

				<div class="row ">
					<div class="col-sm-12  text-center">
						<div class="titlenoidung">
							<h1>Nội Dung Câu Hỏi</h1>
						</div>
					</div>
				</div>
				<div class="noidungcauhoi">
					<div class="row">
						<div class="form-group">
							<label  class="col-sm-3 "> Chọn Sản Phẩm</label>
							<% 
						ArrayList<String> dsLoai =(ArrayList) session.getAttribute("dsLoai");
						ArrayList<ThongTinDienThoai> dsSP =(ArrayList) session.getAttribute("dsSP");
						ArrayList<ThongTinDienThoai> dsSPHoiNhieu = (ArrayList) session.getAttribute("dsSanPham");									
											%>
										
							<div class="col-sm-9 ">
								<form action="XuLych" method="get" id ="loai">
								<select class="select2_group form-control" name="loaisp"  onchange="submit();">
									<optgroup name="loai"  label= "Loại Sản Phẩm" >
									<%
								ThongTinDienThoai  spChon =(ThongTinDienThoai) session.getAttribute("SPChon");
								%>
									<% if(spChon !=null){
											%>
											<option   value="<%= spChon.getMaSP() %>" ><%= spChon.getTen() %></option>
										<% }%>
									<%
									for(String loai : dsLoai) {
											%>
										 <option  value="<%=loai %>" ><%=loai %></option> 
												<%} %>
									</optgroup>
										</form>
										<optgroup name="loai"  label= "Sản Phẩm" >
									<% 
									if(dsSP != null){
									for(ThongTinDienThoai sp : dsSP) {
											%>
										<option   value="<%= sp.getMaSP()%>"><%= sp.getTen() %></option>
												<%} 
												}%>
									</optgroup>
								</select>
							</div>

						</div>
					</div>
					
					<div class="tencauhoi">
					<div class="row">
						<div class="form-group">
							<label  class="col-sm-3 ">Tên Câu Hỏi</label>
							<div class="col-sm-9 ">
										<input type="text" 	class="form-control col-md-7 col-xs-12"  value="" placeholder="Tên Câu Hỏi Của Bạn" required="required"  name="tench">
							</div>
					<!-- end row -->
				</div>
				</div>
					</div>
		<br>
			<div class="cauhoi">
					
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<h4 class="header green clearfix">Nội Dung Câu Hỏi Của Bạn
								</h4>
								<div class="hero-unit" style="margin-top: 40px">
									<input type="hidden" value="" id="input" name="test">
									
									<hr />
									<textarea class="textarea form-control" id="some-textarea"
										placeholder="Enter text ..."
										style="width: 810px; height: 200px"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="ln_solid"></div>
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
							<button type="reset" class="btn btn-primary">Làm Mới</button>
							<button type="submit" class="btn btn-success" onclick="finish();">Gửi</button>
							</form>
						</div>
		</aside>

		<div class="colleftask">
			<div class="asklot">
				<strong>Sản phẩm được hỏi nhiều</strong>
				<ul>
				<% for(ThongTinDienThoai sp: dsSPHoiNhieu){
					%>
				
					<li><a href="thongtinsanpham.jsp?maSP=<%= sp.getMaSP() %>" class="linkimg">
							<img width="50" height="55"
							src="<%= sp.getHinhAnh() %>"
							alt="">
					</a> <a href="thongtinsanpham.jsp?maSP=<%= sp.getMaSP() %>" class="linktitle">
							<h3>OPPO F1s</h3>
					</a> <a href="thongtinsanpham.jsp?maSP=<%= sp.getMaSP() %>" class="link">550
							câu hỏi</a> <a href="thongtinsanpham.jsp?maSP=<%= sp.getMaSP() %>"
						class="link"> <label>•</label> 44 hướng dẫn
					</a> <a href="thongtinsanpham.jsp?maSP=<%= sp.getMaSP() %>" class="link"> <label>•</label>
							10 mẹo hay
					</a></li>
					<%} %>
				</ul>
				<div class="clr"></div>
				<div class="searchtopPro">
					<i class="iconask-mbs"></i>
							<form action="XuLych" method="get"
						onsubmit="return submitSearchFormProduct();" class="sprod">
						<i class="iconask-search pos"></i> <input id="search-Product"
							name="" type="text" placeholder="Sản phẩm cần tìm"
							autocomplete="off" onkeydown="CheckTimerPro()"
							onkeyup="searchProduct(event);" maxlength="50">
					</form>
					<div id="SuggestSearchProduct"></div>
				</div>
				<div class="clr"></div>
			</div>



		</div>
		<script type="text/javascript">
        var _iPageSubj = 0;
        var _iTotalSubj = 10;
    </script>

		</div>


	</section>


	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer -->
	<p id="back-top">
		<a href="#top" title="Về Đầu Trang"><span></span></a>
	</p>
	<!-- GA -->
<script>

   $('#some-textarea').wysihtml5({
    "events": {
        "load": function() { 
            console.log("Loaded!");
        },
        "blur": function() { 
          var value = $('#some-textarea').val();
          // $('#res').val("gia tri khác");
          $('#input').val(value);
        }
       
    }

});
  

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
	<script defer="defer" async="async"
		src="https://cdn.tgdd.vn/hoi-dap/Scripts/desktop/homebundle.min.v201703041108.js"></script>
	<script type="text/javascript">
	
	
	</script>
</body>

</html>