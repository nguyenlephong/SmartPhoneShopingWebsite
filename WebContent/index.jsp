<%@page import="dao.DaNgonNguDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <title></title>
<meta name="description" content="">
<meta name="keywords" content="">
    <meta name="author" content="">
    <!-- Mobile Specific Metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
    <meta http-equiv="x-ua-compatible" content="IE=9">
    <!-- Font Awesome -->
    <link href="stylesheets/font-awesome.css" rel="stylesheet">
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
    <!--headerIncludes-->
    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="stylesheets/menu.css">
    <link rel="stylesheet" href="stylesheets/flat-ui-slider.css">
    <link rel="stylesheet" href="stylesheets/base.css">
    <link rel="stylesheet" href="stylesheets/skeleton.css">
    <link rel="stylesheet" href="stylesheets/landings.css">
    <link rel="stylesheet" href="stylesheets/main.css">
    <link rel="stylesheet" href="stylesheets/landings_layouts.css">
    <link rel="stylesheet" href="stylesheets/box.css">
    <link rel="stylesheet" href="stylesheets/pixicon.css">
    <link rel="stylesheet" href="stylesheets/my.css">
    <link href="assets/css/animations.min.css" rel="stylesheet" type="text/css" media="all" />
    
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!-- Favicons
    ================================================== -->
    <link rel="shortcut icon" href="image/favicon.ico">
    <link rel="apple-touch-icon" href="image/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="image/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="image/apple-touch-icon-114x114.png">
 
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

<%if(application.getAttribute("taiKhoanDaDangNhap")==null){
	List<String> ds = new ArrayList<>();
	application.setAttribute("taiKhoanDaDangNhap", ds);
}%>
<%session.setAttribute("ngonngu", DaNgonNguDAO.vietNam()); %>
<div class="pixfort_normal_1 pix_builder_bg" id="section_header_3_dark" data-selector=".pix_builder_bg" style="outline-offset: -3px;">
        <div class="header_style header_nav_1 dark">
            <div class="container">
                <div class="sixteen columns firas2">
                    <nav role="navigation" class="navbar navbar-white navbar-embossed navbar-lg pix_nav_1">
                        <div class="containerss">
                            <div class="navbar-header">
                                <button data-target="#navbar-collapse-02" data-toggle="collapse" class="navbar-toggle" type="button">
                                    <span class="sr-only">Toggle navigation</span>
                                </button>
                                <img src="image/logo fit (1).png"  width="55" height="55"   class="pix_nav_logo" alt="" data-selector="img">                
                            </div>
                            <div id="navbar-collapse-02" class="collapse navbar-collapse">
                                <ul class="nav navbar-nav navbar-right">
                                    <li class="active propClone"><a href="#section_corporate_3" data-selector="nav a, a.edit, nav .text_span" style="color: rgb(204, 204, 204); font-weight: bold; text-transform: none; font-size: 15px;" class="animate-in" data-anim-type="fade-in" data-anim-delay="">Thông Tin</a></li>
                                    <li class="propClone"><a href="#section_shop_4" data-selector="nav a, a.edit, nav .text_span" style="color: rgb(204, 204, 204); font-weight: bold; text-transform: none; font-size: 15px;" class="animate-in" data-anim-type="fade-in" data-anim-delay="">Ứng dụng</a></li>
                                    <li class="propClone"><a href="#section_app_3" data-selector="nav a, a.edit, nav .text_span" style="color: rgb(204, 204, 204); font-weight: bold; text-transform: none; font-size: 15px;" class="animate-in" data-anim-type="fade-in" data-anim-delay="">Dịch Vụ</a></li>
                                    <li class="propClone"><a class="" href="sanpham.jsp" data-selector="nav a, a.edit, nav .text_span"><span class="pix_header_button pix_builder_bg" data-selector=".pix_builder_bg">Mua Ngay</span></a></li>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </div><!-- /.container -->
                    </nav>
                </div>
            </div><!-- container -->
        </div>
    </div>

