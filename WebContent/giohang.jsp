<%@page import="model.ThongTinSanPhamTrongGioHang"%>
<%@page import="java.util.Set"%>
<%@page import="model.SanPham"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.MuaHangDAO"%>
<%@page import="model.KhachHang"%>
<%@page import="model.ConnectionDB"%>
<%@page import="model.ChiTietDonHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DanhSachDonHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%session.setAttribute("url", "giohang.jsp"); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Giỏ hàng của bạn</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
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
.panel-table .panel-body{
  padding:0;
}

.panel-table .panel-body .table-bordered{
  border-style: none;
  margin:0;
}

.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type {
    text-align:center;
    width: 100px;
}

.panel-table .panel-body .table-bordered > thead > tr > th:last-of-type,
.panel-table .panel-body .table-bordered > tbody > tr > td:last-of-type {
  border-right: 0px;
}

.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type,
.panel-table .panel-body .table-bordered > tbody > tr > td:first-of-type {
  border-left: 0px;
}

.panel-table .panel-body .table-bordered > tbody > tr:first-of-type > td{
  border-bottom: 0px;
}

.panel-table .panel-body .table-bordered > thead > tr:first-of-type > th{
  border-top: 0px;
}

.panel-table .panel-footer .pagination{
  margin:0; 
}

/*
used to vertically center elements, may need modification if you're not using default sizes.
*/
.panel-table .panel-footer .col{
 line-height: 34px;
 height: 50px;
}

.panel-table .panel-heading .col h3{
 line-height: 30px;
 height: 20px;
}

