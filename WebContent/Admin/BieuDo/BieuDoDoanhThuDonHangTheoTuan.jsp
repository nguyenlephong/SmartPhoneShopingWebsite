<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<%
    String t = (String) session.getAttribute("wd1");
    String week = (String) session.getAttribute("week");
    String text = (String) session.getAttribute("text");
    Map<String,DonHang> list= null;
    if(t==null){
  	  t="none";
    }
    if(t.equals("none")){
		 list= new ThongKeDAO().getDonHangTheoTuanHeThong();
		 if(list!=null || list.size()!=0){%>
			<script type="text/javascript">
		      google.charts.load("current", {packages:["corechart"]});
		      google.charts.setOnLoadCallback(drawChart);
		      function drawChart() {
		        var data = google.visualization.arrayToDataTable([
		          ['Task', 'Hours per Day'],
		          ['Huawei',      <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoTuanHeThong("Huawei"));%>],
		          ['Oppo', <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoTuanHeThong("Oppo"));%>],
		          ['Iphone',  <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoTuanHeThong("Iphone"));%>],
		          ['Sony', <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoTuanHeThong("Sony"));%>],
		          ['SamSung',   <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoTuanHeThong("SamSung"));%>]
		        ]);

		        var options = {
		          title: 'Bảng đồ thể hiện số đơn hàng trong tuần',
		          is3D: true,
		        };

		        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
		        chart.draw(data, options);
		      }
		      </script>
	<%} 
		 }else {
    	list=new ThongKeDAO(week,text).getDonHangTheoTuan(week,text);
    	if(list!=null || list.size()!=0){%>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['HTC',    <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoTuan("HTC"));%>],
          ['Huawei',      <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoTuan("Huawei"));%>],
          ['Oppo', <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoTuan("Oppo"));%>],
          ['Iphone',  <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoTuan("Iphone"));%>],
          ['Sony', <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoTuan("Sony"));%>],
          ['SamSung',   <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoTuan("SamSung"));%>]
        ]);

        var options = {
          title: 'Bảng đồ thể hiện số đơn hàng trong tuần',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
      </script>
      <%}}%>
	

</head>
<body>
	<div id="piechart_3d" style="width: 430px; height: 300px;"></div>
</body>
</html>