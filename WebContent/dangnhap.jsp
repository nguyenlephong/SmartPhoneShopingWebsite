<%@page import="dao.KhachHangDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="model.KhachHang"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
	<%Map<String,KhachHang> danhSachKhachHang=KhachHangDao.dsKhachHang();
	session.setAttribute("danhSachKhachHang", danhSachKhachHang);
	%>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#dangnhap').on('submit',function(){
				<%List<String> taiKhoanDaDangNhap = (List<String>)application.getAttribute("taiKhoanDaDangNhap");
				%>
				var arr = new Array();
				
				<%for(int i=0;i<taiKhoanDaDangNhap.size();i++){%>
					arr[<%=i%>]= '<%=taiKhoanDaDangNhap.get(i)%>';
 				<%}%>
				
 				for ( var k=0;k<arr.length; k++) {
					if($('#us').val() == arr[k]){
						$('#loi').html('Tài khoản đã được đăng nhập ở đâu đó');
						return false;
					}
				}
 				return true;
			});
			$('#dangnhap').on('keydown',function(){
				$('#loi').html();	
			});
		});
	</script>
	
	<script type="text/javascript">
			function validatePhone(txtPhone) {
			    var filter = /^[0-9-+]+$/;
			    if (filter.test(txtPhone+"") && txtPhone.length>=10 && txtPhone.length<12 ) {
			        return true;
			    }
			    else {
			        return false;
			    }
			}
			function validateEmail(sEmail) {
			    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			    if (filter.test(sEmail) ) {
			        return true;
			    }
			    else {
			        return false;
			    }
			}
		$(document).ready(function(){
			$('#dangki').on('submit',function(){
				<%List<String> userInDB = new ArrayList<>();
				for(KhachHang khachHang:danhSachKhachHang.values()){
					userInDB.add(khachHang.getTenTaiKhoan());
				}
				
				%>
				var arrUS = new Array();
				<%for(int i=0;i<userInDB.size();i++){%>
					arrUS[<%=i%>]= '<%=userInDB.get(i)%>';
 				<%}%>
 				
 				<%List<String> dsEmail = KhachHangDao.danhSachEmail();%>
 				var arrEmail = new Array();
 				
 				<%for(int i=0;i<dsEmail.size();i++){%>
 					arrEmail[<%=i%>]= '<%=dsEmail.get(i)%>';
 				<%}%>
 				
 				for (var i = 0; i < arrUS.length; i++) {
					if($('#tk').val() == arrUS[i]){
						$('#loitk').html('Tài khoản đã tồn tại !');
						return false;
					}
				}
 				
 				for (var i = 0; i < arrEmail.length; i++) {
					if($('#email').val() == arrEmail[i]){
						$('#loiemail').html('Email đã tồn tại !');
						return false;
					}
				}
 				
 				if($('#tk').val().length <6){
 					$('#loitk').html('Tài khoản phải hơn 6 kí tự !');
					return false;
 				}
 				
 				if($('#p').val().length < 5){
 					$('#loip').html('Mật khẩu phải hơn 6 kí tự !');
 					return false;
 				}
 				if($('#p').val() != $('#rp').val()){
 					$('#loirp').html('Nhập lại mật khẩu không đúng !');
 					return false;
 				}
 				if(!validatePhone($('#sdt').val())){
 					$('#loisdt').html('Số điện thoại bạn nhập không đúng !');
 					return false;
 				}
 				if(!validateEmail($('#email').val())){
 					$('#loiemail').html('Email bạn nhập không đúng !');
 					return false;
 				}
 				
 				return true;
			});
			$('#dangki').on('keydown',function(){
				if($('#tk').val() !=''){
					$('#loitk').html('');
				}
				if($('#p').val() !=''){
					$('#loip').html('');
				}
				if($('#rp').val() == $('#p').val() ){
					$('#loirp').html('');
				}
				if($('#sdt').val() !=''){
					$('#loisdt').html('');
				}
				if($('#email').val() !=''){
					$('#loiemail').html('');
				}
			});
		});
	</script>
	
    <title>Đăng nhập hệ thống! | </title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="css/custom.min.css" rel="stylesheet">
    <script src='https://www.google.com/recaptcha/api.js'></script>
  </head>
	
<%Map<String,String> ngonNgu =(Map<String,String>) session.getAttribute("ngonngu"); 
%>



