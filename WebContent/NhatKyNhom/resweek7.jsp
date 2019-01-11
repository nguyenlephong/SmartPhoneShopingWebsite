<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Kết quả hoàn thành tuần 7</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
    .khoangcach{
      margin-top: 40px;

    }
    .khoangcachtrong{
      margin-top: 40px;
      padding-top: 60px;
    }
    h3, h4 {
      margin: 10px 0 30px 0;
      font-size: 20px;
      color: #111;
    }
    .container {
      padding: 80px 120px;
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
        <a class="navbar-brand" href="../index.jsp">Trang chủ</a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
          <li class="active"><a href="../nhatkynhom.jsp">Nhiệm vụ tuần</a></li>
          <li><a href="#hpn">Huỳnh Phước Ngà</a></li>
          <li><a href="#nlp">Nguyễn Lê Phong</a></li>
          <li><a href="#nth">Nguyễn Tấn Hậu</a></li>
          <li><a href="#dqk">Đàm Quang Khoa</a></li>

        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="http://adminshopphone.azurewebsites.net/TrangChu.jsp"><span class="glyphicon glyphicon-user"></span> Trang admin</a></li>
          <li><a href="http://adminshopphone.azurewebsites.net"><span class="glyphicon glyphicon-log-in"></span> Đăng ký admin</a></li>
        </ul>
        <a href="http://ood2017-group01.blogspot.com/"> <button class="btn btn-danger navbar-btn">Blog Project TKHĐT</button></a>
      </div>

    </div>
  </nav>
  
  <center><h1 style="color: red;margin-top: 100px">Kết quả hoàn thành nhiệm vụ tuần 7</h1></center>
<div class="khoangcachtrong" id="nth">
  <center><h2><strong>Nguyễn Tấn Hậu</strong></h2>
   <h2><strong>Kết quả:</strong></h2></center>
   <center><img src="../img/phieumuahang7.png" width="" height=""></center>  
   <center><img src="../img/giohang7.png" width="" height=""></center>  

   <center><h2>Code hiện thực:</h2>
     <img src="../img/giohang7code.png">
   </center>  
  
 </div>
 <div class=" khoangcachtrong" id="nlp">
   <center><strong> <h2>Nguyễn Lê Phong</h2></strong>
     <h2><strong>Kết quả:</strong></h2></center>
     <center>
        <img src="../img/sanpham7.png" width="" height="">
     </center>    
     <center><h2>Code hiện thực:</h2>
        <img src="../img/sanpham7code.png" width="" height="">
     </center>
   </div>
   <div class=" khoangcachtrong" id="dqk">
    <center><h2><strong>Đàm Quang Khoa</strong></h2>
      <h2><strong>Kết quả:</strong></h2>
      <img src="../img/hoidapadmin7.png">
      <h5>Hỏi đáp</h5></center>
      <center><img src="../img/hoidap7code.png" width="" height=""> </center>  

     </div>
     <div class=" khoangcachtrong" id="hpn">
      <center> <h2><strong>Huỳnh Phước Ngà</strong></h2>
       <center><h2>Code hiện thực:</h2>
          <img src="../img/loctheogiacode6.png">
       </center>
     </div>

   </div>

 </body>
 </html>
