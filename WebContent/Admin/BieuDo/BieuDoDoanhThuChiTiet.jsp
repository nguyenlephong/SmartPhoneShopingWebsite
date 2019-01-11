<%@page import="admin.model.*"%>
<%@page import="admin.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);
		<%ServletContext con = getServletContext();
		String nsx = (String)con.getAttribute("bieuDoTenNSX");
		if(nsx==null||nsx.equals("Apple")){
			nsx="Iphone";
		}
		
		ArrayList<BangDoanhThuChiTiet> list = new BieuDoDAO().duLieuBangDoanhThuChiTiet(nsx);
		%>
      
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Sản phẩm', 'Giá trị tồn kho', 'Giá trị bán được', 'Giá trị xuất'],
          <%for(int i=0;i<list.size()-1;i++){%>
          ['<%out.print(list.get(i).getTenSP());%>', <%out.print(list.get(i).getGiaTriChuaBanDuoc());%>, <%out.print(list.get(i).getGiaTriBanDuoc());%>, <%out.print(list.get(i).getGiaTriXuat());%>],
          <%}%>
          ['<%out.print(list.get(list.size()-1).getTenSP());%>', <%out.print(list.get(list.size()-1).getGiaTriChuaBanDuoc());%>, <%out.print(list.get(list.size()-1).getGiaTriBanDuoc());%>, <%out.print(list.get(list.size()-1).getGiaTriXuat());%>]
        ]);

        var options = {
          chart: {
            title: 'Biểu đồ thể hiện chi tiết doanh thu của từng sản phẩm',
            subtitle: 'Giá trị tồn kho, Giá trị bán được, giá trị xuất kho: ',
          },
          bars: 'horizontal' // Required for Material Bar Charts.
        };

        var chart = new google.charts.Bar(document.getElementById('barchart_material'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="barchart_material" style="width: 900px; height: 500px;"></div>
  </body>
</html>