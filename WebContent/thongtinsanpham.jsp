<%@page import="model.ThongTinSanPhamTrongGioHang"%>
<%@page import="model.MoTaThongTinSanPham"%>
<%@page import="model.SanPham"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="dao.MuaHangDAO"%>
<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="model.ConnectionDB" %>
<%@ page import="model.ThongSoKiThuatSanPham" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Thông Tin Chi Tiết</title>
<%
	//String maSP="SS01013";
	String maSP=request.getParameter("maSP");
	//ConnectionDB connectionDB=new ConnectionDB();
	Map<String,ThongSoKiThuatSanPham> danhSachChiTietSanPham=(Map<String,ThongSoKiThuatSanPham>)session.getAttribute("danhsachtatcasanpham");
	ThongSoKiThuatSanPham thongSoKiThuatSanPham=danhSachChiTietSanPham.get(maSP);
	Map<String,MoTaThongTinSanPham> danhSachSanPhamDuocMoTa=(Map<String,MoTaThongTinSanPham>)session.getAttribute("danhsachsanphamduocmota");
	MoTaThongTinSanPham moTa= danhSachSanPhamDuocMoTa.get(maSP);
%>

<%String tenSP= thongSoKiThuatSanPham.getTenSanPham();
 String giaSP= thongSoKiThuatSanPham.getGiaSanPham();
 String hinhSP=thongSoKiThuatSanPham.getUrlHinhAnh();
 %>
<%Map<String, ThongTinSanPhamTrongGioHang> danhSachSanPhamCoTrongGioHang=(Map<String, ThongTinSanPhamTrongGioHang>)session.getAttribute("giohang"); %>
<%KhachHang khachHang=(KhachHang) session.getAttribute("khachHang"); %>
<meta http-equiv="x-dns-prefetch-control" content="on">
<link rel="stylesheet" type="text/css" href="css/stylethongtinsanpham.css">

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
</head>
<jsp:include page="menu.jsp"></jsp:include>


<body>

<%
	session.setAttribute("url","thongtinsanpham.jsp?maSP="+maSP );
%>