<fmt:setBundle var = "b" basename ="myapp" scope="session"/>
  <body class="login" onload="kiemTra()">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form action="<%=response.encodeURL("XuLyDangNhap") %>" method="post" id="dangnhap">
              <h1><%=ngonNgu.get("login") %></h1>
              <div>
                <input id="us" required="true" type="text" class="form-control" placeholder="<%=ngonNgu.get("username") %>" name="username" 
                value="<%if(request.getAttribute("us")!=null && !request.getAttribute("us").equals("")){
                	out.print(request.getAttribute("us"));
                }
                %>"
                
                />
              </div>
              <div>
                <input id="ps" required="true" type="password" class="form-control" placeholder="<%=ngonNgu.get("password") %>" name="password"
                value="<%if(request.getAttribute("ps")!=null&& !request.getAttribute("ps").equals("")){
                	out.print(request.getAttribute("ps"));
                }
                %>"
                />
              </div>
              <div class="g-recaptcha" data-sitekey="6LegKyMUAAAAANllnbu56F4pGdi6U7pnIMBdUsu3"></div>
              <p id="loi" style="color: red;"><%if(request.getAttribute("loiTK")!=null && !request.getAttribute("loiTK").equals("")){
            	  										out.print(request.getAttribute("loiTK"));
            	  									}else if(request.getAttribute("loiCC")!=null && !request.getAttribute("loiCC").equals("")){
                	  											out.print(request.getAttribute("loiCC"));
                	  										}
              												%></p>
              <div>
              <br>
              <div>
                 <input type="submit" value="<%=ngonNgu.get("login") %>">
                   <!-- NÚT ĐĂNG NHẬP -->
				</div>
    			<br />
                <a class="reset_pass" href="quenmatkhau.jsp"><%=ngonNgu.get("forget") %></a>
              </div>
				<br>
                <a href="DaNgonNguController?lang=English">Tiếng Anh</a>
                 <a href="DaNgonNguController?lang=Vietnam">Việt nam</a>
              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link"><%out.print(ngonNgu.get("answer")); %>
                  <a href="#signup" class="to_register"> <%=ngonNgu.get("create") %> </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> Lập trình web!</h1>
                  <p>©2017 Lập trình web - Đề tài thiết kế websites bán điện thoại - Cô Nga & Cô Thơ</p>
                </div>
              </div>
            </form>
          </section>
        </div>

        <div id="register" class="animate form registration_form">
          <section class="login_content">
            <form action="<%=response.encodeURL("XuLyDangKy") %>" name="dangki"  method="post" id="dangki">
              <h1>Tạo tài khoản</h1>
              <div>
                <input type="text" class="form-control" placeholder="Nhập vào tài khoản" name="username" id="tk" required="true"/>
                <p><font size="2" color="red" id="loitk"></font></p>
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Nhập vào mật khẩu" name="password" id="p" />
                <p><font size="2" color="red" id="loip"></font></p>
              </div>
               <div>
                <input type="password" class="form-control" placeholder="Nhập lại mật khẩu" name="repassword" id="rp" />
                <p><font size="2" color="red" id="loirp"></font></p>
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Nhập vào họ và tên" name="ten" id="ten" required="true"/>
              </div>
              <div>
                <input type="email" class="form-control" placeholder="Nhập vào email" name="email" id="email" />
                <p><font size="2" color="red" id="loiemail"></font></p>
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Nhập vào địa chỉ" name="diachi" id="dc" required="true"/>
              </div>
              <div>
                <input type="number" class="form-control" placeholder="Nhập vào số điện thoại" name="sdt" id="sdt" />
                <p><font size="2" color="red" id="loisdt"></font></p>
              </div>
              <div>
              <br>
                <input type="number" class="form-control" placeholder="Nhập vào số tài khoản" name="sotaikhoan" id="stk" required="true"/>
                <p><font size="2" color="red" id="sotaikhoan"></font></p>
              </div>
              <div>
              <br>
                <input type="submit" value="Đăng kí">
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Bạn đã sẳn sàng đăng nhập chưa ?
                  <a href="#signin" class="to_register"> Đăng nhập </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> Lập trình web!</h1>
                  <p>©2017 Lập trình web - Đề tài thiết kế web bán điện thoại - cô Nga & cô Thơ</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>