<div id="page" class="page">
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 carousel slide" id="myCarousel" data-ride="carousel">
			
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="image/05_05_2017_16_31_53_Samsung-S8-1-800-300.png" width="100%" height="70%" alt="Chania">
    </div>

    <div class="item">
      <img src="image/12_05_2017_16_16_18_Asus-Zenfone-800-300.png" width="100%" height="70%" alt="Chania">
    </div>

    <div class="item">
      <img src="image/17_05.gif" width="100%" height="70%"  alt="Flower">
    </div>

    <div class="item">
      <img src="image/23_05.png" width="100%" height="70%" alt="Flower">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

		</div>

	</div>


    <div class="pixfort_normal_1 creative_video_header" id="section_pix_4">
        <div class="has-video creative_header">
            <div class="mask"></div>
                <div class="pix_video_div section_video">
                    <video autoplay="" poster="image/video/video_bg.jpg" class="bgvid" loop="">
                        <source src="image/video/video_bg.webm" type="video/webm">
                        <source src="image/video/video_bg.mp4" type="video/mp4">
                        <source src="image/video/video_bg.ogv" type="video/ogv">
                    </video>
                </div>
                <div class="section_wrapper clearfix">
                    <div class="container">
                        <div class="sixteen columns context_style">
                            <div class="title_style">
                                <span class="editContent"><em><strong>Shopphone's</strong></em><span class="pix_text"></span></span>
                            </div>
                            <div class="subtitle_style">
                                <span class="creative_h_text">
                                    <span class="editContent"><strong>Với hơn 500 sản phẩm điện thoại thông minh duy nhất trên thị trường cùng với nhiều chức năng và thiết kế tuyệt vời .Shopphone's  hứa hẹn sẽ đem đến cho bạn những trải nghiệm chưa từng có. </strong><span class="pix_text"></span></span>
                                </span>
                            </div>
                        <div class="email_subscribe pix_builder_bg">
                            <form id="contact_form" pix-confirm="hidden_pix_1" _lpchecked="1">
                                <input type="email" name="email" id="email" placeholder="Nhập Địa Chỉ Email Của Bạn" class="pix_text">
                                <button class="subscribe_btn pix_text" id="subscribe_btn_1">ĐĂNG KÝ NGAY</button>
                                <div id="result"></div>
                            </form>
                        </div>
                        <div class="note_st">
                            <span class="creative_note"><span class="editContent"><strong>Hãy theo dõi chúng tôi để nhận được những sản phẩm tốt nhất .</strong><span class="pix_text"></span></span></span>
                        </div>
                    </div>
                </div><!-- container -->
            </div>
        </div>
    </div>
    <div id="hidden_pix_1" class="confirm_page confirm_page_1 pix_builder_bg" style="display: none;">
        <div class="pixfort_normal_1">
            <div class="confirm_logo">
                <span class="conf_img">
                    <img src="image/video/confirm1.png" alt="">
                </span>
            </div>
            <div class="confirm_header">
                <span class="editContent"><strong><em>Cảm ơn bạn đã đăng ký </em></strong></span>
            </div>
            <div class="confirm_text">
                <span class="editContent"><span class="pix_text"><strong>Chúc bạn có một trải nghiệm tuyệt vời </strong></span></span>
            </div>
            <div class="confirm_social">
                
            </div>
        </div>
    </div>
    <div class="section_pointer" pix-name="video"></div><div class="pixfort_corporate_2" id="section_corporate_3">
		<div class="adv_st pix_builder_bg">
			<div class="container">
				<div class="sixteen columns">
					<div class="four columns  alpha">
						<img src="image/2_corporate/1.png" alt="">
						<div class="head_style">
							<span class="editContent"><span class="pix_text"><strong>Tính Toán </strong></span></span>
						</div>
            			<div class="c_style">
                			<span class="editContent"><span class="pix_text">