<!-- Bình luận fb ở đây -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.8&appId=172705486575651";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

			<div class="fb-login-button" data-max-rows="1" data-size="small" data-show-faces="true" data-auto-logout-link="true"></div>

	<%!public String dinhDang(int a) {
		DecimalFormat decimalFormat = new DecimalFormat("000,000 VNĐ");
		return decimalFormat.format(a);
	}%>


	<section class="type0">
	<ul class="breadcrumb">
		<li><a href="index.jsp" title="Trang chủ">Trang chủ</a> <span>›</span></li>
		<li class="brand"><a href="/dtdd-apple-iphone">iPhone (Apple)</a>
		</li>
	</ul>
	
	<div class="rowtop">
		<h1>
			Điện thoại<%out.print(tenSP);%>
		</h1>
	</div>
	<div class="clr"></div>
	<div class="rowdetail">
		<aside class="picture"> <!-- Hình sản phẩm tại đây --> <img
			src="<%out.print(hinhSP);%>"
			alt="Điện thoại iPhone <%out.print(tenSP);%>" onclick="gotoGallery(-1,0);">
		<div class="colorandpic">
			<ul class="owl-carousel owl-theme tabscolor">
			</ul>
		</div>
		</aside>
		<aside class="price_sale">
		<div class="area_price">
			<strong> <%String s = dinhDang(Integer.parseInt(giaSP));out.print(s);%>
			</strong> <span></span>
		</div>

		<ul class="policy">
			<li>Trong hộp có: Sạc, Tai nghe, Sách hướng dẫn, Jack chuyển tai nghe 3.5mm </a>
			</li>
			<li>Bảo hành chính hãng: <b>thân máy 12 tháng, sạc 12 tháng, tai nghe 12 tháng</b>
			</li>

			<li><i class='icon-poltick'></i>Giao hàng tận nơi miễn phí trong
				<strong>30 phút</strong>. <a href="" target="blank">Tìm hiểu</a></li>
			<li><i class='icon-poltick'></i><strong>1 đổi 1 trong 1 tháng </strong>với sản phẩm lỗi. <a href=""
				target="blank">Tìm hiểu</a></li>
		</ul>
		<div class="area_order">
			<a href="XuLyMuaHang?maSP=<%=maSP %>" class="buy_now" data-value="87838"><b>Thêm vào</b><span>giỏ hàng</span></a>
		</div>
		<div class="callorder">
			<span>Gọi đặt mua: <a href="tel:0966490297">0966490297</a>
				(Miễn phí)
			</span> <span><a href="tel:0836221060">01672250106</a> (24/24)</span>
		</div>
		</aside>
	</div>
	<div class="clr"></div>
	<div class="box_content">
		<aside class="left_content">
		<div class="characteristics">
			<!-- Thông tin về điện thoại -->
			<div class="boxArticle">
				<article class="area_article">
				<h2>Thông tin chi tiết về điện thoại <%out.print(tenSP);%>
					<br> <br> <br>
					<!-- Tiêu đề 1 -->
					<strong><%out.print((moTa.getTieuDe1()!=null)?moTa.getTieuDe1():"");%></strong>

					<!-- Miêu tả 1 -->
					<p><%out.print(moTa.getMota1());%></p>
				</h2>
				
				
				
				<p>

					<!-- Hình 1 ở đây -->
					<img alt="iPhone 7 với nhiều màu sắc"
						src="<%out.print(moTa.getHinh1());%>" class='lazy'
						title="iPhone 7 với nhiều màu sắc" />
				</p>
				<h3>
					<!-- Tiêu đề 2 -->
					<strong><%out.print((moTa.getTieuDe2()!=null)?moTa.getTieuDe2():"");%></strong>
				</h3>

				<!-- Miêu tả 2 -->
				<p></p>
				<%out.print(moTa.getMota2());%>
				<p>
					<!-- Hình 2 -->
					<img alt="Camera Selfie 7 MP" src="<%out.print(moTa.getHinh2());%>" class='lazy' style="height: 481px; width: 640px;" title="Camera Selfie 7 MP" />
					<!-- Hình 2 ở đây -->
					
					
				</p>
				<!-- Tiêu đề 3 -->
				<strong><%out.print((moTa.getTieuDe3()!=null)?moTa.getTieuDe3():"");%></strong>
				 <p><%out.print(moTa.getMota3());%></p>
				<p>
				
					<!-- Hình 3 -->
					<img alt="iPhone 7 128 GB - Camera" src="<%out.print(moTa.getHinh3());%>" class='lazy' title="iPhone 7 128 GB - Camera" />
				</p>
				
				<h3>
					<!-- Tiêu đề 4 -->
					<strong><%out.print((moTa.getTieuDe4()!=null)?moTa.getTieuDe4():"");%></strong>
				</h3>
				
				<!-- Mô tả 4 -->
				<p><%out.print(moTa.getMota4());%></p>
				
				<!-- Hình 4 --> 
				<img alt="Trang bị chuẩn chống nước " src="<%out.print(moTa.getHinh4());%>" class='lazy' title="Trang bị chuẩn chống nước " />
				</p>
				
				<h3>
					<!-- Tiêu đề 5 -->
					<strong><%out.print((moTa.getTieuDe5()!=null)?moTa.getTieuDe5():"");%></strong>
				</h3>
				
				<!-- Mô tả 5 -->
				<p><%out.print(moTa.getMota5());%></p>
				 <!-- Hình 5 --> 
				 <img alt="Dàn loa stereo" src="<%out.print(moTa.getHinh5());%>" class='lazy' style="height: 356px; width: 640px;" title="Dàn loa stereo" />
			
				<h3>
					<!-- Tiêu đề 6 -->
					<strong><%out.print((moTa.getTieuDe6()!=null)?moTa.getTieuDe6():"");%></strong>
				</h3>
				
				<!-- Miêu tả 6 -->
				<p><%out.print(moTa.getMota6());%></p>
				
				<p>
					<!-- Hình 6 -->
					<img alt="Cảm biến vân tay" src="<%out.print(moTa.getHinh6());%>" class='lazy' title="Cảm biến vân tay" />
				</p>
				
				<h3>
					<!-- Tiêu đề 7 -->
					<strong><%out.print((moTa.getTieuDe7()!=null)?moTa.getTieuDe7():"");%></strong>
				</h3>
				
				<!-- Miêu tả 7 -->
				<p><%out.print(moTa.getMota7());%></p>
				<p>
					<!-- Hình 7 -->
					<img alt="Màn hình hiển thị tốt" src="<%out.print(moTa.getHinh7());%>" class='lazy' title="Màn hình hiển thị tốt" />
				</p>
				
				</article>
				
				<p class="show-more" style="display: block;"
					onclick="showArticle();">
					<a href="javascript:;" class="readmore">Đọc thêm </a>
				</p>
				<div class="bottom_order">
					<div class="info_sp">
						<img class="lazy" width="70" height="70"
							src="<%out.print(hinhSP);%>" />
						<h3>
							Điện thoại
							<%out.print(tenSP);%>
						</h3>
						<strong> <%String s1 = dinhDang(Integer.parseInt(thongSoKiThuatSanPham.getGiaSanPham()));out.print(s1);%> <!-- Gia san pham -->
						</strong> <span></span>
					</div>
					<div class="area_order">
							<a href="XuLyMuaHang?maSP=<%=maSP %>" class="buy_now" data-value="87838"><b>Thêm vào</b><span>giỏ hàng</span></a>
							
					</div>
				</div>
			</div>
			<!-- Chèn comments -->
			<div class="fb-comments" data-order-by="reverse_time" data-href="thongtinsanpham.jsp?<%out.print(maSP);%>" data-width="750" data-numposts="5"></div>
		</aside>
		<aside class="right_content">
		<div class="tableparameter">
			<h2>>>>>>Thông số kỹ thuật<<<<<</h2>
			<ul class="parameter">
				<!--Thông tin màn hình-->
				<li class="manhinh"><span><h4>Màn hình</h4></span></li>
				<li class="mh1"><span>Công nghệ màn hình:</span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getCongNgheManHinh());%>
					</div></li>
				<li class="mh2"><span>Độ phân giải:</span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getDoPhanGiai());%>
					</div></li>
				<li class="mh3"><span>Màn hình rộng:</span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getManHinhRong());%>
					</div></li>
				<li class="mh4"><span>Mặt kính cảm ứng:</span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getMatKinhCamUng());%>
					</div></li>
					
					
				<!--Thông tin camera-->
				<li class="camera"><span><h4>Camera</h4></span></li>
				<li class="cmrt"><span>Camera trước</span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getCameraTruoc());%>
					</div></li>
				<li class="cmrs"><span>Camera sau</span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getCameraSau());%>
					</div></li>
				<li class="df"><span>Đèn flash</span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getDenFlash());%>
					</div></li>
					
					
				<!--Thông tin hệ điều hành-->
				<li class="hdh"><span><h4>Hệ điều hành - CPU</h4></span></li>
				<li class="ram"><span>Hệ điều hành:</span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getHeDieuHanh());%>
					</div></li>
				<li class="tocdocpu"><span>Tốc độ xử lý: </span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getTocDoCPU());%>
					</div></li>
					
					
				<!--Thông tin bộ nhớ và lưu trữ-->
				<li class="bnvlt"><span><h4>Bộ nhớ và lưu trữ</h4></span></li>
				<li class="ram"><span>Ram:</span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getRam());%>
					</div></li>
				<li class="bnt"><span>Bộ nhớ trong:</span>
					<div>
						<% out.print(thongSoKiThuatSanPham.getBoNhoTrong());%>					
					</div></li>
				<li class="tnn"><span>Thẻ nhớ ngoài:</span>
					<div>
						<% out.print(thongSoKiThuatSanPham.getTheNhoNgoai());%>
					</div></li>
					
				<!-- Thong tin ket noi -->
				<li class="kn"><span><h4>Kết nối</h4></span></li>
				<li class="mang"><span>Mạng:</span>
					<div>
						<% out.print(thongSoKiThuatSanPham.getMang());%>
					</div></li>
				<li class="sim"><span>Sim:</span>
					<div>
						<% out.print(thongSoKiThuatSanPham.getSim());%>
					</div></li>
				<li class="wf"><span>Wifi:</span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getWifi());%>
					</div></li>
				<li class="gps"><span>GPS:</span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getGps());%>
					</div></li>
					
				<!-- Thong tin ve thiet ke -->
				<li class="tkvtl"><span><h4>Thiết kê & trọng lượng</h4></span>
				</li>
				<li class="cl"><span>Chất liệu:</span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getChatLieu());%>
					</div></li>
				<li class="kt"><span>Kích thước:</span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getKichThuoc());%>
					</div></li>
				<li class="tl"><span>Trọng lượng:</span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getTrongLuong());%>
					</div></li>
					
				<!-- Thong tin ve pin -->
				<li class="ttp"><span><h4>Thông tin pin</h4></span></li>
				<li class="dlp"><span>Dung lượng pin:</span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getDungLuongPin());%>
					</div></li>
				<li class="lp"><span>Loại pin:</span>
					<div>
						<%out.print(thongSoKiThuatSanPham.getLoaiPin());%>
					</div></li>
			</ul>
			<div class="closebtn none">
				<i class="icondetail-closepara"></i>
			</div>
			<div class="fullparameter">
				<div class="scroll">
					<h3>
						Thông số kỹ thuật chi tiết
						<%out.print(tenSP);%>
					</h3>
					<img id="imgKit" width="500" height="430"
						alt="Thông số kỹ thuật 87838">
					<ul class="parameterfull"></ul>
				</div>
			</div>

		</div>

		<div class="clr"></div>
		</aside>
		<div class="clr"></div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- về đầu trang -->
	<p id="back-top">
		<a href="#top" title="Về Đầu Trang"><span></span></a>
	</p>
	