.panel-table .panel-body .table-bordered > tbody > tr > td{
  line-height: 34px;
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


<%KhachHang khachHang=(KhachHang) session.getAttribute("khachHang");
%>
<%
	session.setAttribute("url","giohang.jsp" );
%>
	<%!public String dinhDang(int a) {
		DecimalFormat decimalFormat = new DecimalFormat("000,000 VNĐ");
		return decimalFormat.format(a);
	}%>
</head>

<!-- Menu -->
 	<link href="cssmenu/css/bootstrap.css" rel="stylesheet" />

    <link href="cssmenu/css/pe-icon-7-stroke.css" rel="stylesheet" />
	<link href="cssmenu/css/ct-navbar.css" rel="stylesheet" />  
<!-- Menu -->
</head>


<body>
<%Map<String, ThongTinSanPhamTrongGioHang> danhSachSanPhamCoTrongGioHang=(Map<String, ThongTinSanPhamTrongGioHang>)session.getAttribute("giohang"); %>
<div class="container">
    <div class="row">
    <p></p>
    <br>
    <br>
    <br>
    <h1>Giỏ hàng của bạn</h1>
    <p>Bạn có thể xóa hoặc xem lại các sản phẩm đã đặt trước khi xuất đơn hàng</p>
    <p> </p><p> </p>
        <div class="col-md-10 col-md-offset-1">
			<%session.setAttribute("url", "giohang.jsp"); %>
            <div class="panel panel-default panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-6">
                    <h3 class="panel-title">Sản phẩm bạn đã đặt</h3>
                  </div>
                  <div class="col col-xs-6 text-right">
                    <a href="sanpham.jsp"><button type="button" class="btn btn-sm btn-primary btn-create" >Tiếp tục mua hàng >></button></a>
                  </div>
                   <div class="col col-xs-1 text-center">
                   <%if(khachHang!=null){ %>
                    <button type="button" class="btn btn-sm btn-primary btn-create" data-toggle="modal" data-target="#myModalXuatHang">Xuất đơn hàng</button>
                    <%}else{ %>
                     <a href="dangnhap.jsp"><button type="button" class="btn btn-sm btn-primary btn-create" >Xuất đơn hàng ></button></a>
                    <%} %>
                  </div>
                </div>
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                        <th><em class="fa fa-cog"></em></th>
                        <th class="hidden-xs">Mã sản phẩm</th>
                        <th>Tên Sản Phẩm</th>
                        <th>Số Lượng</th>
                        <th>Tổng Tiền</th>
                    </tr> 
                  </thead>
                  <tbody>
               
                <%String id=request.getParameter("id");%>
              		
              		<%Map<String, ThongTinSanPhamTrongGioHang> danhSachSanPhamDaMua=(Map<String, ThongTinSanPhamTrongGioHang>)session.getAttribute("giohang");%>
              		<%for(ThongTinSanPhamTrongGioHang sp: danhSachSanPhamDaMua.values()){ %>
                      <tr><td align="center"> <a href="thongtinsanpham.jsp?maSP=<%=sp.getMaSP()%>" class="btn btn-default" data-toggle="tooltip" title="Xem chi tiết">
                       	  <em class="glyphicon glyphicon-list-alt"></em></a>
                          <a href="XuLyXoaSanPham?maSP=<%=sp.getMaSP()%>" class="btn btn-danger" data-toggle="tooltip" title="Xóa sản phẩm này"><em class="fa fa-trash"></em></a>
                      </td>
                      <td><%=sp.getMaSP()%> </td>
                      <td><%=sp.getTenSP()%> </td>
                      <td>
                      <form action="ThayDoiSoLuongController" method="get">
                      <input style="display: none;" value="<%=sp.getMaSP()%>" name="masp">
                      <input style="width: 50px;height: 33px;border:3px solid green;" type="number" name="soluong-<%=sp.getMaSP() %>" value="<%=sp.getSoLuong()%>">
                      <input class="btn btn-default" data-toggle="tooltip" title="Xem chi tiết" value="Cập nhật" type="submit">
                      </form>
                      </td>
                      <td><%=dinhDang(sp.getGia())%></td></tr>
                      <%} %>
               
                  </tbody>
                </table>
            
              </div>
              <!--  <div class="panel-footer">
                <div class="row">
                  <div class="col col-xs-4">Page 1 of 5
                  </div>
                  <div class="col col-xs-8">
                    <ul class="pagination hidden-xs pull-right">
                      <li><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                    </ul>
                    <ul class="pagination visible-xs pull-right">
                        <li><a href="#">«</a></li>
                        <li><a href="#">»</a></li>
                    </ul>
                  </div>
                </div>
              </div>-->
            </div>

</div></div></div>
<!-- Menu -->
	<jsp:include page="menu.jsp"></jsp:include>
<!-- Menu -->





	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer -->


<%if(khachHang!=null){ %>
<%Map<String, ThongTinSanPhamTrongGioHang> danhSachSanPham=(Map<String, ThongTinSanPhamTrongGioHang>)session.getAttribute("giohang"); %>
<!-- popup -->
<div id="myModalXuatHang" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Xem trước hóa đơn của bạn</h4>
      </div>
      <div class="modal-body">
      <% String tenKhachHang=khachHang.getTenKhachHang();
    	  String diaChi=khachHang.getDiaChi();
    	  String email=khachHang.getEmail();
    	  String sdt=khachHang.getSdt();
    	  String soTaiKhoang=khachHang.getSoTaiKhoan();
    	  String cacSP="";
    	  int tongGiaTri=0;
    	  int tongSoLuong=0;%>
      <%if(danhSachSanPham.size()>0){
    	  for(ThongTinSanPhamTrongGioHang sanPham:danhSachSanPham.values() ){
    	  	cacSP+=sanPham.getTenSP()+" "+ sanPham.getSoLuong() +" cái,";
    	  	tongGiaTri+=sanPham.getGia();
    	  }
    	  tongSoLuong=danhSachSanPham.size();
    	  cacSP=cacSP.substring(0, cacSP.length()-1);    	  
      }%>
      <%if(danhSachSanPham!=null  || danhSachSanPham.size()>0){ %>
        <p style="text-align:center">Tên của bạn: <%=tenKhachHang %></p>
        <p style="text-align:center">Địa chỉ: <%=diaChi%></p>
        <p style="text-align:center">Số điện thoại: <%=sdt%></p>
        <p style="text-align:center">Số tài khoản: <%=soTaiKhoang %></p>
        <p style="text-align:center">Địa chỉ email: <%=email%></p>
        <p style="text-align:center">Các sản phẩm đã chọn: <%=cacSP%></p>
        <p style="text-align:center">Tổng giá trị: <%out.print(dinhDang(tongGiaTri));%></p>
        <p style="text-align:center">Tổng số lượng: <%=tongSoLuong%></p>
        
        
       <% }%>
      </div>
      <div class="modal-footer">
      <%if(danhSachSanPham.size()>0) {%>
       <center><a href="XuLyXuatDonHang"><button type="submit" class="btn btn-success" onclick="validateForm()">Xuất đơn hàng</button></a></center>
       <%} %>
        <button type="button" class="btn btn-default" data-dismiss="modal">Hoãn lại</button>
        
      </div>
    </div>

  </div>
</div>
<%} %>	

	<!-- Modal thong tin ca nhan -->
<!-- Button dùng để gọi popup -->

<%if(khachHang!=null){ %>
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
        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
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
	
</body>
</html>