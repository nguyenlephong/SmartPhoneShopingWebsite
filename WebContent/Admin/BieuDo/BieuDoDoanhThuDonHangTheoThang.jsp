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
    String t = (String) session.getAttribute("td1");
    String date = (String) session.getAttribute("month1");
    Map<String,DonHang> list= null;
    if(t==null){
  	  t="none";
    }
    if(t.equals("none")){
		 list= new ThongKeDAO().getDonHangTheoThangHeThong();
		 if(list!=null || list.size()!=0){%>
			<script type="text/javascript">
		      google.charts.load("current", {packages:["corechart"]});
		      google.charts.setOnLoadCallback(drawChart);
		      function drawChart() {
		        var data = google.visualization.arrayToDataTable([
		          ['Task', 'Hours per Day'],
		          ['Huawei',      <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoThangHeThong("Huawei"));%>],
		          ['Oppo', <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoThangHeThong("Oppo"));%>],
		          ['Iphone',  <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoThangHeThong("Iphone"));%>],
		          ['Sony', <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoThangHeThong("Sony"));%>],
		          ['SamSung',   <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoThangHeThong("SamSung"));%>]
		        ]);

		        var options = {
		          title: 'Bảng đồ thể hiện số đơn hàng trong tháng',
		          is3D: true,
		        };

		        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
		        chart.draw(data, options);
		      }
		      </script>
	<%} 
		 }else {
    	list=new ThongKeDAO(date).getDonHangTheoThang(date);
    	if(list!=null || list.size()!=0){%>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['HTC',    <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoThang("HTC"));%>],
          ['Huawei',      <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoThang("Huawei"));%>],
          ['Oppo', <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoThang("Oppo"));%>],
          ['Iphone',  <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoThang("Iphone"));%>],
          ['Sony', <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoThang("Sony"));%>],
          ['SamSung',   <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHangTheoThang("SamSung"));%>]
        ]);

        var options = {
          title: 'Bảng đồ thể hiện số đơn hàng trong tháng',
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