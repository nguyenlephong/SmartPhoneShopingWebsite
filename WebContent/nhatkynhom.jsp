<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Nhật ký nhóm 001</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style type="text/css">
  	.khoangcach{
  		margin-top: 40px;

  	}
  	.name{
  	color:red;
  	font-size: 1.5em;
  	font-style: inherit;
  	text-shadow:2px 2px 18px #FF0000;
  	}
  	.khoangcachtrong{
  		margin-top: 50px;
  		padding-top: 50px;
  	}
  	 h3, h4 {
      margin: 10px 0 30px 0;
      font-size: 20px;
      color: #111;
  }
  .container {
      padding: 80px 80px;
  }
  .person {
      border: 10px solid transparent;
      margin-bottom: 25px;
      width: 80%;
      height: 80%;
      opacity: 0.7;
  }
  .person:hover {
      border-color: #f1f1f1;
  }
  .carousel-inner img {
      -webkit-filter: grayscale(90%);
      filter: grayscale(90%); /* make all photos black and white */ 
      width: 100%; /* Set width to 100% */
      margin: auto;
  }
  .carousel-caption h3 {
      color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
  .bg-1 {
      background: #2d2d30;
      color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
      border-top-right-radius: 0;
      border-top-left-radius: 0;
  }
  .list-group-item:last-child {
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail p {
      margin-top: 15px;
      color: #555;
  }

  .btn:hover, .btn:focus {
      border: 1px solid #333;
      background-color: #fff;
      color: #000;
  }
  .modal-header, h4, .close {
      background-color: #333;
      color: #fff !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-header, .modal-body {
      padding: 40px 50px;
  }

  .open .dropdown-toggle {
      color: #fff;
      background-color: #555 !important;
  }

a :hover{
	  background-color: red;
}

  </style>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="index.jsp">Trang chủ</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Giới thiệu</a></li>
        <li class="">
          <a class="" data-toggle="" href="#nv3">Tuần 3 </a>
          <ul class="dropdown-menu">
            
          </ul>
        </li>
        <li><a href="#nv4">Tuần 4</a></li>
        <li><a href="#nv5">Tuần 5</a></li>
      	 <li><a href="#nv6">Tuần 6</a></li>
      	  <li><a href="#nv7">Tuần 7</a></li>
      	   <li><a href="#nv8">Tuần 8-9</a></li>
      	    <li><a href="#nv10">Tuần 10</a></li>
      	    <li><a href="#nv12">Tuần 12</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="http://adminshopphone.azurewebsites.net/TrangChu.jsp"><span class="glyphicon glyphicon-user"></span> Trang admin</a></li>
        <li><a href="http://adminshopphone.azurewebsites.net"><span class="glyphicon glyphicon-log-in"></span> Đăng ký admin</a></li>
      </ul>
   <a href="http://ood2017-group01.blogspot.com/"> <button class="btn btn-danger navbar-btn">Blog Project TKHĐT</button></a>
    </div>

  </div>
</nav>
  
<div class="container khoangcach">
  <center>
  	<div id="" class="">
  <h3>Nhóm 001 -Lập trình web - Cô Nga && Cô Thơ</h3>
  <p><em>Xin chào cô và các bạn!</em></p>
  <p>Chào mừng các bạn đến với trang web project của mình.Đề tài nhóm mình là thiết kế websites bán điện thoại di động dựa theo mẫu của trang <strong><a href="http://www.thegioididong.com">Thegioididong.com</a></strong>.Theo đề tài này mình đã thiết kế giao diện và hoàn thành được các chức năng cơ bản.Để đạt được những thành công đó nhóm mình đã phân công công việc rõ ràng,và công bằng nhất có thể cho các thành viên trong nhóm để có thể hoàn thành sớm project.Phía dưới là các thông tin cơ bản của thành viên nhóm mình</p>
  <br>
  <div class="row">
    <div class="col-sm-3">
      <p class="text-center  name"><strong>Nguyễn Lê Phong</strong></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="image/ThanhVien/phongok.png" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo" class="collapse">
        <p>Nhóm trưởng</p>
        <p>MSSV:15130136</p>
        <p>Ngày sinh:01-07-1997</p>
        <strong><p><a href="https://www.facebook.com/profile.php?id=100015625334333">Facebook</a></p></strong>
       <strong> <p><a href="http://nguyenlephong0107.azurewebsites.net/">Trang web cá nhân</a></p></strong>
      </div>
    </div>
    <div class="col-sm-3">
      <p class="text-center name" ><strong>Đàm Quang Khoa</strong></p><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="image/ThanhVien/khoa.png" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo2" class="collapse">
        <p>Thành viên</p>
        <p>MSSV:15130077</p>
        <p>Ngày sinh:01-07-1997</p>
        <strong><p><a href="https://www.facebook.com/peats.shyn?fref=ts">Facebook</a></p></strong>
       <strong> <p><a href="http://dqkhoa.azurewebsites.net/">Trang web cá nhân</a></p></strong>
      </div>
    </div>
    <div class="col-sm-3">
      <p class="text-center  name"><strong>Huỳnh Phước Ngà</strong></p><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="image/ThanhVien/nga.png" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo3" class="collapse">
       <p>Thành viên</p>
        <p>MSSV:15130106</p>
        <p>Ngày sinh:06-11-1997</p>
        <strong><p><a href="https://www.facebook.com/profile.php?id=100010160980940&fref=ts">Facebook</a></p></strong>
       <strong> <p><a href="http://huynhphuocnga15130106.azurewebsites.net/">Trang web cá nhân</a></p></strong>
      </div>
    </div>
    <div class="col-sm-3">
      <p class="text-center  name"><strong>Nguyễn Tấn Hậu</strong></p><br>
      <a href="#demo4" data-toggle="collapse">
        <img src="image/ThanhVien/hau.png" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo4" class="collapse">
     <p>Thành viên</p>
        <p>MSSV:15130052</p>
        <p>Ngày sinh:01-07-1997</p>
        <strong><p><a href="https://www.facebook.com/hau.nguyentan.338?fref=ts">Facebook</a></p></strong>
       <strong> <p><a href="http://nguyentanhau15130052.azurewebsites.net/">Trang web cá nhân</a></p></strong>
      </div>
    </div>
    <p>Ở trang này mình đưa ra cách làm việc cụ thể của nhóm mình qua các tuần học như sau:</p>
   
</div>
</div>
 </center>
 </div>
  <div class=" khoangcachtrong" id="nv3">
 	<center><img src="image/NhiemVu/NV3.png" width="" height=""></center>  	 <br>
 	<br>
	 	<center>
		 			<a href="NhatKyNhom/resweek3.jsp" >Kết quả hoàn thành của các thành viên </a> <br>
	 	</center>
 	
  </div>
  <div class=" khoangcachtrong" id="nv4">
 	<center><img src="image/NhiemVu//NV4.png" width="" height=""></center>  	 <br>
 			<center>
		 			<a href="NhatKyNhom/resweek4.jsp" >Kết quả hoàn thành của các thành viên </a> <br>
	 	</center>
  </div>
  <div class=" khoangcachtrong" id="nv5">
 	<center><img src="image/NhiemVu//NV5.png" width="" height=""></center>  	 <br>
 		<center>
		 			<a href="NhatKyNhom/resweek5.jsp" >Kết quả hoàn thành của các thành viên </a> <br>
	 	</center>
  </div>
  <div class=" khoangcachtrong" id="nv6">
 	<center><img src="image/NhiemVu//NV6.png" width="" height=""></center>  	 <br>
 		<center>
		 			<a href="NhatKyNhom/resweek6.jsp" >Kết quả hoàn thành của các thành viên </a> <br>
	 	</center>
  </div>
  <div class=" khoangcachtrong" id="nv7">
 	<center><img src="image/NhiemVu//NV7.png" width="" height=""></center> <br>
 		<center>
		 			<a href="NhatKyNhom/resweek7.jsp" >Kết quả hoàn thành của các thành viên </a> <br>
	 	</center> 	
 	
  </div>
  <div class=" khoangcachtrong" id="nv8">
 	<center><img src="image/NhiemVu//NV8.png" width="" height=""></center>  	
 	<center><a href="NhatKyNhom/resweek8.jsp" >Kết quả hoàn thành của các thành viên </a> <br></center>  	
  </div>
  <div class=" khoangcachtrong" id="nv10">
 	<center><img src="image/NhiemVu//NV10.png" width="" height=""></center>
 	<center><a href="NhatKyNhom/resweek10.jsp" >Kết quả hoàn thành của các thành viên </a> <br></center>  	
  </div>
  <div class=" khoangcachtrong" id="nv12">
 	<center><img src="image/NhiemVu//NV12.png" width="" height=""></center>  	
  </div>
</div>

</body>
</html>
