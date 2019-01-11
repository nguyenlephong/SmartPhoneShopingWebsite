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
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
  	<%ArrayList<BangTinhTrangKho> list=new BieuDoDAO().duLieuBang(); %>
      function drawChart() {
    	
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['HTC',    <% out.print(list.get(1).getGiaTriBanDuoc());%>],
          ['Huawei',      <% out.print(list.get(2).getGiaTriBanDuoc());%>],
          ['LG',  <% out.print(list.get(3).getGiaTriBanDuoc());%>],
          ['Oppo', <% out.print(list.get(4).getGiaTriBanDuoc());%>],
          ['Apple',  <% out.print(list.get(0).getGiaTriBanDuoc());%>],
          ['Sony', <% out.print(list.get(6).getGiaTriBanDuoc());%>],
          ['SamSung',   <% out.print(list.get(5).getGiaTriBanDuoc());%>]
        ]);

        var options = {
          title: 'Bảng đồ thể hiện doanh thu của các hãng sản xuất',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="piechart_3d" style="width: 430px; height: 300px;"></div>
  </body>
</html>