Với sản phẩm của chúng tôi, bạn có thể tính toán mọi lúc, mọi nơi với kết quả chính xác nhất</span></span>
            			</div>
	       			</div>
					<div class="four columns  ">
					    <img src="image/2_corporate/2.png" alt="">
					    <div class="head_style"><span class="editContent"><span class="pix_text">Mail</span></span></div>
					    <div class="c_style">
					        <span class="editContent"><span class="pix_text">Những bức thư quan trọng sẽ tự động được cập nhật trên chiếc điện thoại của bạn</span></span>
					    </div>
					</div>
					<div class="four columns  ">
					    <img src="image/2_corporate/3.png" alt="">
					    <div class="head_style"><span class="editContent">Bạn Bè</span></div>
					    <div class="c_style">
					        <span class="editContent"><span class="pix_text">Thả ga chém gió cùng bạn bè gần xa ma không lo hết pin</span></span>
					    </div>
					</div>

					<div class="four columns  omega">
					    <img src="image/2_corporate/4.png" alt="">
					    <div class="head_style"><span class="editContent"><span class="pix_text">Kết Nối</span></span></div>
					    <div class="c_style">
					        <span class="editContent"><span class="pix_text">Kết nối sóng Wifi, 3G,4G điện thoại cực kì mạnh sẽ giúp bạn có những trải nghiệm tuyệt vời khi sử dụng internet</span></span>
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div><div class="pixfort_shop_7" id="section_shop_4">

		<div class="new_story pix_builder_bg">
			<div class="container">
				<div class="sixteen columns">
					<div class="eight columns alpha">
						<div class="zone_left">
							<div class="icon-1_st"> <img src="image/7_shop_products/icon-1.png" class="icon_st" alt=""></div>
							<div class="text_st">
								<p class="title_st editContent"><strong>Chất Lượng Cao</strong></p>
								<p class="subject_st editContent">Màn hình cảm ứng siêu mỏng cùng với kính cường lực sẽ đảm bảo cho điện thoại bạn không bị hư hỏng trong một thời gian dài</p>
							</div>
						</div>

						<div class="clearfix"></div>

						<div class="zone_left">
							<div class="icon-2_st"> <img src="image/7_shop_products/icon-2.png" class="icon_st" alt=""></div>
							<div class="text_st">
								<p class="title_st editContent"><strong>Tốc Độ Cao</strong></p>
								<p class="subject_st editContent">Chip xử lý đời mới sẽ đem lại cho bạn một tốc độ khó tin đấy</p>
							</div>
						</div>
						<div class="clearfix"></div>

						<div class="zone_left">
							<div class="icon-3_st"> <img src="image/7_shop_products/icon-3.png" class="icon_st" alt=""></div>
							<div class="text_st">
								<p class="title_st editContent"><strong>Giá Cả Tốt Nhất</strong></p>
								<p class="subject_st editContent">Gia cả thì hoàn toàn phù hợp với túi tiền của bạn .</p>
							</div>
						</div>
					</div>

					<div class="eight columns omega">
						<div class="pict_st">
							<img src="image/7_shop_products/ipad.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><div class="pixfort_app_3" id="section_app_3">
		<div class="amazing_style pix_builder_bg">
			<div class="container">
				<div class="eight columns alpha">
					<img src="image/3_app/hero_1.png" class="amazing_img4_st" alt="">
        		</div>
        		<div class="eight columns  omega">
    		    	<div class="amazing_text_style">
        				<p class="amaz_tit editContent"><strong>Điều Tuyệt Vời Nhất Là Đây</strong></p>
        				<p class="amaz_subtit editContent">Dịch vụ hỗ trợ, bảo hành của chúng tôi hoàn toàn miễn phí và nhanh chóng</p>
                    	<p class="amaz_text editContent">Quan điểm của chúng tôi là luôn đặt khách hàng lên hàng đầu. Chúng tôi quan tâm đến chất lượng sản phẩm, sự hài lòng của khách hàng hơn mọi thứ. Hãy Tin Tưởng Sản Phẩm Của Chúng Tôi</p>
                    	<p class="amaz_text editContent">Bạn có thể cài đặt miễn phí hoàn toàn những ứng dụng khi đến cửa hàng của chúng tôi</p>
                    	<div class="suite">
                        	<img src="image/3_app/overview_design_notification_icon.png" class="img2_st" alt="">
                        	<div class="text2_style">
                				<p class="tit2 editContent"><strong>Những ứng dụng tuyệt vời cho bạn </strong></p>
                				<p class="txt_st editContent"></p>
                        	</div>
                    	</div>
  	            	</div>
    			</div>
			</div>
		</div>
	</div>
