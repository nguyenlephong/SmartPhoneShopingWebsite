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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  	<%
    if(session.getAttribute("knd1")!=null && session.getAttribute("knd2")!=null){
        Date d1 =(Date)session.getAttribute("knd1");
        Date d2 =(Date)session.getAttribute("knd2");
	  	Map<String,DonHang> list= new ThongKeDAO(d1,d2).mapDonHangThongKe; if(list!=null || list.size()!=0){%>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Huawei',      <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHang("Huawei"));%>],
          ['Oppo', <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHang("Oppo"));%>],
          ['Iphone',  <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHang("Iphone"));%>],
          ['Sony', <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHang("Sony"));%>],
          ['SamSung',   <% out.print(new DonHangDAO().soLieuBieuDoDoanhThuDonHang("SamSung"));%>]
        ]);

        var options = {
          title: 'Bảng đồ thể hiện doanh thu của các hãng sản xuất',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
      <%}}%>
    </script>
  </head>
  <body>
    <div id="piechart_3d" style="width: 430px; height: 300px;"></div>
  </body>
</html>