<%@page import="model.ChiTietDonHang"%>
<%@page import="dao.ChiTietDonHangDAO"%>
<%@page import="model.ConnectionDB"%>
<%@page import="model.KhachHang"%>
<%@page import="dao.KhachHangDao"%>
<%@page import="java.util.Map"%>
<%@page import="model.SanPham"%>
<%@page import="model.ThongTinDienThoai"%>
<%@page import="model.CauHoi"%>
<%@page import="model.CauTraLoi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.ConnectionDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%
ArrayList<CauTraLoi> dsTraLoi =(ArrayList) session.getAttribute("dstraloi");
ArrayList<CauHoi> dsCauHoiQuanTam = (ArrayList<CauHoi>) session.getAttribute("dsCauHoiQuanTam1");
ArrayList<ThongTinDienThoai> dsSanPham= (ArrayList<ThongTinDienThoai>) session.getAttribute("dsSanPham1");
ArrayList<ThongTinDienThoai> dsSPLienQuan = (ArrayList<ThongTinDienThoai>) session.getAttribute("dsSanPhamLienQuan");
String tieude = (String) request.getAttribute("tieude");
%>
<title>Hỏi Đáp Chi Tiết </title>
<link rel="stylesheet" type="text/css" href="css/hoidapchitiet.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
	 <link href="https://fonts.googleapis.com/css?family=Baloo+Bhaina" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">   
	<link rel="stylesheet" type="text/css" href="css/style.css">
	
	<!-- Menu -->
 	<link href="cssmenu/css/bootstrap.css" rel="stylesheet" />

    <link href="cssmenu/css/pe-icon-7-stroke.css" rel="stylesheet" />
	<link href="cssmenu/css/ct-navbar.css" rel="stylesheet" />  
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Menu -->
	
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
<%-- <%System.out.print((Map<String,KhachHang>)session.getAttribute("danhSachKhachHang")) ;%> --%>
<%if(session.getAttribute("danhsachtatcasanpham")==null) {
	session.setAttribute("danhsachtatcasanpham", ConnectionDB.danhSachTatCaSanPham());
}
%>

<%if(session.getAttribute("danhSachChiTietDonHang")==null){
	Map<String,ChiTietDonHang> danhSachChiTietDonHang= ChiTietDonHangDAO.danhSachTatCaChiTietDonHang();
	session.setAttribute("danhSachChiTietDonHang", danhSachChiTietDonHang);
}%>
<br>
<br>
<br>
	<div id="fb-root"></div>
	

	<section>
		<div class="userask">
			<div class="nolog"></div>
			<div class="userlogin" style="display: none;">
				<input id="txtUserName" name="txtUserName" type="text"
					placeholder="Nhập email hoặc số điện thoại"> <input
					id="txtPassword" name="txtPassword" type="password"
					placeholder="Nhập mật khẩu">
				<button type="submit" onclick="login();">Đăng nhập</button>
			</div>
		</div>
		<div class="clr"></div>
		<aside class="leftask">
			<form action="XuLych" method="get"
				onsubmit="" class="wrap_search">
				<input id="txtKeysearch" name="search" type="text"
					placeholder="Tìm hướng dẫn, mẹo hay, câu hỏi" autocomplete="on"
					onkeydown="CheckTimerFAQ()" onkeyup="suggestionSearchFAQ(event);"
					maxlength="250"> <i class="iconask-search"></i>
				<button type="submit">Tìm kiếm</button>
				<div id="suggestionFaq"></div>
			</form>
			<div class="clr"></div>
			<div class="colleftask">
				<div class="asklot">
					<strong>Sản phẩm liên quan</strong>
					<ul>
					
					<% 
					for(int i =0;i < 5; i++){
						%>
				
						<li><a href="thongtinsanpham.jsp?maSP=<%= dsSPLienQuan.get(i).getMaSP() %>"
							class="linkimg"> <img width="50" height="55"
								src="<%=dsSPLienQuan.get(i).getHinhAnh()%>"
								alt="">
						</a> <a href="thongtinsanpham.jsp?maSP=<%= dsSPLienQuan.get(i).getMaSP()%>" class="linktitle">
								<h3><%=dsSPLienQuan.get(i).getTen() %></h3>
								<!--gui ma san pham va action huong dan qua xu ly , dat ten la f thoi -->
						</a> <a href="#" class="link">143
								câu hỏi</a> <a href="#"
							
							class="link">• 19 hướng dẫn</a> <a
							href="#" class="link">•
								12 mẹo hay</a></li>
								<%} %>
						<li><i class="iconask-mbs"></i>
							<form action="/Xulyhd" method="get"
								onsubmit="return submitSearchFormProduct();" class="sprod">
								<i class="iconask-search pos"></i> 
								<input id="search-Product"
									name="search" type="text" placeholder="Sản phẩm cần tìm"
									autocomplete="off" onkeydown="CheckTimerPro()"
									onkeyup="searchProduct(event);">
							</form>
							<div id="SuggestSearchProduct"></div></li>
					</ul>
					<div class="clr"></div>
				</div>