<%if(khachHang!=null){ %>
	<!-- Modal thong tin ca nhan -->
<!-- Button dùng để gọi popup -->


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
        <p style="text-align:center">Tên của bạn: <%=khachHang.getTenKhachHang() %></p>
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
				          <form class="form-horizontal" action="DoiMatKhau" method="post" onsubmit="return(doiMatKhau())">
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
	
	
	<!-- đây là phần về đầu trang( phía trên không có thẻ span đéo ra con mẹ j đâu nh) -->
	<script defer="defer" async="async"
		src="https://cdn4.tgdd.vn/v2015/Scripts/desktop/V4/detail.min.v201703090420.js"></script>
	<script>
		setTimeout(
				function() {
					(function(d, s, id) {
						var js, fjs = d.getElementsByTagName(s)[0];
						if (d.getElementById(id))
							return;
						js = d.createElement(s);
						js.id = id;
						js.src = "/connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.4&appId=242045172499368";
						fjs.parentNode.insertBefore(js, fjs);
					}(document, 'script', 'facebook-jssdk'))
				}, 7000);
		var product = {
			identifier : '87838',
			category : [ 'Điện thoại', 'iPhone (Apple)' ],
			fn : '<%out.print(tenSP);%>',
			description : '',
			brand : '',
			price : '<%out.print(giaSP);%>',
			amount : '<%out.print(giaSP);%>',
			currency : 'VND',
			url : 'http://www.thegioididong.com/dtdd/iphone-7-256gb',
			photo : 'https://cdn.tgdd.vn/Products/Images/42/87838/iphone-7-256gb-12-300x300.jpg',
			valid : '0'
		};
		var productga = product;
		productga.variant = '0131491000398';
		var GL_CATEGORYID = 42;
		var categoryUrl = 'dtdd';
		var productID = '87838';
		var ProductID = '87838';
		var ManuID = 80;
		var cateID = '42';
		var GL_TYPEPRODUCT = '0';
		var gl_isAccesory = false;
		var gl_isRating = true;
		var gl_isSmartPhone = false;
		var tgddc_urlroot = '/commentv4';
		var tggd_urlroot = 'http://www.thegioididong.com';
		var tgddc_urlroot = '//www.thegioididong.com/commentnew';
		var comment_cdn = '/commentnew';
		var jsCommentUrl = '/commentnew/Scripts/CommentDesktop.min.js?v=201703090432';

		var staticcontentversion = '201703090432';
		var comment_cssinline = '1';
		var Offer_oid = 87838;
		var Offer_t = 1;

		//<!--#region GA -->
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
					j.src = '/www.googletagmanager.com/gtm.js' + i + dl;
					f.parentNode.insertBefore(j, f);
				})(window, document, 'script', 'dataLayer', 'GTM-WKQZL8')
			}, 10000);
			//<!--#endregion -->
		};

		var mysessionid = 'ghro5hynyjatvye2usyjay1z';
		var g_version = '201703090432';
		var tgddctr_urlroot = '//www.thegioididong.com/tracking';
		//<!--#endregion -->
		var rooturl = '.thegioididong.com';
		var isMobile = false;
	</script>

	<!--#region CrazyEgg -->

	<!--#endregion -->

	<!--#region Hotjar -->

	<!--#endregion -->
		<!-- script menu -->
	 <script src="cssmenu/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="cssmenu/js/bootstrap.js" type="text/javascript"></script>
	
	<script src="cssmenu/js/ct-navbar.js"></script>
</body>
</html>