<div class="pixfort_ebook_9" id="section_ebook_4">
        <div class="writers_section pix_builder_bg">
            <div class="container">
                <div class="sixteen columns">
                    <h2 class="title_st editContent">Nhóm Chúng Tôi</h2>
                    <div class="eight columns alpha">
                        <div class="b_style">
                            <img src="image/ThanhVien/phongok.png"  class="logo_style"  width="155" height="155" alt="">
                        </div>
                        <div class="author_text">
                            <h1 class="name_st editContent">Nguyễn Lê Phong</h1>
                            <h6 class="job_st editContent">CEO &amp; Founder,Leader at Shopphone</h6>
                            <p class="details_st editContent">Xin chào các bạn, mình là sinh viên khoa CNTT trường ĐH Nông Lâm. Mình rất yêu thích lập trình Web. Ước mơ sau này của mình là xây dựng những hệ thống Web Lớn. </p>
                            
                            <div class="icons_st">
                                <span><a href="#" class="slow_fade social_button"><img src="image/social_icons/yt.png"></a></span>
                                <span><a href="#" class="slow_fade social_button"><img src="image/social_icons/twitter.png"></a></span>
                                <span> <a href="#" class="slow_fade social_button"><img src="image/social_icons/facebook.png"></a></span>
                            </div>
                        </div>
                    </div>
            <div class="eight columns alpha">
                        <div class="b_style">
                            <img src="image/ThanhVien/khoa.png"  width="155" height="155"  class="logo_style" alt="">
                        </div>
                        <div class="author_text">
                            <h1 class="name_st editContent">Đàm Quang Khoa</h1>
                            <h6 class="job_st editContent">CEO &amp; Founder at Shopphone</h6>
                            <p class="details_st editContent">Xin chào các bạn, mình là sinh viên khoa CNTT trường ĐH Nông Lâm. Mình rất yêu thích lập trình ứng dụng. Ước mơ sau này của mình là trở thành 1 kiến trúc sư phần mềm.</p>
                            <div class="icons_st">
                                <span><a href="#" class="slow_fade social_button"><img src="image/social_icons/yt.png"></a></span>
                                <span><a href="#" class="slow_fade social_button"><img src="image/social_icons/twitter.png"></a></span>
                                <span> <a href="#" class="slow_fade social_button"><img src="image/social_icons/facebook.png"></a></span>
                            </div>
                        </div>
                    </div>
                
                    <div class="eight columns alpha">
                        <div class="b_style">
                            <img src="image/ThanhVien/nga.png" width="155" height="155" class="logo_style" alt="">
                        </div>
                        <div class="author_text">
                            <h1 class="name_st editContent">Huỳnh Phước Ngà</h1>
                            <h6 class="job_st editContent">CEO &amp; Founder at Shopphone</h6>
                            <p class="details_st editContent">Xin chào các bạn, mình là sinh viên khoa CNTT trường ĐH Nông Lâm. Mình rất yêu thích hệ thống thông tin. Ước mơ sau này của mình là quản lí những hệ thống thông tin lớn.</p>
                            <div class="icons_st">
                                <span><a href="#" class="slow_fade social_button"><img src="image/social_icons/yt.png"></a></span>
                                <span><a href="#" class="slow_fade social_button"><img src="image/social_icons/twitter.png"></a></span>
                                <span> <a href="#" class="slow_fade social_button"><img src="image/social_icons/facebook.png"></a></span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="eight columns omega">
                        <div class="b_style">
                            <img src="image/ThanhVien/hau.png" width="155" height="155" class="logo_style" alt="">
                        </div>
                        <div class="author_text">
                            <h1 class="name_st editContent">Nguyễn Tấn Hậu</h1>
                            <h6 class="job_st editContent">CEO &amp; Founder at Shopphone</h6>
                            <p class="details_st editContent">Xin chào các bạn, mình là sinh viên khoa CNTT trường ĐH Nông Lâm. Mình rất yêu thích lập trình Backend. Ước mơ sau này của mình là trở thành kỹ sư hệ thống.</p>

                            <div class="icons_st">
                                <span><a href="#" class="slow_fade social_button"><img src="image/social_icons/yt.png"></a></span>
                                <span><a href="#" class="slow_fade social_button"><img src="image/social_icons/twitter.png"></a></span>
                                <span> <a href="#" class="slow_fade social_button"><img src="image/social_icons/facebook.png"></a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="pixfort_hotel_5" id="section_hotel_6">
		<div class="logos_section pix_builder_bg" deluminate_imagetype="png">
			<div class="container">
				<div class="sixteen columns logos_style">
					<h3 class="L1_style editContent">Great people trusted our services</h3>
					<p class="L2_style editContent">great words from great people</p>
					<div class="four columns logos_st alpha"><img src="image/nonglam.png" width="100px" height="100px" alt=""> </div>
					<div class="four columns logos_st"><img src="image/logo fit (1).png" width="100px" height="100px" alt=""> </div>
				</div>
			</div>
		</div>
	</div></div>

<!-- JavaScript
================================================== -->
<script src="js-files/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="js-files/jquery.easing.1.3.js" type="text/javascript"></script>
<script type="text/javascript" src="js-files/jquery.common.min.js"></script>
<script src="js-files/ticker.js" type="text/javascript"></script>
<script src="js-files/custom1.js" type="text/javascript"></script>
<script src="assets/js/smoothscroll.min.js" type="text/javascript"></script>
<script src="assets/js/appear.min.js" type="text/javascript"></script>
<script src="js-files/jquery.ui.touch-punch.min.js"></script>
<script src="js-files/bootstrap.min.js"></script>
<script src="js-files/bootstrap-switch.js"></script>
<script src="js-files/custom3.js" type="text/javascript"></script>


<script src="assets/js/appear.min.js" type="text/javascript"></script>
<script src="assets/js/animations.js" type="text/javascript"></script>
</body>	
</html>