<%CauHoi ch = (CauHoi) session.getAttribute("cauhoi");%>
			</div>
			<aritcle class="article">
			<h1><%= ch.getTenCauHoi() %></h1>
			<div class="userpost">

				<b><%= ch.getNguoiDang()%></b> <span>đăng ngày <%= ch.getNgayDang() %></span> <span>• 82 thảo
					luận</span> <span>• 36.542 lượt xem</span>
			</div>
			<div class="divContent">
				<h2>
					<strong>
						<%= ch.getNoiDung() %></strong>
				</h2>
				<p>
				
					<br> <b>Hướng dẫn tham khảo </b>
				</p>
		
			
				 <div class="gallery">
				 
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
<!--     Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
         <li data-target="#myCarousel" data-slide-to="4"></li>
           <li data-target="#myCarousel" data-slide-to="5"></li>
             <li data-target="#myCarousel" data-slide-to="6"></li>
               <li data-target="#myCarousel" data-slide-to="7"></li>
                 <li data-target="#myCarousel" data-slide-to="8"></li>
                   <li data-target="#myCarousel" data-slide-to="9"></li>
                     <li data-target="#myCarousel" data-slide-to="10"></li>
                     
    </ol>

<!--     Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
       <p class="pCaption">Cách Làm</p>
        <img class="lazy" src="image/HoiDap/che-do-don-gian-oppo-a37-1 (1).jpg"   alt="Los Angeles"  style="width:90%;height: 100%;" >
      </div>
 <% 
					for(CauTraLoi traloi: dsTraLoi){
					%> 
      <div class="item">
       <p class="pCaption"><%= traloi.getNoidung() %></p>
        <img class="lazy" src="<%= traloi.getHinhanh() %>" alt="Chicago"   style="width:90%;height: 100%;" >
      </div>
      <% } %> 
    </div>

<!--     Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button"  data-slide="prev">
<span class="glyphicons glyphicons-chevron-left"></span>
<span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
     <span class="glyphicons glyphicons-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div> 
  </div>
  <!-- Left and right controls -->
