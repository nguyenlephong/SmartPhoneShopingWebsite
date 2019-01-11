<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
    <link href="build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
  
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form action="../LoginAdmin" method="get">
              <h1>Đăng nhập</h1>
              <div>
                <input type="text" class="form-control" placeholder="Nhập vào tài khoản " name="user" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Nhập vào mật khẩu" name="pwd" />
              </div>
              <div>
              <br>
                  <input type="submit" value="Đăng nhập">
                <a class="reset_pass" href="../QuenMatKhau.jsp">Bạn đã quên mật khẩu?</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">

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
            <form action="../Logout" method="post">
              <h1>Tạo tài khoản</h1>
              <div>
                <input type="text" class="form-control" placeholder="Nhập vào tài khoản" name="user" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Nhập vào mật khẩu" name="pwd" />
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Nhập vào họ và tên" name="name" />
              </div>
              <div>
                <input type="email" class="form-control" placeholder="Nhập vào email" name="email" />
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Nhập vào địa chỉ" name="address" />
              </div>
              <div>
                <input type="number" class="form-control" placeholder="Nhập vào số điện thoại" name="phone" />
              </div>
              <div>
              <br>
                <input type="text" class="form-control" placeholder="Nhập vào số tài khoản" name="stk" />
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