</div>
				</div>
				
				<p class="iframe1" style="text-align: center;">
					<iframe width="560" height="315"
						src="https://www.youtube.com/embed/FN7ALfpGxiI" frameborder="0"
						allowfullscreen></iframe>
				</p>
				<p class="iframe1">
					<strong>​</strong>
				<p> 
			</div>


			<div class="askrelate">
				<label>Câu hỏi hướng dẫn có liên quan</label> <a
					href="#">•
					Hướng dẫn khởi động lại iPhone, iPad m&#224; kh&#244;ng cần đến
					ph&#237;m nguồn </a> <a
					href="#">•
					C&#225;ch chuyển file từ Laptop (PC) sang iPhone, iPad kh&#244;ng
					cần d&#249;ng c&#225;p </a> <a
					href="#">•
					Sửa lỗi Safari tự động tho&#225;t tr&#234;n iPhone, Macbook </a>
			</div>
		
					
				<div class="infocomment">
					<div class="comment_ask" id="17528193">
						<i class="iconcom-user">C</i><strong onclick="selCmt(17528193)">Chinh</strong>
						<div class="infocom_ask ">anh oi 3d touch cua em mat rung
							lieu co duoc doi may moi khong</div>
						<div class="relate_infocom" data-cl="0">
							<span class="reply" onclick="cmtaddreplyclick(17528193)">Trả
								lời </span><b class="dot">●</b> <span class="numlike"> <i
								class="iconcom-like"></i> <span class="like"
								onclick="likeCmt(17528193);"> Thích</span>
							</span><spanclass"date"><b class="dot">●</b> 40 phút trước</span></div>
					</div>
					<div class="comment_reply" id="r17528193">
						<i class="arrow_box"></i>
						<div class="comment_ask " id="17529356" data-parent="17528193">
							<i class="iconcom-user">TT</i><strong onclick="selCmt(17529356)">Trần
								Thanh Tuấn</strong><b class="qtv">MOD</b>
							<div class="infocom_ask">
								<div class="conticon">
									<div class="content">Mất rung là sao bạn. Bạn mang ra
										siêu thị để bên mình kiểm tra lại nhé.</div>
									<div class="relate_infocom" data-cl="0">
										<span class="btnreply"
											onclick="cmtChildAddReplyClick(17529356,17528193)">Trả
											lời </span><b class="dot">●</b> <span class="numlike"><i
											class="iconcom-like"></i><span class="like"
											onclick="likeCmt(17529356);"> Thích</span> </span><span
											class=&quot;date&quot;><b class="dot">●</b> 2 giây
											trước</span>
									</div>
								</div>
							</div>
							<div class="clr"></div>
						</div>
					</div>
					<div class="comment_ask" id="17358819">
						<i class="iconcom-user">Da</i><strong onclick="selCmt(17358819)">Dương
							Anh</strong>
						<div class="infocom_ask ">Bạn ơi đt iphone 7 của mình khi
							bật 3d touch lên . Đt bị đơ trư nut home va nút nguon ko bị gì.
							Con lại man hinh đơ sao ây. Bạn hổ trợ giup minh tăt 3d touch vs
							thanhk</div>
						<div class="relate_infocom" data-cl="0">
							<span class="reply" onclick="cmtaddreplyclick(17358819)">Trả
								lời </span><b class="dot">●</b> <span class="numlike"> <i
								class="iconcom-like"></i> <span class="like"
								onclick="likeCmt(17358819);"> Thích</span> (1)
							</span><spanclass"date"><b class="dot">●</b> 8 ngày trước</span></div>
					</div>
					<div class="comment_reply" id="r17358819">
						<i class="arrow_box"></i>
						<div class="comment_ask " id="17360670" data-parent="17358819">
							<i class="iconcom-user">MH</i><strong onclick="selCmt(17360670)">Minh
								Hoàng</strong><b class="qtv">MOD</b>
							<div class="infocom_ask">
								<div class="conticon">
									<div class="content">Lạ vậy,iPhone 7 cấu hình cao mà bạn
										làm sai lại đơ được nè,có thể do bạn mở nhiều ứng dụng cùng
										lúc quá thôi,nên bạn hãy đóng tất cả ứng dụng,hoặc nếu bạn
										muốn tắt 3D Touch bạn có thể vào Cài đặt > cài đặt chung > trợ
										năng > 3D Touch > bạn tắt đi là được.</div>
									<div class="relate_infocom" data-cl="0">
										<span class="btnreply"
											onclick="cmtChildAddReplyClick(17360670,17358819)">Trả
											lời </span><b class="dot">●</b> <span class="numlike"><i
											class="iconcom-like"></i><span class="like"
											onclick="likeCmt(17360670);"> Thích</span> </span><span
											class=&quot;date&quot;><b class="dot">●</b> 8 ngày
											trước</span>
									</div>
								</div>
							</div>
							<div class="clr"></div>
						</div>
					</div>
					<div class="comment_ask" id="17346298">
						<i class="iconcom-user">NT</i><strong onclick="selCmt(17346298)">Ngọc
							Tú</strong>
						<div class="infocom_ask ">Mình bật 3d touch rồi mà mỗi lần
							nhấn là rung rung màn hình để xoá icon, có dấu chéo để xoá chứ ko
							hiện như hướng dẫn</div>
						<div class="relate_infocom" data-cl="0">
							<span class="reply" onclick="cmtaddreplyclick(17346298)">Trả
								lời </span><b class="dot">●</b> <span class="numlike"> <i
								class="iconcom-like"></i> <span class="like"
								onclick="likeCmt(17346298);"> Thích</span>
							</span><spanclass"date"><b class="dot">●</b> 8 ngày trước</span></div>
					</div>
					<div class="comment_reply" id="r17346298">
						<i class="arrow_box"></i>
						<div class="comment_ask " id="17347138" data-parent="17346298">
							<i class="iconcom-user">MH</i><strong onclick="selCmt(17347138)">Minh
								Hoàng</strong><b class="qtv">MOD</b>
							<div class="infocom_ask">
								<div class="conticon">
									<div class="content">Bạn phải nhấn mạnh thả ra liền chứ
										không có nhấn nhẹ và lâu nha bạn.</div>
									<div class="relate_infocom" data-cl="0">
										<span class="btnreply"
											onclick="cmtChildAddReplyClick(17347138,17346298)">Trả
											lời </span><b class="dot">●</b> <span class="numlike"><i
											class="iconcom-like"></i><span class="like"
											onclick="likeCmt(17347138);"> Thích</span> (1)</span><span
											class=&quot;date&quot;><b class="dot">●</b> 8 ngày
											trước</span>
									</div>
								</div>
							</div>
							<div class="clr"></div>
						</div>
					</div>
					<div class="comment_ask" id="17229638">
						<i class="iconcom-user">D</i><strong onclick="selCmt(17229638)">Dũng</strong>
						<div class="infocom_ask ">Sao e bật 3d toud rồi mà phần nào
							cũng không đc là sao ạ</div>
						<div class="relate_infocom" data-cl="0">
							<span class="reply" onclick="cmtaddreplyclick(17229638)">Trả
								lời </span><b class="dot">●</b> <span class="numlike"> <i
								class="iconcom-like"></i> <span class="like"
								onclick="likeCmt(17229638);"> Thích</span>
							</span><spanclass"date"><b class="dot">●</b> 14 ngày trước</span></div>
					</div>
					<div class="comment_reply" id="r17229638">
						<i class="arrow_box"></i>
						<div class="comment_ask " id="17230130" data-parent="17229638">
							<i class="iconcom-user">PC</i><strong onclick="selCmt(17230130)">Phú
								Cường</strong><b class="qtv">MOD</b>
							<div class="infocom_ask">
								<div class="conticon">
									<div class="content">Phần nào cũng không được là sao vậy
										bạn? Để sử dụng 3D Touch thì bạn cần có một lực nhấn vừa đủ
										một vài giây (nếu không nói là hơi mạnh) lên các biểu tượng
										mới xuất hiện được các tùy chọn cho 3D Touch được, hoặc bạn có
										thể vào Cài đặt > Cài đặt chung > Trợ năng > 3D Touch, bạn
										chỉnh lại độ nhạy 3D Touch cho phù hợp với bạn và thao tác
										lại.</div>
									<div class="relate_infocom" data-cl="0">
										<span class="btnreply"
											onclick="cmtChildAddReplyClick(17230130,17229638)">Trả
											lời </span><b class="dot">●</b> <span class="numlike"><i
											class="iconcom-like"></i><span class="like"
											onclick="likeCmt(17230130);"> Thích</span> </span><span
											class=&quot;date&quot;><b class="dot">●</b> 14 ngày
											trước</span>
									</div>
								</div>
							</div>
							<div class="clr"></div>
						</div>
					</div>
					<div class="comment_ask" id="17132876">
						<i class="iconcom-user">S</i><strong onclick="selCmt(17132876)">Sơn</strong>
						<div class="infocom_ask ">K chọn đc chế độ live photo</div>
						<div class="relate_infocom" data-cl="0">
							<span class="reply" onclick="cmtaddreplyclick(17132876)">Trả
								lời </span><b class="dot">●</b> <span class="numlike"> <i
								class="iconcom-like"></i> <span class="like"
								onclick="likeCmt(17132876);"> Thích</span>
							</span><spanclass"date"><b class="dot">●</b> 19 ngày trước</span></div>
					</div>
					<div class="comment_reply" id="r17132876">
						<i class="arrow_box"></i>
						<div class="comment_ask " id="17133195" data-parent="17132876">
							<i class="iconcom-user">NÁ</i><strong onclick="selCmt(17133195)">Ngọc
								Ánh</strong><b class="qtv">MOD</b>
							<div class="infocom_ask">
								<div class="conticon">
									<div class="content">Bạn cung cấp thêm thông tin máy có
										báo lỗi gì không và ảnh chụp màn hình để mình hỗ trợ nhé.</div>
									<div class="relate_infocom" data-cl="0">
										<span class="btnreply"
											onclick="cmtChildAddReplyClick(17133195,17132876)">Trả
											lời </span><b class="dot">●</b> <span class="numlike"><i
											class="iconcom-like"></i><span class="like"
											onclick="likeCmt(17133195);"> Thích</span> </span><span
											class=&quot;date&quot;><b class="dot">●</b> 19 ngày
											trước</span>
									</div>
								</div>
							</div>
							<div class="clr"></div>
						</div>
					</div>
					<div class="comment_ask" id="17053746">
						<i class="iconcom-user">Pt</i><strong onclick="selCmt(17053746)">Phong
							Tố</strong>
						<div class="infocom_ask ">Nếu bật 3d tuoch cài live photo
							làm hình nền khoá vậy mở máy phải nhấn màn hình mới chuyển động
							hay tự chuyển động vậy bạn ơi</div>
						<div class="relate_infocom" data-cl="0">
							<span class="reply" onclick="cmtaddreplyclick(17053746)">Trả
								lời </span><b class="dot">●</b> <span class="numlike"> <i
								class="iconcom-like"></i> <span class="like"
								onclick="likeCmt(17053746);"> Thích</span>
							</span><spanclass"date"><b class="dot">●</b> 23 ngày trước</span></div>
					</div>
					<div class="comment_reply" id="r17053746">
						<i class="arrow_box"></i>
						<div class="comment_ask " id="17054859" data-parent="17053746">
							<i class="iconcom-user">MH</i><strong onclick="selCmt(17054859)">Minh
								Hoàng</strong><b class="qtv">MOD</b>
							<div class="infocom_ask">
								<div class="conticon">
									<div class="content">Bạn phải nhấn nó mới chuyển động nha
										bạn Phong ơi.</div>
									<div class="relate_infocom" data-cl="0">
										<span class="btnreply"
											onclick="cmtChildAddReplyClick(17054859,17053746)">Trả
											lời </span><b class="dot">●</b> <span class="numlike"><i
											class="iconcom-like"></i><span class="like"
											onclick="likeCmt(17054859);"> Thích</span> </span><span
											class=&quot;date&quot;><b class="dot">●</b> 23 ngày
											trước</span>
									</div>
								</div>
							</div>
							<div class="clr"></div>
						</div>
					</div>
					<div class="comment_ask" id="17033172">
						<i class="iconcom-user">K</i><strong onclick="selCmt(17033172)">Khuê</strong>
						<div class="infocom_ask ">Xin hỏi 3d touch thỉnh thoảng bị
							nhảy liên tục là bị sao vậy. Mong phản hồi</div>
						<div class="relate_infocom" data-cl="0">
							<span class="reply" onclick="cmtaddreplyclick(17033172)">Trả
								lời </span><b class="dot">●</b> <span class="numlike"> <i
								class="iconcom-like"></i> <span class="like"
								onclick="likeCmt(17033172);"> Thích</span>
							</span><spanclass"date"><b class="dot">●</b> 24 ngày trước</span></div>
					</div>
					<div class="comment_reply" id="r17033172">
						<i class="arrow_box"></i>
						<div class="comment_ask " id="17033580" data-parent="17033172">
							<i class="iconcom-user">PC</i><strong onclick="selCmt(17033580)">Phú
								Cường</strong><b class="qtv">MOD</b>
							<div class="infocom_ask">
								<div class="conticon">
									<div class="content">3D Touch bị nhảy liên tục là sao
										bạn? Là tự sử dụng hay sao? Có thể do màn hình bị mồ hôi hoặc
										cấn đó bạn, bạn vệ sinh lại phần màn hình để cải thiện chất
										lượng cảm ứng. Hoặc có khả năng do bạn chỉnh độ nhạy của 3D
										Touch quá nhẹ nên chỉ cần chạm nhẹ là đã sử dụng 3D Touch rồi,
										bạn vào lại Cài đặt > Cài đặt chung > Trợ năng > 3D Touch >
										chỉnh lại độ nhạy về mức Trung bình là được.</div>
									<div class="relate_infocom" data-cl="0">
										<span class="btnreply"
											onclick="cmtChildAddReplyClick(17033580,17033172)">Trả
											lời </span><b class="dot">●</b> <span class="numlike"><i
											class="iconcom-like"></i><span class="like"
											onclick="likeCmt(17033580);"> Thích</span> </span><span
											class=&quot;date&quot;><b class="dot">●</b> 24 ngày
											trước</span>
									</div>
								</div>
							</div>
							<div class="clr"></div>
						</div>
					</div>
					<div class="comment_ask" id="16987075">
						<i class="iconcom-user">tt</i><strong onclick="selCmt(16987075)">Trần
							Thái</strong>
						<div class="infocom_ask ">tại sao máy mình bật 3d touch rồi
							mà con cá ngoài màn hình chính không chuyển động.mấy hum trc còn
							được giờ ko được cho mình hỏi xem có pải bị lỗi hay hỏng ì không</div>
						<div class="relate_infocom" data-cl="0">
							<span class="reply" onclick="cmtaddreplyclick(16987075)">Trả
								lời </span><b class="dot">●</b> <span class="numlike"> <i
								class="iconcom-like"></i> <span class="like"
								onclick="likeCmt(16987075);"> Thích</span>
							</span><spanclass"date"><b class="dot">●</b> 27 ngày trước</span></div>
					</div>
					<div class="comment_reply" id="r16987075">
						<i class="arrow_box"></i>
						<div class="comment_ask " id="16988521" data-parent="16987075">
							<i class="iconcom-user">TT</i><strong onclick="selCmt(16988521)">Trần
								Thanh Tuấn</strong><b class="qtv">MOD</b>
							<div class="infocom_ask">
								<div class="conticon">
									<div class="content">Bạn thử thao tác lại xem sao. Bạn
										vào cài đặt > hình nền khóa > chỉnh hình nền động sẽ được bạn
										ơi. Chứ hình nền chính mình không thấy cài được ạ</div>
									<div class="relate_infocom" data-cl="0">
										<span class="btnreply"
											onclick="cmtChildAddReplyClick(16988521,16987075)">Trả
											lời </span><b class="dot">●</b> <span class="numlike"><i
											class="iconcom-like"></i><span class="like"
											onclick="likeCmt(16988521);"> Thích</span> </span><span
											class=&quot;date&quot;><b class="dot">●</b> 27 ngày
											trước</span>
									</div>
								</div>
							</div>
							<div class="clr"></div>
						</div>
					</div>
					<div class="comment_ask" id="16904016">
						<i class="iconcom-user">T</i><strong onclick="selCmt(16904016)">Toàn</strong>
						<div class="infocom_ask ">Các bạn ấn mạnh và dứt khoát 1
							chút sẽ đc.trc m k biết.giờ thì đc rồi</div>
						<div class="relate_infocom" data-cl="0">
							<span class="reply" onclick="cmtaddreplyclick(16904016)">Trả
								lời </span><b class="dot">●</b> <span class="numlike"> <i
								class="iconcom-like"></i> <span class="like"
								onclick="likeCmt(16904016);"> Thích</span>
							</span><spanclass"date"><b class="dot">●</b> 1 tháng trước</span></div>
					</div>
					<div class="comment_reply" id="r16904016">
						<i class="arrow_box"></i>
						<div class="comment_ask " id="16904208" data-parent="16904016">
							<i class="iconcom-user">PC</i><strong onclick="selCmt(16904208)">Phú
								Cường</strong><b class="qtv">MOD</b>
							<div class="infocom_ask">
								<div class="conticon">
									<div class="content">Có nhiều bạn chưa thao tác được, cảm
										ơn bạn đã chia sẻ thao tác này nhe, lấy máy ra làm liền mới
										được.</div>
									<div class="relate_infocom" data-cl="0">
										<span class="btnreply"
											onclick="cmtChildAddReplyClick(16904208,16904016)">Trả
											lời </span><b class="dot">●</b> <span class="numlike"><i
											class="iconcom-like"></i><span class="like"
											onclick="likeCmt(16904208);"> Thích</span> </span><span
											class=&quot;date&quot;><b class="dot">●</b> 1 tháng
											trước</span>
									</div>
								</div>
							</div>
							<div class="clr"></div>
						</div>
					</div>
					<div class="comment_ask" id="16824072">
						<i class="iconcom-user">T</i><strong onclick="selCmt(16824072)">Thịnh</strong>
						<div class="infocom_ask ">Của mik 6 plus sao ko có 3d touch
							vậy bạn</div>
						<div class="relate_infocom" data-cl="0">
							<span class="reply" onclick="cmtaddreplyclick(16824072)">Trả
								lời </span><b class="dot">●</b> <span class="numlike"> <i
								class="iconcom-like"></i> <span class="like"
								onclick="likeCmt(16824072);"> Thích</span>
							</span><spanclass"date"><b class="dot">●</b> 1 tháng trước</span></div>
					</div>
					<div class="comment_reply" id="r16824072">
						<i class="arrow_box"></i>
						<div class="comment_ask " id="16825230" data-parent="16824072">
							<i class="iconcom-user">PC</i><strong onclick="selCmt(16825230)">Phú
								Cường</strong><b class="qtv">MOD</b>
							<div class="infocom_ask">
								<div class="conticon">
									<div class="content">Đúng rồi bạn, 3D Touch chỉ hỗ trợ từ
										dòng máy iPhone 6s và iPhone 6s Plus thôi nên máy iPhone 6
										Plus của bạn không được hỗ trợ rồi.</div>
									<div class="relate_infocom" data-cl="0">
										<span class="btnreply"
											onclick="cmtChildAddReplyClick(16825230,16824072)">Trả
											lời </span><b class="dot">●</b> <span class="numlike"><i
											class="iconcom-like"></i><span class="like"
											onclick="likeCmt(16825230);"> Thích</span> </span><span
											class=&quot;date&quot;><b class="dot">●</b> 1 tháng
											trước</span>
									</div>
								</div>
							</div>
							<div class="clr"></div>
						</div>
					</div>
					<!-- <div class="pagcomment">
						<span class="active">1</span><span
							onclick="listcomment(2,3,2);return false;" title="trang 2">2</span><span
							onclick="listcomment(2,3,3);return false;" title="trang 3">3</span><span
							onclick="listcomment(2,3,4);return false;" title="trang 4">4</span><span
							onclick="listcomment(2,3,2);return false;" title="trang 2">»</span>
					</div> -->
				<!-- </div>
				<textarea class="dropfirst textarea txtEditor"
					placeholder="Mời bạn tham gia đánh giá, thảo luận, vui lòng nhập tiếng Việt có dấu"
					id="txtEditor2"></textarea>
			</div> -->
		</aside>
		<aside class="rightask">
			<div class="postask">
				<div class="titlepostask">
				<a href="XuLych"> <strong>Đặt câu hỏi</strong>
				</a>
						
				</div>
				<div class="sendinfo">
					<strong>Gửi với tên bạn muốn:</strong> <input id="txtname"
						name="txtname" type="text" placeholder="Tên của bạn (bắt buộc)">
					<input id="txtEmail" name="txtEmail" type="text"
						placeholder="Email (nhận email khi có trả lời)">
					<button type="submit" onclick="sendQuestionCustomer();">Gửi
						câu hỏi</button>

				</div>
			</div>
	
			<div class="interested">
				<strong>Quan tâm nhiều nhất</strong>
				<ul>
				<% 
	for(CauHoi cauhoi: dsCauHoiQuanTam){
	%>
					<li><a
						href="Xulyhd?mahd=<%=cauhoi.getStt()%>">
							<h3><%=cauhoi.getTenCauHoi() %></h3>
									</a>
							<div> <%=cauhoi.getNoiDung() %></div>
							
							<div class="info">
								<i>Minh Ho&#224;ng trả lời</i> <span>• 4 giờ trước</span> <span>•
									Mạng x&#227; hội</span>
							</div>
				
					</li>
					<%} %>
				</ul>
			</div>

		</aside>
		

 <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://cdn3.tgdd.vn/v2015/Scripts/analytics.js', 'ga');
        ga('create', 'UA-918185-25', 'auto', { 'siteSpeedSampleRate': 10 });
        window.onload = function () {
            ga('send', 'pageview');
        };
        </script>
	</section>
	<!-- header -->
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

	<p id="back-top" style="display: none">
		<a href="#top" title="Về đầu trang"><span></span></a>
	</p>
	<!-- GA -->
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
		window.onload = function() {
			ga('send', 'pageview');
		};
		//<!--#region TGDD TRACKING -->
	//<!--#endregion -->
	<!--  
	</script>
	<script type="text/javascript">
	setTimeout(function() {
		var a = document.createElement("script");
		var b = document.getElementsByTagName("script")[0];
		a.src = document.location.protocol
				+ "//script.crazyegg.com/pages/scripts/0017/3880.js?"
				+ Math.floor(new Date().getTime() / 3600000);
		a.async = true;
		a.type = "text/javascript";
		b.parentNode.insertBefore(a, b)	
	}, 1);
</script> 

 -->
	<script type="text/javascript" src="comment.js"></script>
	<!-- END GA-->

	<script type="text/javascript">
		var pQuestionID = 738113;
		var _PostType = 2;
	</script>
	<script defer="defer" async="async"
		src="https://cdn.tgdd.vn/hoi-dap/Scripts/desktop/detailbundle.min.v201703191143.js"></script>
<div id="fb-root"></div>
	

</body>
</html>
